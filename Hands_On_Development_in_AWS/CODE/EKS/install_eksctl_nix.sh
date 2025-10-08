#!/bin/bash
echo ">>>>>   It depends on your OS/arch.  Visit the following URL for info"
echo "https://github.com/weaveworks/eksctl/blob/main/README.md#installation"
echo
echo ">>>>>   Attempting install..."
echo

ARCH=amd64
PLATFORM=$(uname -s)_$ARCH

echo ">>>>>   curl -sLO 'https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz'"
curl -sLO "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
echo



echo ">>>>>   tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz"
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
echo

echo ">>>>>   sudo mv /tmp/eksctl /usr/local/bin"
sudo mv /tmp/eksctl /usr/local/bin
echo
