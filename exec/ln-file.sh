#!/usr/bin/env bash
# coding=UTF-8

for f in /opt/CodeSourcery/Sourcery_CodeBench_Lite_for_ARM_GNU_Linux/bin/*
do
    file=$(echo $f | sed 's/\(.*\)-\(.*\)/\2/g')
    ln -s $f arm-none-linux-gnueabi-$file
    echo $file
done
