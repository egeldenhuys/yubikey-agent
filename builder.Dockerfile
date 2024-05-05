FROM golang:1.22

WORKDIR /source

RUN apt-get update && apt-get install -y \
  libpcsclite-dev \
  && rm -rf /var/lib/apt/lists/*

CMD ["sh"]
