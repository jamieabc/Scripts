#!/usr/bin/env bash

cd ~/exec/

sudo apt update
sudo apt upgrade -y
sudo apt -y install curl rxvt-unicode xsel argon2 openvpn xdotool zenity ibus libxcb-xtest0 bash-completion resolvconf zsh nodejs stunnel4 zsh cargo fonts-firacode build-essential wmctrl

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# ripgrep
git clone https://github.com/BurntSushi/ripgrep
cd ripgrep
cargo build --release
[ -d $HOME/exec ] && mv ./target/release/rg $HOME/exec/
cd ..
rm -rf ripgrep

# fd-find
wget https://github.com/sharkdp/fd/releases/download/v7.4.0/fd-musl_7.4.0_amd64.deb
sudo dpkg -i fd-musl_7.4.0_amd64.deb
rm fd-musl_7.4.0_amd64.deb

# kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod u+x ./kubectl

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# fasd
sudo add-apt-repository ppa:aacebedo/fasd
sudo apt-get update
sudo apt-get install fasd

# zplugin
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

# haskell
# reference from https://docs.haskellstack.org/en/stable/README/
curl https://get-ghcup.haskell.org -sSf | sh
curl -sSL https://get.haskellstack.org/ | sh
stack update
stack upgrade
stack install hasktags happy stylish-haskell present hlint hoogle hindent

# markdown preview
npm -g install instant-markdown-d
pip3 install --user smdv
