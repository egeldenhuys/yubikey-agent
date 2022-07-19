#!/bin/bash

docker build -t yubikey-agent-builder -f builder.Dockerfile .
docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp yubikey-agent-builder go build -v
