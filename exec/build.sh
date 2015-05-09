#!/bin/sh

# define env variable
marm='make -j4 ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi-'
BUILD_UBOOT_LOG=build_kernel.log
ERROR_FORMAT=error
PROJ=`pwd`

# define color
BLACK='\033[1;30m'
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
COLOR_NORMAL='\033[m'

# help msg
if [ $# == 0 ]; then
	echo "Usage: build.sh \$1"
	echo "   \$1: k - build uImage from cldtk_m9720_mipi_defconfig"
	echo "   \$1: o - build uImage from old config"
	echo "   \$1: c - clean-up object file"
	exit
fi

# build
if [ "$1" == "k" ] || [ "$1" == "K" ]; then
	echo -e "\n${BLUE}Building kernel...${COLOR_NORMAL}\n"
	$marm cldtk_m9720_mipi_defconfig
	$marm uImage &> $BUILD_UBOOT_LOG
    echo -e "\n${RED}Check any error in $BUILD_UBOOT_LOG...${COLOR_NORMAL}\n"
	ack -i $ERROR_FORMAT $BUILD_UBOOT_LOG
	echo -e "\n${BLUE}Finish building kernel, copy uImage to ~/tmp${COLOR_NORMAL}\n"
	cp -v arch/arm/boot/uImage ~/tmp/uImage_v2
	echo ""
elif [ "$1" == "o" ] || [ "$1" == "O" ]; then
	$marm uImage &> $BUILD_UBOOT_LOG
	echo -e "\n${RED}Check any error in $BUILD_UBOOT_LOG...${COLOR_NORMAL}\n"
	ack -i $ERROR_FORMAT $BUILD_UBOOT_LOG
	echo -e "\n${BLUE}Finish building kernel, copy uImage to ~/tmp${COLOR_NORMAL}\n"
	cp -v arch/arm/boot/uImage ~/tmp/uImage_v2
	echo ""
elif [ "$1" == "c" ] || [ "$1" == "C" ]; then
	echo -e "\n${BLUE}Clean up object file... ${COLOR_NORMAL}\n"
	$marm distclean
fi
