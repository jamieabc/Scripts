#!/bin/bash
if [ $# -eq 0 ]; then
    echo "empty docker repository name"
    exit 0
fi

RM="curl -X 'GET' http://192.168.101.29:5000/v1/repositories/vpon/$1/tags"

eval $RM
