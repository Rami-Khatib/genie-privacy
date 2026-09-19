# Genie AI — privacy policy

The page served at **https://genie.aladin-tv.com**

It is published separately from the app so the application source can stay
private while the policy stays public, which is what Google Play requires.

The canonical copy lives with the code it describes, in `PRIVACY.md` in the app
repository. If the app changes what it does with data, that file changes first
and this page follows.

English and Arabic. The language sections are shown by CSS driven off a
`data-lang` attribute already present in the markup, so the page renders with
JavaScript disabled — the script only switches between them. A privacy policy
that comes up blank without JS is one a reviewer cannot read.

## Two ways it can be served

**GitHub Pages** (currently live). `CNAME` points the Pages site at
`genie.aladin-tv.com`, and a DNS-only CNAME in Cloudflare points that name at
`rami-khatib.github.io`. Nothing of yours has to be running.

**Your own container on the data server.** `Dockerfile`, `nginx.conf` and
`docker-compose.yml` build a ~50 MB nginx image serving this one page, on the
same Docker network as cloudflared so the tunnel can reach it by container
name, exactly like the other services on that host.

    TUNNEL_NETWORK=<cloudflared's network> docker compose up -d --build

Then the tunnel needs an ingress rule `genie.aladin-tv.com -> http://genie-privacy:80`,
and the Cloudflare DNS record has to change from `rami-khatib.github.io` to the
tunnel (`<tunnel-id>.cfargotunnel.com`, proxied).

Publish nothing to Play until whichever one you choose actually answers: Play
rejects a listing whose privacy policy URL does not load, and it re-checks on
every update.
