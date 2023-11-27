#!/bin/bash

set -e
source /app/scripts/.functions

yes | unminimize
wrapt man-db manpages-dev manpages-posix-dev

rm -rf /tmp/*

