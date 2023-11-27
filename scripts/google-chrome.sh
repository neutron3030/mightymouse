#!/bin/bash

set -e
source /app/scripts/.functions

wrapt fonts-liberation

/app/scripts/install_chrome.sh

rm -rf /tmp/*

