#!/bin/bash
echo ">>>>>   It depends on your OS/arch.  Visit the following URL and install >=1.27"
echo "https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html"

echo
echo ">>>>>   Attempting install..."
echo

echo ">>>>>   curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.27.1/2023-04-19/bin/linux/amd64/kubectl"
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.27.1/2023-04-19/bin/linux/amd64/kubectl
echo

echo ">>>>>   chmod +x kubectl"
chmod +x kubectl
echo

echo ">>>>>   mkdir -p $HOME/bin && mv ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH"
mkdir -p $HOME/bin && mv ./kubectl $HOME/bin/kubectl && export PATH=$HOME/bin:$PATH
echo

echo ">>>>>   Adding to .bashrc"
echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
echo



