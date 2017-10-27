FROM debian:stretch-slim

RUN apt update && apt install -y curl jq

COPY init.sh init.sh

ENTRYPOINT ["/bin/sh", "init.sh"]
