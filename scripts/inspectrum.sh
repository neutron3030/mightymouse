#!/bin/bash

set -e

apt-get update
apt-get upgrade -y
apt-get install --no-install-recommends -y \
    qtbase5-dev \
    libfftw3-dev \
    cmake \
    pkg-config \
    libliquid-dev \
    build-essential \
    git
apt-get autoremove -y --purge
apt-get clean

cd /opt
git clone https://github.com/miek/inspectrum.git
cd inspectrum/

mkdir build && cd build/
cmake .. && make -j4
make install
cd .. && rm -rf build

rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*
