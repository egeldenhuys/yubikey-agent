# Does not work on alpine, since gcc is missing when using CGO_ENABLED="1".
# gcc takes longer to download than using the normal image

FROM docker.io/golang:1.22

WORKDIR /source

RUN apt-get update && apt-get install -y \
  libpcsclite-dev \
  && rm -rf /var/lib/apt/lists/*

# for alpine
# RUN apk add --no-cache pcsc-lite-dev gcc

CMD ["sh"]
