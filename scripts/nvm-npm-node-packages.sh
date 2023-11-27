#!/bin/bash

set -e
source /app/scripts/.functions

wrapt git

export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

echo >> ${HOME}/.bashrc
echo 'export NVM_DIR="$HOME/.nvm"' >> ${HOME}/.bashrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ${HOME}/.bashrc
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ${HOME}/.bashrc
echo >> ${HOME}/.bashrc

nvm install node
nvm install-latest-npm

rm -rf /tmp/*

