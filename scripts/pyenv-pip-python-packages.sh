#!/bin/bash

set -e

# Install dependencies
apt-get update
apt-get upgrade -y
apt-get install --no-install-recommends -y \
    build-essential \
    curl \
    libbz2-dev \
    libffi-dev \
    liblzma-dev \
    libncurses5-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libxml2-dev \
    libxmlsec1-dev \
    llvm \
    make \
    tk-dev \
    wget \
    xz-utils \
    zlib1g-dev
apt-get autoremove -y --purge
apt-get clean

# Install pyenv
git clone https://github.com/pyenv/pyenv.git /root/.pyenv

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

echo >> ${HOME}/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ${HOME}/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ${HOME}/.bashrc
echo 'eval "$(pyenv init --path)"' >> ${HOME}/.bashrc
echo 'eval "$(pyenv init -)"' >> ${HOME}/.bashrc
echo >> ${HOME}/.bashrc

# 3.9 packages
env PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.9.14
pyenv rehash
pyenv global 3.9.14
pip install --upgrade pip setuptools wheel
pip install -r /app/scripts/requirements.txt
pyenv rehash

# default global is latest stable version
pyenv global 3.9.14

rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

