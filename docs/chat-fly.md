# Devfolio live chat on Fly.io

The Flutter portfolio stays on GitHub Pages or Netlify. Fly.io runs only the
WebSocket relay and owner inbox in `chat-server/`.

## Deploy

Install `flyctl` and log in with `fly auth login`. From `chat-server/`:

```sh
fly apps create reyhansep3-devfolio-chat
openssl rand -hex 24
fly secrets set OWNER_TOKEN=PASTE_SAVED_TOKEN_HERE
fly deploy --ha=false
```

Save the generated token in a password manager before running `fly secrets set`:
the owner inbox asks for the same value and Fly.io will not show it again. Do
not put it in Flutter build variables.

The app name is globally unique. If it is taken, change `app` in `fly.toml` and
use that name in `fly apps create`. The `--ha=false` flag matters: conversations,
visitor connections, and owner connections live in one process's memory.

Check `https://reyhansep3-devfolio-chat.fly.dev/health` for `{"ok":true}`.
The visitor address is `wss://reyhansep3-devfolio-chat.fly.dev/chat`, and the
private reply page is `https://reyhansep3-devfolio-chat.fly.dev/inbox`. Adjust
these URLs if you chose another app name.

Set GitHub Actions repository variable `CHAT_WS_URL` to the visitor address and
rerun **Deploy Flutter Web**. For Netlify, set its `CHAT_WS_URL` environment
variable and redeploy. The current build commands already pass this value to
Flutter. Optionally restrict visitors to the portfolio origin:

```sh
fly secrets set ALLOWED_ORIGIN=https://reyhansep3.github.io
```

Use the exact origin only, without `/devfolio/`. For a Netlify or custom domain,
use that site's origin instead. The owner token stays only in Fly secrets and
the inbox form.

## Operational limits

This configuration keeps one 256 MB Machine running so live chat stays
responsive. Fly.io bills for running Machines after its short free trial; check
its current pricing before deploying. Message history is held in memory and is
cleared on restart or redeploy. Keep the inbox open while you want to answer;
there is no offline message delivery. To deploy updates, run `fly deploy
--ha=false` again from `chat-server/`.
