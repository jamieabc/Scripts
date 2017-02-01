#!/bin/bash

if [ $# == 0 ]; then
    echo "please input docker name to push"
    exit
else
    ssh -t buildmaster@192.168.101.29 "sh qa/push_to_registry_from_29_to_qa.sh $1"
fi
