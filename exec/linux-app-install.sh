#!/usr/bin/env bash

sudo apt update
sudo apt upgrade -y
sudo apt install rxvt-unicode xsel argon2 openvpn

# haskell
# reference from https://docs.haskellstack.org/en/stable/README/
curl https://get-ghcup.haskell.org -sSf | sh
curl -sSL https://get.haskellstack.org/ | sh
stack update
stack upgrade
stack install hasktags happy stylish-haskell present hlint hoogle hindent
