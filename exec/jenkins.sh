#!/bin/bash
USER="devadm"
PASSWORD="just4devadm"
CURL="curl -u ${USER}:${PASSWORD}"

# show help message if no argument is specified
if [ $# == 0 ]; then
    echo "Usage: jenkins.sh [target-branch]"
    echo "OPTIONS"
    echo -e "\ts / seed: triggers build for seed generator"
    echo -e "\trewrite: trigger build for rewrite campaign"
fi

if [ "$1" == "seed" ] || [ "$1" == "s" ]; then
    $CURL http://192.168.101.104:8080/job/seed-generator/build?delay=0sec
elif [ "$1" == "rewrite" ] || [ "$1" == "r" ]; then
    $CURL http://192.168.101.104:8080/view/DSL%20Job%20Status/job/DSP-Web-Rewrite-DSL-checkout/build?delay=0sec
elif [ "$1" == "web" ]; then
    $CURL http://192.168.101.104:8080/view/DSL%20Job%20Status/job/DSP-Web-Dev-DSL-checkout/build?delay=0sec
fi
