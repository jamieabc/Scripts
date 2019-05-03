#!/usr/bin/env bash

#  install xcode command tool
xcode-select --install
# check
xcode-select -p

# install brew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)" < /dev/null

# check brew
brew doctor
brew update

# install brew programs
brew tap bitmark-inc/bitmark && brew install zeromq41
brew tap loadimpact/k6 && brew install k6
brew install bazaar readline git wget imagemagick coreutils findutils gnu-tar gnu-sed gawk gnutls gnu-indent gnu-getopt autojump tig htop tree w3m ascii gcc bash-completion ack gpg gpg2 the_silver_searcher ispell cmake surfraw dos2unix doxygen fasd python python3 pstree calcurse ranger tmux reattach-to-user-namespace mongodb terminal-notifier go socat mytop most pandoc fcitx-remote-for-osx grc fish mtr ical-buddy tidy-html5 axel jq ssh-copy-id ansible ffmpeg kafka protobuf mono gnu-tar tldr editorconfig flow httpie mycli go latex2html watchman unrar ripgrep chezscheme percol nvm homebrew/x11/zentify sbcl redis libucl argon2 kubernetes-cli postgresql awscli gnupg gnupg2 carthage gpg-agent graphviz git-quick-stats cloc bat prettyping fzf diff-so-fancy fd autoconf automake gettext libtool noti ponysay aws-shell dep vegeta cask pgcli wdiff colordiff sonarqube sonar-scanner shellcheck berkeley-db4 boost miniupnpc openssl pkg-config qt libevent qrencode dnsmasq hardlink-osx calc ccrypt links lynx irssi mosh p7zip lnav libuv libmicrohttpd hub ghi ansible watch berkeley-db libnet libnids libpcap openssl

# install brew programs with parameters
$(brew --prefix)/opt/fzf/install
brew install wine --without-x11
brew install global --with-ctags --with-pygments
brew install macvim --override-system-vim

# install cask
brew install caskroom/cask/brew-cask

# cask install apps
brew cask install alfred
brew cask alfred link
brew cask install google-chrome
brew cask install firefox
brew cask install onepassword
brew cask install flash
brew cask install skype
brew cask install mplayerx
brew cask install nally
brew cask install iterm2
brew cask install dropbox
brew cask install caskroom-versions/sublime-text3
brew cask install evernote
brew cask install spotify
brew cask install virtualbox
brew cask install x-mirage
brew cask install colorpicker
brew cask install colorpicker-hex
brew cask install colorpicker-developer
brew cask install simplecap
brew cask install appcleaner
brew cask install audacity
brew cask install rar
brew cask install iina
brew cask install caskroom/versions/java8
brew cask install basictex
brew cask install dozer
brew cask install emacs
# need password
brew cask install teamviewer

# cask install fonts
brew tap caskroom/fonts
brew cask install font-source-code-pro
brew cask install font-fontawesome
brew cask install font-inconsolata-dz-for-powerline

# python programs
python3 -m pip install pygments elpy rope jedi ropemacs elpy rope_py3k jedi haxor-news
python3 -m pip install --user powerline-status powerline-shell

# go programs
mkdir -p ${HOME}/gocode
go get -u golang.org/x/lint/golint
go get -u golang.org/x/tools/cmd/guru
go get -u golang.org/x/tools/cmd/goimports
go get -u golang.org/x/tools/cmd/gorename
go get -u github.com/rogpeppe/godef
go get -u github.com/dougm/goflymake
go get -u github.com/nsf/gocode
go get -u github.com/alecthomas/gometalinter
gometalinter --install --update
go get -u github.com/zmb3/gogetdoc
go get -u github.com/cweill/gotests
go get -u github.com/davidrjenni/reftools/cmd/fillstruct
go get -u github.com/josharian/impl
go get -u github.com/golangci/golangci-lint/cmd/golangci-lint
go get -u github.com/fatih/gomodifytags
go get -u github.com/sourcegraph/go-langserver
go get -u github.com/derekparker/delve/cmd/dlv
cd $GOPATH/pkg/mod/github.com/derekparker/delve@v1.2.0/cmd/dlv/ && make install
go get -u github.com/TrueFurby/go-callvis
cd $GOPATH/src/github.com/TrueFurby/go-callvis && make
go get -u github.com/haya14busa/gopkgs/cmd/gopkgs
go get -u -v github.com/godoctor/godoctor
go install github.com/godoctor/godoctor

# install rvm
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable
rvm use ruby --install --default

# ruby gems
gem install --no-document rubocop scss_lint scss_lint_reporter_checkstyle
gem install --no-document pry pry-doc pry-byebug awesome_print rspec
gem install --no-document ruby-beautify rufo
em install --no-document ruby_parser gherkin cucumber

# install nvm & node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
nvm install node && nvm alias default node

# install node packages
npm install -g js-beautify shelljs jsonlint npm-check-updates jshint jsxhint tern tern-highlight abel babel-eslint bower gulp gulp-cli grunt grunt-cli redmine-cli-modified eslint eslint-plugin-import eslint-plugin-react eslint-plugin-jsx-a11y eslint-plugin-jsx eslint-config-airbnb eslint-plugin-react csslint osprey yarn eslint-plugin-flowtype coffee-script esformatter esformatter-jsx esformatter-remove-trailing-commas i18next-parser prettier @vue/cli @angular/cli eslint-plugin-angular eslint-config-angular tslint-eslint-rules sass-lint wscat typescript forever nodemon http-server react-devtools appium appium-doctor authorize-ios vue-language-server javascript-typescript-langserver truffle ganache-cli
