#!/usr/bin/env bash


if [ "$#" -eq "0" ]; then
    sudo apt update
    # install libraries
    sudo apt install -y flatpak flatpak-builder
    flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    flatpak install -y flathub org.freedesktop.Platform//1.6 org.freedesktop.Sdk//1.6 --user

    # install flatpak build
    flatpak install -y --user bitmarkd.flatpak
elif [ "$1" = "u" ] || [ "$1" = "uninstall" ]; then
    flatpak uninstall com.bitmark.bitmarkd
fi
