#!/bin/bash

set -e

# TODO(evert): detect if docker or podman is installed
container_agent=podman

# Build the image required for compiling yubikey-agent
$container_agent build -t yubikey-agent-builder -f builder.Dockerfile .

# Compile yubikey-agent
# Mount with same UID in the container as the host:
#   --userns=keep-id
# To prevent selinux permission denied error:
#   :z on mount

$container_agent run --rm --userns=keep-id --volume "$PWD":/source:z --workdir /source yubikey-agent-builder go build -v

# TODO(evert): remove builder image?
