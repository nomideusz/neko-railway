# Deploy and Host Neko on Railway

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template/neko?referralCode=sLjDXb&utm_medium=integration&utm_source=button&utm_campaign=neko)

[Neko](https://github.com/m1k1o/neko) is a self-hosted virtual browser that several people use at once. It runs Firefox (or Chromium, Brave, Edge, Tor Browser, a full desktop…) in a container and streams it to everyone's browser over WebRTC, with sound. One person drives while everyone else watches in sync. Control passes around with a click, and there's a built-in chat. It's the open-source replacement for Rabb.it-style watch parties: movie nights, co-browsing, demos, pair research.

## About Hosting Neko

It's one service and a TCP proxy. There's no database and no volume.

- **WebRTC that works on Railway.** Railway has no public UDP, so this template carries the media over ICE-TCP through a Railway TCP proxy. On boot it looks up the proxy's public address and port and tells Neko to advertise them. Nothing to configure, and no TURN server to run.
- **Password-gated from the first second.** Viewers log in with a generated password. A second, separate admin password lets you take control back, kick people and lock the room. Both are in the Variables tab.
- **Pick your app.** Firefox is the default. To stream a different browser or a whole desktop, set `NEKO_IMAGE` to another [Neko image](https://neko.m1k1o.net/docs/v3/installation/docker-images) and redeploy.

## Common Use Cases

- Watch parties: stream a movie, a match or YouTube to friends in different places, with everyone in sync and voice/chat alongside
- Co-browsing: walk a client or colleague through a site, or shop and plan a trip together, passing control back and forth
- A disposable, isolated browser in the cloud for testing sites or opening links you don't trust on your own machine

## Dependencies for Neko Hosting

- Nothing else: the Neko image bundles the browser, X server, PulseAudio and the WebRTC server

### Deployment Dependencies

- [Neko on GitHub](https://github.com/m1k1o/neko)
- [Neko documentation](https://neko.m1k1o.net/docs/v3/introduction)
- [Template source on GitHub](https://github.com/nomideusz/neko-railway)

### Implementation Details

**Join.** Open the service's Railway domain. Pick any display name and enter `NEKO_MEMBER_MULTIUSER_USER_PASSWORD` from the Variables tab. Share the link and that password with the people you want in the room. Log in with `NEKO_MEMBER_MULTIUSER_ADMIN_PASSWORD` instead to get admin rights.

**Take control.** Click the keyboard icon under the video to request control. The current driver (or an admin) can hand it over. Unmute the video in your browser to hear the sound.

**Plan and resources.** Neko needs about 1 GB of RAM and a full vCPU while it streams, so it needs Railway's Hobby plan or above. It won't fit the Free or Trial plan limits. Raise `NEKO_DESKTOP_SCREEN` to `1920x1080@30` for a sharper picture at the cost of more CPU.

**Bandwidth costs.** Railway bills outbound traffic per GB, and each viewer gets their own stream. EGRESS_LINE

**Nothing is kept.** There's no volume. Every redeploy starts a fresh browser with no history, logins or cookies. That's the point for a watch party or a throwaway browser. Don't use it to stay logged in to accounts you care about.

**Latency.** Media goes over TCP to Railway's proxy, so the picture runs a fraction of a second behind and can stutter on a lossy network. It's fine for watching and browsing, but not for gaming.

**Use it responsibly.** The browser's traffic comes from Railway's IP addresses. Keep the passwords private. Don't use it for anything that breaks Railway's terms or the terms of the sites you open. Streaming paid content to people outside your household may also break that service's terms.

## Why Deploy Neko on Railway?

Railway is a singular platform to deploy your infrastructure stack. Railway will host your infrastructure so you don't have to deal with configuration, while allowing you to vertically and horizontally scale it.

By deploying Neko on Railway, you are one step closer to supporting a complete full-stack application with minimal burden. Host your servers, databases, AI agents, and more on Railway.
