#!/bin/bash

set -e

# Install dependencies
apt-get update
apt-get upgrade -y
apt-get install --no-install-recommends -y \
    kmod \
    libncurses5 \
    libncursesw5 \
    openjdk-8-jdk
apt-get autoremove -y --purge
apt-get clean

# Install Cuda Toolkit
DRIVER_VERSION="510.47.03"
CUDA_VERSION="11.6"
CUDA_PATCH="2"
DOWNLOAD_URL="https://developer.download.nvidia.com/compute/cuda/${CUDA_VERSION}.${CUDA_PATCH}/local_installers/cuda_${CUDA_VERSION}.${CUDA_PATCH}_${DRIVER_VERSION}_linux.run"
RUN_FILE="/tmp/cuda_${CUDA_VERSION}.${CUDA_PATCH}_${DRIVER_VERSION}_linux.run"
wget ${DOWNLOAD_URL} -O ${RUN_FILE}
chmod +x ${RUN_FILE}

${RUN_FILE} \
--silent \
--override \
--no-opengl-libs \
--toolkit \
--toolkitpath=/opt/cuda \
--samples \
--samplespath=/opt/cuda/samples

echo >> ${HOME}/.bashrc
echo 'export CUDA_PATH="/opt/cuda"' >> ${HOME}/.bashrc
echo 'export PATH="${PATH}:${CUDA_PATH}/bin"' >> ${HOME}/.bashrc
echo 'export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${CUDA_PATH}/lib64"' >> ${HOME}/.bashrc
echo >> ${HOME}/.bashrc

source ${HOME}/.bashrc
ldconfig

# Install Cuda Samples
DOWNLOAD_URL="https://github.com/NVIDIA/cuda-samples/archive/refs/tags/v${CUDA_VERSION}.tar.gz"
TAR_FILE="/tmp/v${CUDA_VERSION}.tar.gz"
wget ${DOWNLOAD_URL} -O ${TAR_FILE}
tar -xzvf ${TAR_FILE} -C /opt/cuda

rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

