FROM golang:1.12-alpine as buildstage

# build deps
RUN apk add --no-cache \
      gcc \
      git \
      musl-dev

WORKDIR /build

COPY . .

ENV GO111MODULE=on
RUN go build -v .
RUN ls -lash


################################
FROM alpine

# change these to serve different ports/paths
ENV PORT 8080
ENV ROOT "/app"

# JWT http://jwtbuilder.jamiekurtz.com/
ENV JWT_SECRET qwertyuiopasdfghjklzxcvbnm123456

WORKDIR /app

# Grab the Caddy binary
COPY --from=buildstage /build/caddy .

# Install the config file
ADD Caddyfile .

ENTRYPOINT /app/caddy -conf /app/Caddyfile
