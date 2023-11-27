#!/bin/bash

set -e

apt-get update
apt-get upgrade -y
apt-get install --no-install-recommends -y \
    fonts-liberation
apt-get autoremove -y --purge
apt-get clean

/app/scripts/install_chrome.sh

rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

