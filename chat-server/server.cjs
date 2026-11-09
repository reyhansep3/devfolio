const http = require('node:http');
const fs = require('node:fs');
const path = require('node:path');
const { timingSafeEqual } = require('node:crypto');
const { WebSocket, WebSocketServer } = require('ws');

const port = Number(process.env.PORT || 8080);
const ownerToken = process.env.OWNER_TOKEN || '';
const allowedOrigin = process.env.ALLOWED_ORIGIN || '';

if (!ownerToken || ownerToken.length < 24) {
  console.error('Set OWNER_TOKEN to a random value of at least 24 characters.');
  process.exit(1);
}

const inboxHtml = fs.readFileSync(path.join(__dirname, 'public/inbox.html'));
const inboxJs = fs.readFileSync(path.join(__dirname, 'public/inbox.js'));
const conversations = new Map();
const visitors = new Map();
const owners = new Set();
const wss = new WebSocketServer({ noServer: true, maxPayload: 4096 });

function send(socket, payload) {
  if (socket.readyState === WebSocket.OPEN) {
    socket.send(JSON.stringify(payload));
  }
}

function validText(value) {
  return typeof value === 'string' && value.trim().length > 0 &&
    value.trim().length <= 1000;
}

function validSession(value) {
  return typeof value === 'string' && /^[a-zA-Z0-9-]{1,80}$/.test(value);
}

function equalToken(provided) {
  if (typeof provided !== 'string') return false;
  const actual = Buffer.from(ownerToken);
  const candidate = Buffer.from(provided);
  return actual.length === candidate.length && timingSafeEqual(actual, candidate);
}

function record(message) {
  if (!conversations.has(message.sessionId) && conversations.size >= 50) {
    conversations.delete(conversations.keys().next().value);
  }
  const messages = conversations.get(message.sessionId) || [];
  messages.push(message);
  if (messages.length > 30) messages.shift();
  conversations.set(message.sessionId, messages);
}

const server = http.createServer((request, response) => {
  const pathname = new URL(request.url, 'http://localhost').pathname;
  if (request.method === 'GET' && pathname === '/health') {
    response.writeHead(200, { 'Content-Type': 'application/json' });
    response.end(JSON.stringify({ ok: true }));
    return;
  }
  const asset = pathname === '/inbox' ? inboxHtml :
    pathname === '/inbox.js' ? inboxJs : null;
  if (request.method === 'GET' && asset) {
    response.writeHead(200, {
      'Content-Type': pathname === '/inbox' ? 'text/html; charset=utf-8' :
        'text/javascript; charset=utf-8',
      'Cache-Control': 'no-store',
      'Content-Security-Policy': "default-src 'none'; script-src 'self'; style-src 'unsafe-inline'; connect-src 'self' wss: ws:; form-action 'none'; base-uri 'none'",
      'X-Content-Type-Options': 'nosniff',
    });
    response.end(asset);
    return;
  }
  response.writeHead(404).end();
});

server.on('upgrade', (request, socket, head) => {
  const pathname = new URL(request.url, 'http://localhost').pathname;
  if (pathname !== '/chat' && pathname !== '/owner') {
    socket.destroy();
    return;
  }
  if (pathname === '/chat' && allowedOrigin &&
      request.headers.origin !== allowedOrigin) {
    socket.destroy();
    return;
  }
  wss.handleUpgrade(request, socket, head, (connection) => {
    wss.emit('connection', connection, pathname);
  });
});

wss.on('connection', (socket, pathname) => {
  let authenticated = false;
  let sessionId = null;
  let messageCount = 0;
  let windowStart = Date.now();
  const authTimeout = pathname === '/owner' ? setTimeout(() => socket.close(1008), 10000) : null;

  socket.on('message', (frame) => {
    let data;
    try {
      data = JSON.parse(frame.toString());
    } catch {
      send(socket, { type: 'error', code: 'bad_json' });
      return;
    }
    if (!data || typeof data !== 'object') return;

    if (pathname === '/owner') {
      if (!authenticated) {
        if (data.type !== 'auth' || !equalToken(data.token)) {
          socket.close(1008, 'Unauthorized');
          return;
        }
        authenticated = true;
        clearTimeout(authTimeout);
        owners.add(socket);
        send(socket, { type: 'ready', conversations: Object.fromEntries(conversations) });
        return;
      }
      if (data.type !== 'message' || !validSession(data.sessionId) ||
          !validText(data.text)) return;
      const visitor = visitors.get(data.sessionId);
      if (!visitor || visitor.readyState !== WebSocket.OPEN) {
        send(socket, { type: 'error', code: 'visitor_offline', sessionId: data.sessionId });
        return;
      }
      const message = {
        type: 'message', sessionId: data.sessionId, sender: 'owner',
        text: data.text.trim(),
      };
      send(visitor, message);
      record(message);
      for (const owner of owners) send(owner, message);
      return;
    }

    if (data.type !== 'message' || data.sender !== 'visitor' ||
        !validSession(data.sessionId) || !validText(data.text)) return;
    if (sessionId && sessionId !== data.sessionId) return;
    const existing = visitors.get(data.sessionId);
    if (existing && existing !== socket && existing.readyState === WebSocket.OPEN) return;
    const now = Date.now();
    if (now - windowStart > 60000) {
      windowStart = now;
      messageCount = 0;
    }
    if (++messageCount > 10) {
      send(socket, { type: 'error', code: 'rate_limit' });
      return;
    }
    sessionId = data.sessionId;
    visitors.set(sessionId, socket);
    const message = {
      type: 'message', sessionId, sender: 'visitor', text: data.text.trim(),
    };
    record(message);
    for (const owner of owners) send(owner, message);
  });

  socket.on('close', () => {
    clearTimeout(authTimeout);
    owners.delete(socket);
    if (sessionId && visitors.get(sessionId) === socket) visitors.delete(sessionId);
  });
});

server.listen(port, '0.0.0.0', () => {
  console.log(`Chat server listening on port ${server.address().port}`);
});
