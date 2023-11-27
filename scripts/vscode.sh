#!/bin/bash

set -e
source /app/scripts/.functions

cpptools_version="1.17.5"

wrapt wget
/app/scripts/install_vscode_repo.sh
wget https://github.com/microsoft/vscode-cpptools/releases/download/v${cpptools_version}/cpptools-linux.vsix -O /tmp/cpptools-linux.vsix

code --no-sandbox --user-data-dir "${HOME}/vscode" --install-extension Atlassian.atlascode
code --no-sandbox --user-data-dir "${HOME}/vscode" --install-extension GitHub.github-vscode-theme
code --no-sandbox --user-data-dir "${HOME}/vscode" --install-extension GitLab.gitlab-workflow
code --no-sandbox --user-data-dir "${HOME}/vscode" --install-extension mongodb.mongodb-vscode
code --no-sandbox --user-data-dir "${HOME}/vscode" --install-extension ms-azuretools.vscode-docker
code --no-sandbox --user-data-dir "${HOME}/vscode" --install-extension ms-python.python
code --no-sandbox --user-data-dir "${HOME}/vscode" --install-extension ms-vscode.hexeditor
code --no-sandbox --user-data-dir "${HOME}/vscode" --install-extension NVIDIA.nsight-vscode-edition
code --no-sandbox --user-data-dir "${HOME}/vscode" --install-extension /tmp/cpptools-linux.vsix
code --no-sandbox --user-data-dir "${HOME}/vscode" --install-extension twxs.cmake
code --no-sandbox --user-data-dir "${HOME}/vscode" --install-extension vscode-icons-team.vscode-icons
code --no-sandbox --user-data-dir "${HOME}/vscode" --install-extension vscodevim.vim

rm -rf /tmp/*

