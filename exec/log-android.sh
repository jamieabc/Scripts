#!/bin/bash

CURRENT_PATH=$PWD
TMP_PATH=~/tmp/android
DATE=2014-03-28

cat ~/projects-android | while read LINE;
do
    echo $LINE
    DIR=$(echo $LINE | sed 's/^platform\///g')
    DIR1=$(echo $DIR | sed 's/\.\.\/protect\/android\/platform\///g')
    DIR2=$(echo $DIR1 | sed 's/\.\.\/protect\/android\///g')
    # echo -e "\t $DIR1"
    # pushd ${TMP_PATH}/${DIR1}
    pushd $DIR2
    if [ -d .git ] && [[ -n $(git log -p --after='2014-03-28') ]]; then
        mkdir -p ${TMP_PATH}/${DIR2}
        # git log -p --after=${DATE} > ${TMP_PATH}/${DIR2}/modify.patches
        COUNT=$(git log --oneline --after=${DATE} | wc -l)
        git format-patch -${COUNT} HEAD -o ${TMP_PATH}/${DIR2}
    fi
    popd
done
