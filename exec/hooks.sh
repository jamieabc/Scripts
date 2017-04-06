#!/bin/bash

if [ -d '.git' ]; then
    pushd .git/hooks
    ln -s ~/Documents/Env-Settings/git-hooks/prepare-commit-msg .
    ln -s ~/Documents/Env-Settings/git-hooks/pre-commit .
    popd
fi
