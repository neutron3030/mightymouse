#!/bin/bash

set -e
source /app/scripts/.functions

# Add Docker's official GPG key:
wrapt ca-certificates curl gnupg
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
     $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
     tee /etc/apt/sources.list.d/docker.list > /dev/null

wrapt docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

rm -rf /tmp/*

