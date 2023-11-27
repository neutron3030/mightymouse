#!/bin/bash

set -e
source /app/scripts/.functions

wrapt gcc cmake cmake-curses-gui gdb cgdb
wrapt /app/packages/c.txt

rm -rf /tmp/*

