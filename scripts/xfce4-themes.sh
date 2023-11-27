#!/bin/bash

set -e

apt-get update
apt-get upgrade -y
apt-get install --no-install-recommends -y \
    adwaita-qt \
    breeze-cursor-theme \
    greybird-gtk-theme \
    papirus-icon-theme \
    xubuntu-wallpapers
apt-get autoremove -y --purge
apt-get clean
rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

