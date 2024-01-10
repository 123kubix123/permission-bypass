FROM debian:latest

LABEL org.opencontainers.image.authors="https://github.com/123kubix123"
LABEL org.opencontainers.image.source="https://github.com/123kubix123/permission-bypass"

RUN apt update && apt install -y inotify-tools && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY watch.sh /

RUN chmod +x /watch.sh

ENV DEBUG=false

ENTRYPOINT ["/watch.sh"]