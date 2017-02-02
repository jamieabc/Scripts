#!/bin/bash

ssh buildmaster@192.168.101.29 "sh qa/push_to_registry_qa.sh $1"
