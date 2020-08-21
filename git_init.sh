#!/bin/bash

# Install git
source base.sh

echo "Install git, may require your passwd"
sudo yum install git -y || ERROR "Install git failed, please check your yum repository and network connection"
