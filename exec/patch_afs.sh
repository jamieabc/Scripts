#!/bin/sh

export WL12XX_PRJ=~/src/wifi/ti/android-wl12xx
export WL12XX_PATCHES=~/src/wifi/ti/android-wl12xx/r3

repo abandon vanilla
repo forall -c git checkout -b vanilla
pushd ./build
git am --abort
git am $WL12XX_PATCHES/android/patches/build/*
popd
pushd device/ti/blaze
git am --abort
git am $WL12XX_PATCHES/android/patches/device.ti.blaze/*
popd
pushd external/hostapd
git am --abort
git am $WL12XX_PATCHES/android/patches/external.hostapd/*
popd
pushd external/openssl
git am --abort
git am $WL12XX_PATCHES/android/patches/external.openssl/*
popd
pushd external/wpa_supplicant_6
git am --abort
git am $WL12XX_PATCHES/android/patches/external.wpa_supplicant_6/*
popd
pushd frameworks/base
git am --abort
git am $WL12XX_PATCHES/android/patches/frameworks.base/*
popd
pushd hardware/libhardware_legacy
git am --abort
git am $WL12XX_PATCHES/android/patches/hardware.libhardware_legacy/*
popd
pushd system/core
git am --abort
git am $WL12XX_PATCHES/android/patches/system.core/*
popd
pushd system/netd
git am --abort
git am $WL12XX_PATCHES/android/patches/system.netd/*
popd
