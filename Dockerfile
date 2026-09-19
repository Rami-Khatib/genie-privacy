# A static page needs a static server. nginx:alpine is about 50 MB and has no
# application runtime to keep patched.
FROM nginx:1.27-alpine

# Only the page. No CNAME (that file is for GitHub Pages), no README, no git.
COPY index.html /usr/share/nginx/html/index.html
COPY nginx.conf /etc/nginx/conf.d/default.conf

# nginx:alpine already runs as root only for the master process and drops to
# nginx for workers, which is what the upstream image is built to do.

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD wget -q -O /dev/null http://127.0.0.1/ || exit 1

EXPOSE 80
