#!/bin/bash

set -e
source /app/scripts/.functions

version="0.16.5"

wrapt wget

wget https://github.com/dandavison/delta/releases/download/${version}/git-delta_${version}_amd64.deb -O /tmp/git-delta_${version}_amd64.deb
dpkg -i /tmp/git-delta_${version}_amd64.deb

rm -rf /tmp/*

