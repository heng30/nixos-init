#!/bin/sh

LOC=$(readlink -f "$0")
CUR_PATH=$(dirname "$LOC")

sudo ln -s $CUR_PATH/wpa_supplicant.conf /etc/wpa_supplicant.conf

sudo cp -f /etc/nixos/hardware-configuration.nix $CUR_PATH/nixos
sudo mv /etc/nixos /etc/nixos.bak
sudo ln -s $CUR_PATH/nixos /etc/nixos

