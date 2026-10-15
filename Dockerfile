# Any neko v3 app image works: firefox, chromium, brave, google-chrome,
# microsoft-edge, vivaldi, tor-browser, xfce, kde, vlc, ...
ARG NEKO_IMAGE=ghcr.io/m1k1o/neko/firefox:3.1.6
FROM ${NEKO_IMAGE}

# ponytail: Railway has no public UDP, so WebRTC rides one ICE-TCP port through
# a Railway TCP proxy. The proxy's public port is random, so neko listens on
# that port (what it advertises) and socat forwards the proxy's target port to it.
RUN apt-get update && apt-get install -y --no-install-recommends socat && rm -rf /var/lib/apt/lists/*
COPY railway-start /usr/local/bin/railway-start
RUN chmod +x /usr/local/bin/railway-start
CMD ["/usr/local/bin/railway-start"]
