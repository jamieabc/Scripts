#!/bin/sh
if [ ! $# = 2 ]; then
    echo "Usage: rename.sh [original name] [new name]"
    exit
fi

find . -name .git -type d -exec rename s/git/git-old/ {} \;
