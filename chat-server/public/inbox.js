const login = document.querySelector('#login');
const tokenInput = document.querySelector('#token');
const status = document.querySelector('#status');
const app = document.querySelector('#app');
const sessionList = document.querySelector('#session-list');
const threadTitle = document.querySelector('#thread-title');
const messages = document.querySelector('#messages');
const reply = document.querySelector('#reply');
const replyText = document.querySelector('#reply-text');

let socket;
let ownerToken = '';
let retryTimer;
let selectedSession = null;
const conversations = new Map();

function render() {
  sessionList.replaceChildren();
  for (const [id, thread] of conversations) {
    const button = document.createElement('button');
    button.type = 'button';
    button.textContent = `${id} · ${thread.length} messages`;
    if (id === selectedSession) button.className = 'active';
    button.addEventListener('click', () => {
      selectedSession = id;
      render();
    });
    sessionList.append(button);
  }
  threadTitle.textContent = selectedSession || 'Choose a conversation';
  messages.replaceChildren();
  for (const message of conversations.get(selectedSession) || []) {
    const bubble = document.createElement('div');
    bubble.className = `message ${message.sender === 'owner' ? 'owner' : ''}`;
    bubble.textContent = message.text;
    messages.append(bubble);
  }
  messages.scrollTop = messages.scrollHeight;
  replyText.disabled = !selectedSession || socket?.readyState !== WebSocket.OPEN;
  reply.querySelector('button').disabled = replyText.disabled;
}

function connect() {
  status.textContent = 'Connecting…';
  const protocol = location.protocol === 'https:' ? 'wss:' : 'ws:';
  const connection = new WebSocket(`${protocol}//${location.host}/owner`);
  socket = connection;
  connection.addEventListener('open', () => {
    connection.send(JSON.stringify({ type: 'auth', token: ownerToken }));
  });
  connection.addEventListener('message', (event) => {
    let data;
    try { data = JSON.parse(event.data); } catch { return; }
    if (data.type === 'ready') {
      conversations.clear();
      for (const [id, thread] of Object.entries(data.conversations)) {
        conversations.set(id, thread);
      }
      status.textContent = 'Connected. Keep this page open to receive new messages.';
      login.style.display = 'none';
      app.style.display = 'flex';
      render();
    } else if (data.type === 'message') {
      const thread = conversations.get(data.sessionId) || [];
      thread.push(data);
      conversations.set(data.sessionId, thread);
      if (!selectedSession) selectedSession = data.sessionId;
      render();
    } else if (data.type === 'error' && data.code === 'visitor_offline') {
      status.textContent = 'That visitor is offline. Your reply was not sent.';
    }
  });
  connection.addEventListener('close', (event) => {
    if (socket !== connection) return;
    if (event.code === 1008) {
      ownerToken = '';
      status.textContent = 'Invalid owner token. Try again.';
      login.style.display = 'block';
      app.style.display = 'none';
      return;
    }
    status.textContent = 'Disconnected. Reconnecting…';
    render();
    if (ownerToken) retryTimer = setTimeout(connect, 5000);
  });
}

login.addEventListener('submit', (event) => {
  event.preventDefault();
  clearTimeout(retryTimer);
  socket?.close();
  conversations.clear();
  selectedSession = null;
  ownerToken = tokenInput.value;
  tokenInput.value = '';
  connect();
});

reply.addEventListener('submit', (event) => {
  event.preventDefault();
  const text = replyText.value.trim();
  if (!text || !selectedSession || socket?.readyState !== WebSocket.OPEN) return;
  socket.send(JSON.stringify({ type: 'message', sessionId: selectedSession, text }));
  replyText.value = '';
});
