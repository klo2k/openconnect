FROM debian:10-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y --no-install-recommends openconnect ca-certificates && \
    apt clean

CMD openconnect --help
