#!/bin/bash
source base.sh

# This script is to install fish on CentOS

echo "========== Start to configure Fish =========="
echo "Configure yum, may require sudoer and passwd"
sudo yum-config-manager --add-repo https://download.opensuse.org/repositories/shells:fish:release:2/CentOS_7/shells:fish:release:2.repo || Error "Configure yum error"
echo "Install fish"
sudo yum install fish -y || Error "Install fish failed"
echo "Change fish to default, may require your passwd"
chsh -s /usr/bin/fish || Error "Change fish to default failed, please check whether /usr/bin/fish exists"
echo "Congrats, fish installation is done"
