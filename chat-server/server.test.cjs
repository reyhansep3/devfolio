const assert = require('node:assert/strict');
const { spawn } = require('node:child_process');
const { once } = require('node:events');
const test = require('node:test');
const WebSocket = require('ws');

const token = 'test-owner-token-with-enough-length';

async function startServer() {
  const child = spawn(process.execPath, ['server.cjs'], {
    cwd: __dirname,
    env: { ...process.env, PORT: '0', OWNER_TOKEN: token, ALLOWED_ORIGIN: '' },
    stdio: ['ignore', 'pipe', 'pipe'],
  });
  const port = await new Promise((resolve, reject) => {
    const timeout = setTimeout(() => reject(new Error('Server startup timed out')), 5000);
    child.stdout.on('data', (data) => {
      const match = data.toString().match(/listening on port (\d+)/);
      if (match) {
        clearTimeout(timeout);
        resolve(Number(match[1]));
      }
    });
    child.once('exit', (code) => reject(new Error(`Server exited: ${code}`)));
  });
  return { child, port };
}

async function connect(port, route) {
  const socket = new WebSocket(`ws://127.0.0.1:${port}${route}`);
  await once(socket, 'open');
  return socket;
}

function nextFrame(socket) {
  return once(socket, 'message').then(([data]) => JSON.parse(data.toString()));
}

test('visitor message reaches owner and owner reply reaches the same visitor', async (t) => {
  const { child, port } = await startServer();
  t.after(() => child.kill());
  const health = await fetch(`http://127.0.0.1:${port}/health`);
  assert.deepEqual(await health.json(), { ok: true });

  const owner = await connect(port, '/owner');
  t.after(() => owner.close());
  const readyFrame = nextFrame(owner);
  owner.send(JSON.stringify({ type: 'auth', token }));
  assert.equal((await readyFrame).type, 'ready');

  const visitor = await connect(port, '/chat');
  t.after(() => visitor.close());
  const incoming = nextFrame(owner);
  visitor.send(JSON.stringify({
    type: 'message', sessionId: 'visitor-123', sender: 'visitor', text: 'Hi',
  }));
  assert.deepEqual(await incoming, {
    type: 'message', sessionId: 'visitor-123', sender: 'visitor', text: 'Hi',
  });

  const reply = nextFrame(visitor);
  owner.send(JSON.stringify({
    type: 'message', sessionId: 'visitor-123', text: 'Hello!',
  }));
  assert.deepEqual(await reply, {
    type: 'message', sessionId: 'visitor-123', sender: 'owner', text: 'Hello!',
  });
});

test('owner connection rejects an invalid token', async (t) => {
  const { child, port } = await startServer();
  t.after(() => child.kill());
  const owner = await connect(port, '/owner');
  owner.send(JSON.stringify({ type: 'auth', token: 'wrong' }));
  const [code] = await once(owner, 'close');
  assert.equal(code, 1008);
});
