#!/bin/sh

if [ ! $# = 2 ];then
    echo "Usage: make.sh [recompile] [panda version]"
    echo "recompile: 0 - not to rebuild whole kernel"
    echo "           1 - rebuild kernel"
    echo "panda version: 10 - L27.10.2"
    echo "               12 - L12.12.1"
    echo "               37 - 2.6.37"
    exit
fi

if [ $1 = 1 ]; then
    make -j4 ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- distclean
    if [ $2 = 10 ]; then
        make -j4 ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- android_4430_defconfig
    elif [ $2 = 12 ]; then
        make -j4 ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- panda_defconfig
    elif [ $2 = 37 ]; then
        make -j4 ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- omap2plus_defconfig
    fi
fi

if [ $2 = 37 ]; then
    make -j4 ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- uImage 2>&1 |tee kernel_make.out
    make -j4 ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- modules 2>&1 |tee kernel_modules.out
else
    make -j4 ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- uImage 2>&1 |tee ../../logs/kernel_make.out
    make -j4 ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- modules 2>&1 |tee ../../logs/kernel_modules.out
fi
