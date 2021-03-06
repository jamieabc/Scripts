#!/bin/bash

# find git directory
# find . -type d -name .git; do
for dir in `find . -type d -name ".git"`; do
    echo -e "dir is \033[31m $dir \033[m"
    pushd ${dir}
    cd ../
    # popd

    # convert git directory to git repository
    find . -type 'f' | grep -v "\.git\/" | xargs rm
    find . -type 'd' | grep -v "\.git\/" | xargs rmdir
    ln -s $(expr match "$(readlink ./.git/config)" '../\(.*\)') ./config
    ln -s $(expr match "$(readlink ./.git/description)" '../\(.*\)') ./description
    ln -s $(expr match "$(readlink ./.git/hooks)" '../\(.*\)') ./hooks
    ln -s $(expr match "$(readlink ./.git/info)" '../\(.*\)') ./info
    ln -s $(expr match "$(readlink ./.git/logs)" '../\(.*\)') ./logs
    ln -s $(expr match "$(readlink ./.git/objects)" '../\(.*\)') ./objects
    ln -s $(expr match "$(readlink ./.git/packed-refs)" '../\(.*\)') ./packed-refs
    ln -s $(expr match "$(readlink ./.git/refs)" '../\(.*\)') ./refs
    ln -s $(expr match "$(readlink ./.git/rr-cache)" '../\(.*\)') ./rr-cache
    ln -s $(expr match "$(readlink ./.git/svn)" '../\(.*\)') ./svn
    mv .git/HEAD ./
    mv .git/index ./
    rm -rf .git
    git config --bool core.bare true
    popd

done
