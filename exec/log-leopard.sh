#!/bin/bash

CURRENT_PATH=$PWD
TMP_PATH=~/tmp/leopard
DATE=2014-02-06

cat ~/projects-leopard | while read LINE;
do
    echo $LINE
    DIR=$(echo $LINE | sed 's/^leopard\///g')
    # DIR1=$(echo $DIR | sed 's/protect\/leopard\/platform\///g')
    DIR2=$(echo $DIR| sed 's/protect\/leopard\///g')
    # echo -e "\t $DIR1"
    # pushd ${TMP_PATH}/${DIR1}
    pushd $DIR2
    if [ -d .git ] && [[ -n $(git log -p --after='2014-02-06') ]]; then
        mkdir -p ${TMP_PATH}/${DIR2}
        git log -p --after='${DATE}' > ${TMP_PATH}/${DIR2}/modify.patches
    fi
    popd
done
