# Devfolio live chat on Render Free

This repository includes a small Node.js WebSocket relay in `chat-server/` and
an owner inbox at `/inbox`. The Flutter visitor widget already speaks its JSON
protocol. Without `CHAT_WS_URL`, the widget remains in honest preview mode.

## Try locally

In `chat-server/`:

```sh
npm ci
export OWNER_TOKEN="$(openssl rand -hex 24)"
printf 'Owner token: %s\n' "$OWNER_TOKEN"
npm start
```

Keep that terminal running. In another terminal, from the repository root:

```sh
flutter run -d chrome --dart-define=CHAT_WS_URL=ws://localhost:8080/chat
```

Open `http://localhost:8080/inbox` in another browser tab and enter the printed
owner token. Unlock the portfolio phone and send a message. Choose the visitor
session in the inbox to reply.

## Deploy the free server

1. Push this repository to GitHub. In the Render dashboard, create a **New
   Blueprint** from this repository. The root `render.yaml` creates one Node
   web service on the **Free** plan.
2. When Render asks for `OWNER_TOKEN`, enter a random value of at least 24
   characters. Generate one with `openssl rand -hex 24` and save it in a
   password manager. Never commit it or put it in `CHAT_WS_URL`.
3. Once deployed, open `https://YOUR-SERVICE.onrender.com/health` and confirm
   it returns `{"ok":true}`. Your visitor WebSocket address is
   `wss://YOUR-SERVICE.onrender.com/chat`. Your private reply page is
   `https://YOUR-SERVICE.onrender.com/inbox`.
4. For GitHub Pages, set the repository Actions variable `CHAT_WS_URL` to that
   `wss://.../chat` address, then rerun **Deploy Flutter Web** or push a new
   commit. For Netlify, set its environment variable `CHAT_WS_URL` to the same
   address and redeploy. Both existing build commands pass it to Flutter.
5. Optional: set Render's `ALLOWED_ORIGIN` environment variable to the exact
   website origin, such as `https://reyhansep3.github.io` (no `/devfolio/`
   path). This limits browser visitor connections to your site.

`CHAT_WS_URL` is public build configuration. `OWNER_TOKEN` is secret and lives
only in Render's server environment and in the owner inbox form. Do not add the
owner token to Flutter, GitHub Pages variables, or Netlify client build vars.

## Message format

Visitor to server:

```json
{"type":"message","sessionId":"visitor-session-id","sender":"visitor","text":"Hi"}
```

Server to the same visitor after an owner replies:

```json
{"type":"message","sessionId":"visitor-session-id","sender":"owner","text":"Hello!"}
```

The two opening bubbles are local introduction text. The server keeps at most
50 conversations with 30 messages each **in memory**. Render Free may sleep
after 15 minutes without inbound traffic; waking it can take about a minute.
Sleeping, restarting, or redeploying clears that in-memory history. Keep the
inbox tab open while you want to reply live; it retries the connection after a
disconnect. This setup is for trying real-time chat, not durable message
delivery.
