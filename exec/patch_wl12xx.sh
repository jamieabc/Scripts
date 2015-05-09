#!/bin/sh
cd ~/src/wifi/ti/android-wl12xx
if [ ! $# = 2 ]; then
    echo "Usage: patch_wl12xx.sh [build_kernel] [recopy]"
    exit
fi

if [ $2 = 1 ]; then
    #cp -r ../org/compat ../org/compat-wireless-2.6 ../org/wl12xx ./
    rm -rf compat  compat-wireless-2.6  myfs  omap  r3  wl12xx
    #rm -rf compat  compat-wireless-2.6 wl12xx
    cp -r ../org/compat ../org/compat-wireless-2.6 ../org/r3 ../org/wl12xx ../org/omap ./
fi

if [ ! -d logs ]; then
    mkdir logs
fi

export WL12XX_PRJ=`pwd`
cd r3
export WL12XX_PATCHES=`pwd`
cd $WL12XX_PRJ

#export PATH=$PATH:~/Download/arm-2010q1/bin

# Building kernel
pushd omap
if [ $1 = 1 ]; then
    git checkout ff0b9680
    cp $WL12XX_PATCHES/kernel/kernel_config .config
    git am $WL12XX_PATCHES/kernel/*patch
    make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- modules_prepare -j4 # prevent MODPOST failure
    #make modules_prepare -j4 # prevent MODPOST failure
    #make uImage modules -j4
    #make modules -j4 2>&1 |tee $WL12XX_PRJ/logs/x86_kernel_modules.out
    make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- uImage -j4 2>&1 |tee $WL12XX_PRJ/logs/kernel_make.out
    make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- modules -j4 2>&1 |tee $WL12XX_PRJ/logs/kernel_modules.out
fi
popd

# Building wl12xx driver
pushd wl12xx
git reset --hard 392d496
popd
pushd compat-wireless-2.6
git reset --hard f7606f5923e8297
export GIT_COMPAT_TREE=$WL12XX_PRJ/compat
export GIT_TREE=$WL12XX_PRJ/wl12xx
rm -rf ./patches/11-dev-pm-ops.patch
rm -rf ./patches/16-bluetooth.patch
rm -rf ./patches/35-fix-makefile-includes.patch

./scripts/admin-refresh.sh
./scripts/driver-select wl12xx

cp $WL12XX_PRJ/omap/.gitignore .
git add .
git commit -a -m "Initial"
git am $WL12XX_PATCHES/wl12xx/000[^789]*patch
git am $WL12XX_PATCHES/wl12xx/00[12]*patch
#git am $WL12XX_PATCHES/wl12xx/*patch
make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- -j4 KLIB=~/src/ti/panda/L27.12.1-P2/kernel/android-2.6.35 KLIB_BUILD=~/src/ti/panda/L27.12.1-P2/kernel/android-2.6.35 2>&1 |tee $WL12XX_PRJ/logs/driver_make.out
#make -j4 ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- KLIB=$WL12XX_PRJ/omap KLIB_BUILD=$WL12XX_PRJ/omap 2>&1 |tee $WL12XX_PRJ/logs/kernel_make.out
#popd
#
## Build Android FS
#cd 27.11.1/mydroid
#export MYDROID=`pwd`
#repo abandon vanilla
#repo forall -c git checkout -b vanilla
#pushd ./build
#git am --abort
#git am $WL12XX_PATCHES/android/patches/build/*
#popd
#pushd device/ti/blaze
#git am --abort
#git am $WL12XX_PATCHES/android/patches/device.ti.blaze/*
#popd
#pushd external/hostapd
#git am --abort
#git am $WL12XX_PATCHES/android/patches/external.hostapd/*
#popd
#pushd external/openssl
#git am --abort
#git am $WL12XX_PATCHES/android/patches/external.openssl/*
#popd
#pushd external/wpa_supplicant_6
#git am --abort
#git am $WL12XX_PATCHES/android/patches/external.wpa_supplicant_6/*
#popd
#pushd frameworks/base
#git am --abort
#git am $WL12XX_PATCHES/android/patches/frameworks.base/*
#popd
#pushd hardware/libhardware_legacy
#git am --abort
#git am $WL12XX_PATCHES/android/patches/hardware.libhardware_legacy/*
#popd
#pushd system/core
#git am --abort
#git am $WL12XX_PATCHES/android/patches/system.core/*
#popd
#pushd system/netd
#git am --abort
#git am $WL12XX_PATCHES/android/patches/system.netd/*
#popd
#
## Copy applications to complete wireless solution:
#cp -r $WL12XX_PATCHES/android/packages/external/* ./external/
#cp -r $WL12XX_PATCHES/android/packages/hardware/* ./hardware/
#cp ./device/ti/blaze/buildspec.mk.default buildspec.mk
##make clean
##make
#
## Prepare FS
#cd $WL12XX_PRJ
#mkdir myfs; cd myfs
#cp -Rfp $WL12XX_PRJ/27.11.1/mydroid/out/target/product/blaze/root/* .
#cp -Rfp $WL12XX_PRJ/27.11.1/mydroid/out/target/product/blaze/system/ .
#cp -Rfp $WL12XX_PRJ/27.11.1/mydroid/out/target/product/blaze/data/ .
#
## Copy modules from compat
#mkdir ./system/lib/modules
#pushd $WL12XX_PRJ/compat-wireless-2.6
#find . -name "*.ko" -exec cp -f {}  $WL12XX_PRJ/myfs/system/lib/modules/ \;
#popd
#
## Copy modules from kernel (fm_drv.ko, gps_drv.ko, st_drv.ko, bt_drv.ko):
#pushd  $WL12XX_PRJ/omap
#find ./drivers/staging -name "*.ko" -exec cp -v {} $WL12XX_PRJ/myfs \;
#popd
#
#cp $WL12XX_PATCHES/TQS_D_1.7.ini to ./data/
#
##Copy iperf ./system/bin/
#
#cp $WL12XX_PATCHES/init.rc ./init.rc
#
#chmod -R 777 ./*
