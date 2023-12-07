#!/bin/bash

set -e
source /app/scripts/.functions

wrapt qtbase5-dev libfftw3-dev cmake pkg-config \
      libliquid-dev libc6-dev build-essential git

git clone https://github.com/miek/inspectrum.git /tmp/inspectrum

cd /tmp/inspectrum
mkdir build && cd build/
cmake .. && make -j4
make install
cd /

rm -rf /tmp/*

