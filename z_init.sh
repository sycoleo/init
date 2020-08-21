#!/bin/bash

# This script is to install z on fish and bash
source base.sh

GIT_ADDR=https://github.com/skywind3000/z.lua.git
DOWNLOAD_DIR=~/init_files/z
FISH_CONFIG_PATH=~/.config/fish/conf.d
ZFISH_CONFIG_FILE=${FISH_CONFIG_PATH}/z.fish
mkdir -p $DOWNLOAD_DIR

# Donwload z.lua
echo "Clone z.lua..."
git clone ${GIT_ADDR} ${DOWNLOAD_DIR} || Error "Clone z failed, pls check your connection with github"

# 1. see if fish has been installed
fish_installed=0
if [ -f /etc/shells ]; then
	fish_exe=$(grep "fish" /etc/shells)
	if [ -n $fish_exec ]; then
		fish_installed=1
	fi
fi

# 2. Enable z.lua on bash
echo "Enable z.lua on bash"
touch ~/.bashrc
echo "eval \"$(lua ${DOWNLOAD_DIR}/z.lua --init bash)\"" >> ~/.bashrc || Error "Enable z on bash failed"

# 3. Enable z.lua on fish
echo "Enable z.lua on fish"
mkdir -p $FISH_CONFIG_PATH
touch $ZFISH_CONFIG_FILE
lua ${DOWNLOAD_DIR}/z.lua --init fish > ~/.config/fish/conf.d/z.fish || Error "Enable z on lua failed"
