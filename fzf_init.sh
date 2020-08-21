#!/bin/bash

# This script is to install fzf on CentOS
source base.sh

DOWNLOAD_DIR=~/init_files/fzf
GIT_ADDR=https://github.com/junegunn/fzf.git
INSTALL_CMD=${DOWNLOAD_DIR}/install

# Download
echo "Clone fzf..."
git clone --depth 1 ${GIT_ADDR} ${DOWNLOAD_DIR} || Error "Clone fzf failed, pls check your connection with github"

# Install
${INSTALL_CMD}
