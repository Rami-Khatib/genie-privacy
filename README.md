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

**A container on the data server** — this is what currently serves the page.
`genie-privacy`, built from the `Dockerfile` here, on `shared-services-net` so
the Cloudflare tunnel reaches it by name like every other service on that host.
No ports are published. DNS for `genie.aladin-tv.com` points at the tunnel.

    TUNNEL_NETWORK=shared-services-net docker compose up -d --build

**GitHub Pages** — still configured and still built, but no longer receiving
traffic, because DNS moved to the tunnel. It stays as a fallback: point the
Cloudflare record back at `rami-khatib.github.io`, DNS-only, and the page is
served again without anything of yours running. The `CNAME` file is what makes
that work, so leave it.

    TUNNEL_NETWORK=<cloudflared's network> docker compose up -d --build

Publish nothing to Play until whichever one you choose actually answers: Play
rejects a listing whose privacy policy URL does not load, and it re-checks on
every update.
