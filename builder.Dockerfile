FROM golang:1.18

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y \
  libpcsclite-dev \
  && rm -rf /var/lib/apt/lists/*

CMD ["sh"]
