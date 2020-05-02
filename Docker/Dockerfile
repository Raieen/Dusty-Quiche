FROM rust:1.43.0

WORKDIR /src/quiche

RUN git clone --recursive https://github.com/cloudflare/quiche

RUN apt-get clean && apt-get update && apt-get install -y cmake golang perl

CMD ["tail", "-f", "/dev/null"]