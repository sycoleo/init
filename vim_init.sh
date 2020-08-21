#!/bin/bash

# Upgrade or Install Vim8
source base.sh
# 1. Install fedora repo
sudo curl -L https://copr.fedorainfracloud.org/coprs/lantw44/vim-latest/repo/epel-7/lantw44-vim-latest-epel-7.repo -o /etc/yum.repos.d/vim-latest.repo || Error "Download fedora repo file failed"

# 2. Install vim8
echo "Install vim"
sudo yum -y install vim-enhanced || Error "Install vim8 failed"
