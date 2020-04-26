#!/usr/bin/env bash

cd ~/exec/

sudo apt update
sudo apt upgrade -y
sudo apt -y install curl rxvt-unicode xsel argon2 openvpn xdotool zenity ibus libxcb-xtest0 bash-completion resolvconf zsh nodejs stunnel4 zsh cargo fonts-firacode build-essential wmctrl python dconf-tools pm-utils pm-hibernate htop python3-pip xclip tmux libsecret-tools

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# ripgrep
git clone https://github.com/BurntSushi/ripgrep
cd ripgrep
cargo build --release
[ -d $HOME/exec ] && mv ./target/release/rg $HOME/exec/
cd ..
rm -rf ripgrep

# # fd-find
# wget https://github.com/sharkdp/fd/releases/download/v7.4.0/fd-musl_7.4.0_amd64.deb
# sudo dpkg -i fd-musl_7.4.0_amd64.deb
# rm fd-musl_7.4.0_amd64.deb

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

# zinit
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

# haskell
# reference from https://docs.haskellstack.org/en/stable/README/
curl https://get-ghcup.haskell.org -sSf | sh
curl -sSL https://get.haskellstack.org/ | sh
stack update
stack upgrade
stack install hasktags happy stylish-haskell present hlint hoogle hindent

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# markdown preview
npm -g install instant-markdown-d leetcode-cli
pip3 install --user smdv

# autojump
git clone git://github.com/wting/autojump.git
cd autojump && ./install.py
cd .. && rm -rf autojump

# go
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt install golang-go

go get github.com/charmbracelet/glow

# rvm
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash

# gems
# gem install ghi

# python
pip3 instal percol

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# blog
snap install hugo

# terminal
sudo add-apt-repository ppa:gnome-terminator
sudo apt-get update
sudo apt-get install terminator
