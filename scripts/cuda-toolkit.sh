#!/bin/bash

set -e
source /app/scripts/.functions

distro="ubuntu2204"
arch="x86_64"
version="12.1"

wrapt wget git g++ openjdk-8-jre freeglut3-dev build-essential libx11-dev \
      libgtk2.0-0 libxmu-dev libxi-dev libglu1-mesa-dev libfreeimage-dev \
      libglfw3-dev

wget https://developer.download.nvidia.com/compute/cuda/repos/$distro/$arch/cuda-keyring_1.1-1_all.deb -O /tmp/cuda-keyring_1.1-1_all.deb
dpkg -i /tmp/cuda-keyring_1.1-1_all.deb
wrapt cuda-toolkit-${version//./-}

echo >> ${HOME}/.bashrc
echo 'export PATH=/usr/local/cuda-'$version'/bin${PATH:+:${PATH}}' >> ${HOME}/.bashrc
echo >> ${HOME}/.bashrc

git clone https://github.com/NVIDIA/cuda-samples.git /usr/local/cuda-$version/samples

rm -rf /tmp/*

