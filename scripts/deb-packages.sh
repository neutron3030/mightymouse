#!/bin/bash

set -e

DELTA_VERSION="0.16.5"
DOWNLOAD_URL="https://github.com/dandavison/delta/releases/download/${DELTA_VERSION}/git-delta_${DELTA_VERSION}_amd64.deb"
DEB_FILE="/tmp/git-delta_${DELTA_VERSION}_amd64.deb"
wget ${DOWNLOAD_URL} -O ${DEB_FILE}
dpkg -i ${DEB_FILE}

DRAWIO_VERSION="22.0.2"
DOWNLOAD_URL="https://github.com/jgraph/drawio-desktop/releases/download/v${DRAWIO_VERSION}/drawio-amd64-${DRAWIO_VERSION}.deb"
DEB_FILE="/tmp/drawio-amd64-${DRAWIO_VERSION}.deb"
wget ${DOWNLOAD_URL} -O ${DEB_FILE}
dpkg -i ${DEB_FILE}

rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

