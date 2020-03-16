#!/usr/bin/env bash

go get -u github.com/stamblerre/gocode
go get -u golang.org/x/tools/cmd/...
go get -u github.com/google/pprof
go install golang.org/x/tools/cmd/gorename
go get -u github.com/josharian/impl
go get -u github.com/fatih/gomodifytags
go get -u github.com/davidrjenni/reftools/cmd/fillstruct
go get -u github.com/uudashr/gopkgs/cmd/gopkgs
go get -u golang.org/x/lint/golint
go get -u github.com/rogpeppe/godef
go get -u github.com/dougm/goflymake
go get -u github.com/zmb3/gogetdoc
go get -u github.com/cweill/gotests
GO111MODULE=on go get golang.org/x/tools/gopls@latest
go get -u github.com/go-delve/delve/cmd/dlv
go get -u github.com/TrueFurby/go-callvis
go get -u github.com/golang/mock/gomock
go get -u github.com/golang/mock/mockgen
go get -u github.com/vektra/mockery/cmd/mockery
go get -u github.com/lukehoban/go-outline
go get -u honnef.co/go/tools
go get -u github.com/godoctor/godoctor
go get github.com/securego/gosec/cmd/gosec
go get -u github.com/charmbracelet/glow # render markdown in CLI
