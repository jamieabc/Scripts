#!/usr/bin/env bash

cd ~/exec/

sudo apt update
sudo apt upgrade -y
sudo apt install -y curl rxvt-unicode xsel openvpn xdotool zenity ibus libxcb-xtest0 bash-completion resolvconf zsh nodejs stunnel4 zsh cargo fonts-firacode build-essential wmctrl python dconf-editor pm-utils hibernate htop xclip tmux libsecret-tools texinfo libxpm-dev libjpeg-dev libgif-dev libtiff-dev libgnutls28-dev libncurses5-dev gdebi gdebi-core tig vim apt-transport-https pcmanx-gtk2 libsecret-tools golang terminator dkms

# build emacs
snap install emacs --beta --classic

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
sudo apt-get install -y fasd

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

go get github.com/charmbracelet/glow

# rvm
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash

# gems
gem install ghi

# pip for python 2&3
sudo apt update
sudo apt install -y python3-pip
pip3 instal percol

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# blog
snap install hugo

# bat
wget https://github.com/sharkdp/bat/releases/download/v0.15.1/bat_0.15.1_amd64.deb
sudo gdebi bat_0.15.1_amd64.deb
rm bat_0.15.1_amd64.deb

# white noise
sudo add-apt-repository ppa:costales/anoise
sudo apt update
sudo apt-get install -y anoise anoise-gui anoise-community-extension1 anoise-community-extension2 anoise-community-extension3 anoise-community-extension4

# brave https://brave.com/linux/
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

# fonts
sudo apt-get install -y fonts-moe-standard-song fonts-moe-standard-kai fonts-cns11643-sung fonts-cns11643-kai fonts-arphic-ukai fonts-arphic-uming fonts-arphic-bkai00mp fonts-arphic-bsmi00lp fonts-arphic-gbsn00lp fonts-arphic-gkai00mp fonts-cwtex-ming fonts-cwtex-kai fonts-cwtex-heib fonts-cwtex-yen fonts-cwtex-fs fonts-cwtex-docs fonts-droid-fallback fonts-wqy-microhei fonts-wqy-zenhei xfonts-wqy fonts-hanazono

# veracrypt
sudo add-apt-repository ppa:unit193/encryption
sudo apt update
sudo apt install -y veracrypt

# install source code pro font
FONT_HOME=~/.local/share/fonts
mkdir -p "$FONT_HOME/adobe"

(git clone \
   --branch release \
   --depth 1 \
   'https://github.com/adobe-fonts/source-code-pro.git' \
   "$FONT_HOME/adobe/source-code-pro" && \
fc-cache -f -v "$FONT_HOME/adobe-fonts/source-code-pro")

# screen recorder
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update
sudo apt install -y pavucontrol simplescreenrecorder obs-studio
