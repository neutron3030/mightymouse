#!/bin/bash

set -e
source /app/scripts/.functions

wrapt curl

/app/scripts/docker.sh

version=$(curl -s "https://api.github.com/repos/jesseduffield/lazydocker/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazydocker.tar.gz "https://github.com/jesseduffield/lazydocker/releases/latest/download/lazydocker_${version}_Linux_x86_64.tar.gz"
tar xf lazydocker.tar.gz lazydocker
install lazydocker /usr/local/bin
rm lazydocker lazydocker.tar.gz

rm -rf /tmp/*

