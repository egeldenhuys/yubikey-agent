#!/bin/bash

sudo cp yubikey-agent /usr/local/bin
cp contrib/systemd/user/yubikey-agent.service ~/.config/systemd/user/yubikey-agent.service

systemctl daemon-reload --user
sudo systemctl enable --now pcscd.socket
systemctl --user enable --now yubikey-agent


# export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/yubikey-agent/yubikey-agent.sock"
