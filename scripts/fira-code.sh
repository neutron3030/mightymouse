#!/bin/bash

set -e
source /app/scripts/.functions

version="3.1.1"

wrapt wget

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v$version/FiraCode.tar.xz -O /tmp/FiraCode.tar.xz
mkdir ${HOME}/.fonts && tar -xvf /tmp/FiraCode.tar.xz -C ${HOME}/.fonts

rm -rf /tmp/*

