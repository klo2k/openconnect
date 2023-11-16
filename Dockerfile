FROM debian:12

LABEL org.opencontainers.image.revision="-"
LABEL org.opencontainers.image.source="https://github.com/klo2k/openconnect"
LABEL org.opencontainers.image.version="-"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y --no-install-recommends \
        openconnect ca-certificates \
        # For ps and pkill
        procps && \
    apt clean

ENTRYPOINT [ "/usr/sbin/openconnect" ]
