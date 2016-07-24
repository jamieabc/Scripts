#!/bin/sh

if [ -z "$1" ];then
    echo "Usage:"
    echo "  emacs2ram.sh start"
    echo "  emacs2ram.sh restore"
    exit 1
fi

backup=.emacs.d-backup
link=.emacs.d
volatile=/Volumes/RamDisk/.emacs.d-$USER

if [ "$1" == "start" ];then
    IFS=
    set -efu

    cd ~/

    if [ ! -r $volatile ]; then
        mkdir -m0700 $volatile
    fi

    # link -> volatie does not exist
    if [ "$(readlink $link)" != "$volatile" ]; then
        # backup project at first
        mv $link $backup
        # create the link
        ln -s $volatile $link
    fi

    if [ -e $link/.unpacked ]; then
        echo "Sync .emacs.d from memory to backup ..."
        rsync -avq --delete --exclude .unpacked ./$link/ ./$backup/
        echo "DONE!"
    else
        echo "Sync .emacs.d from disk to memory ..."
        rsync -avq ./$backup/ ./$link/
        touch $link/.unpacked
        echo "DONE!"
    fi
else
    echo "Moving .emacs.d back to disk ..."
    cd ~/
    rm $link && mv $backup $link && rm -rf $volatile
    echo "DONE!"
fi
