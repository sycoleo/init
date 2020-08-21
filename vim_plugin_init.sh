#!/bin/bash

# Install vim plugin and configuration
source base.sh
basepath=$(pushd `dirname $0` > /dev/null; pwd; popd > /dev/null)

# 1. Download vim-plugin
if [ ! -f "${basepath}/autoload/plug.vim" ];then
	curl -fLo ${basepath}/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim || Error "Download plug.vim failed"
fi

# 2. Move config to vim directory
echo -n "This step will remove your existing vim configuration, enter y to continue: "
read confirm
if [ $confirm != "y" ]; then
	exit 1
fi

rm -fr ~/.vim
ln -sf ${basepath} ~/.vim
ln -sf ~/.vim/vimrc ~/.vimrc

echo "Vim configuration installed done"
echo "Please enter vim and exec :PlugInstall"
