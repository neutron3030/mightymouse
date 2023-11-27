#!/bin/bash

set -e
source /app/scripts/.functions

wrapt adwaita-qt breeze-cursor-theme greybird-gtk-theme \
      papirus-icon-theme xubuntu-wallpapers

rm -rf /tmp/*

