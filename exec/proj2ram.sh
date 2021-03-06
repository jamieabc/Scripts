#!/bin/sh

if [ -z "$1" ];then
    echo "Usage:"
    echo "  proj2ram proj-name"
    echo "  proj2ram restore proj-name or proj2ram r proj-name"
    exit 1
fi

if [ ! -d /Volumes/RamDisk ]; then
    echo "RamDisk not exist"
    exit 1
fi

PROJ_PATH=~/Documents/Project/Bitmark

if [ "$1" == "start" ] || [ "$1" == "s" ];then
    backup=$2-backup
    link=$2
    volatile=/Volumes/RamDisk/$2-$USER

    IFS=
    set -efu

    cd $PROJ_PATH

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
        echo "Sync project $2 from memory to backup ..."
        rsync -avq --delete --exclude .unpacked ./$link/ ./$backup/
        echo "DONE!"
    else
        echo "Sync project $2 from disk to memory ..."
        rsync -avq ./$backup/ ./$link/
        touch $link/.unpacked
        echo "DONE!"
    fi
else
    if [ -z "$2" ]; then
        echo "Usage:"
        echo "  proj2ram restore proj-name"
    else
        echo "Moving project $2 back to disk ..."
        backup=$2-backup
        link=$2
        volatile=/Volumes/RamDisk/$2-$USER
        cd $PROJ_PATH
        rm $link && mv $backup $link && rm -rf $volatile
        echo "DONE!"
    fi
fi
