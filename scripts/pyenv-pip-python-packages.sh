#!/bin/bash

set -e
source /app/scripts/.functions

version="3.11"

wrapt build-essential libssl-dev zlib1g-dev libbz2-dev \
      libreadline-dev libsqlite3-dev curl libncursesw5-dev \
	  xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev \
	  liblzma-dev

git clone https://github.com/pyenv/pyenv.git /root/.pyenv

echo >> ${HOME}/.bashrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ${HOME}/.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ${HOME}/.bashrc
echo 'eval "$(pyenv init -)"' >> ${HOME}/.bashrc
echo >> ${HOME}/.bashrc

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install $version
pyenv global $version
pyenv rehash

pip install -U pip setuptools wheel
pip install -r /app/packages/python.txt
pyenv rehash

rm -rf /tmp/*

