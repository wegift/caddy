FROM caddy:2.3.0-builder AS builder

# Metadata
LABEL org.label-schema.vcs-url="https://github.com/wegift/caddy" \
      org.label-schema.docker.dockerfile="/Dockerfile"

RUN xcaddy build \
    --with github.com/silinternational/certmagic-storage-dynamodb@2.0.1

FROM caddy:2.3.0

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
