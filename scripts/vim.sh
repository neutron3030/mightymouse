#!/bin/bash

set -e
source /app/scripts/.functions

wrapt git vim

mkdir -p $HOME/.vim/pack/plugins/start/gruvbox
git clone https://github.com/morhetz/gruvbox $HOME/.vim/pack/plugins/start/gruvbox

mkdir -p $HOME/.vim/pack/plugins/start/vim-fugitive
git clone https://github.com/tpope/vim-fugitive $HOME/.vim/pack/plugins/start/vim-fugitive

mkdir -p $HOME/.vim/pack/plugins/start/lightline.vim
git clone https://github.com/itchyny/lightline.vim $HOME/.vim/pack/plugins/start/lightline.vim

rm -rf /tmp/*

