#!/bin/bash

set -e

mkdir -p ~/.local/bin
cp yubikey-agent ~/.local/bin/

mkdir -p ~/.config/systemd/user/
cp contrib/systemd/user/yubikey-agent.service ~/.config/systemd/user/yubikey-agent.service

systemctl daemon-reload --user
# Already enabled on Fedora 41
#sudo systemctl enable --now pcscd.socket
systemctl --user enable --now yubikey-agent


# export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/yubikey-agent/yubikey-agent.sock"
