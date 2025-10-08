#!/bin/sh
#https://docs.aws.amazon.com/AmazonECS/latest/developerguide/AWS_Copilot.html#copilot-install
echo "NOTE: OS specific installation"

# Mac
sudo curl -Lo /usr/local/bin/copilot https://github.com/aws/copilot-cli/releases/latest/download/copilot-darwin 
sudo chmod +x /usr/local/bin/copilot 
copilot --help
