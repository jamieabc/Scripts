#/usr/bin/env bash

ERROR_CODE=1
SUCCESS_CODE=0

print_help() {
    printf "\n"
    printf "Usage: switch.sh [machine]\n"
    printf "[machine]: mac or remote\n\n"
    exit $ERROR_CODE
}

switch_crypto() {

    machine=$1

    # terminate if machine is not in one of mac/remote
    if [ $machine != "mac" ] && [ $machine != "remote" ]; then
        print_help
    fi

    if [ $machine == "mac" ]; then
        cd ${HOME}/Library/'Application Support'/Bitcoin
        ln -sf bitcoin.mac.conf bitcoin.conf > /dev/null
        cd - 1 > /dev/null
        cd ${HOME}/Library/'Application Support'/Litecoin
        ln -sf litecoin.mac.conf litecoin.conf > /dev/null
        cd - 1 > /dev/null
    else
        cd ${HOME}/Library/'Application Support'/Bitcoin
        cd - 1 > /dev/null
        ln -sf bitcoin.remote.conf bitcoin.conf > /dev/null
        cd ${HOME}/Library/'Application Support'/Litecoin
        ln -sf litecoin.remote.conf litecoin.conf > /dev/null
        cd - 1 > /dev/null
    fi
}

if [ "$#" -ne 1 ]; then
    print_help
fi

switch_crypto $1

exit $SUCCESS_CODE
