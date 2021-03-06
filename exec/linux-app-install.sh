#!/usr/bin/env bash

cd ~/exec/

sudo apt update
sudo apt upgrade -y
sudo apt install -y curl rxvt-unicode xsel openvpn xdotool zenity ibus libxcb-xtest0 bash-completion resolvconf stunnel4 zsh fonts-firacode build-essential wmctrl python dconf-editor pm-utils htop xclip tmux libsecret-tools texinfo libxpm-dev libjpeg-dev libgif-dev libtiff-dev libgnutls28-dev libncurses5-dev gdebi gdebi-core tig vim apt-transport-https pcmanx-gtk2 libsecret-tools terminator dkms net-tools silversearcher-ag cmake gcc clang gdb valgrind ascii grub-customizer fcitx fcitx-m17n fcitx-table-boshiamy rofi powertop chrome-gnome-shell acpi jq bsdmainutils openssh-server fd-find glslang-tools shellcheck markdown clangd-11 rtags

# build emacs
snap install emacs --beta --classic

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# kubectl
cd $HOME/exec/
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"

chmod u+x ./kubectl

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# fasd
sudo snap install fasd --beta

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
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

# pip for python 2&3
sudo apt update
sudo apt install -y python3-pip

pip3 install --user smdv

# autojump
git clone git://github.com/wting/autojump.git
cd autojump && ./install.py
cd .. && rm -rf autojump

# terminal render markdown
go get github.com/charmbracelet/glow

# rvm
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash

# percol
pip3 install percol

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# blog
snap install hugo

# bat
wget https://github.com/sharkdp/bat/releases/download/v0.17.1/bat_0.17.1_amd64.deb
sudo dpkg -i bat_0.17.1_amd64.deb
rm bat_0.17.1_amd64.deb

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

# gh
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh

# at last time, it might fail because npm has not installed
# markdown preview
npm -g install instant-markdown-d leetcode-cli diff-so-fancy

# gvm
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

# solarized dircolors
# https://github.com/huyz/dircolors-solarized
