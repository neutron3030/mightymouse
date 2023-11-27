#!/bin/bash

set -e
source /app/scripts/.functions

version="22.0.2"

wrapt wget libxss1 libsecret-1-0

wget https://github.com/jgraph/drawio-desktop/releases/download/v${version}/drawio-amd64-${version}.deb -O /tmp/drawio-amd64-${version}.deb
dpkg -i /tmp/drawio-amd64-${version}.deb

rm -rf /tmp/*

