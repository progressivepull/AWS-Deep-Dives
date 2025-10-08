#!/bin/sh
echo ">>>>> aws codeartifact associate-external-connection --external-connection public:npmjs --domain adgu --repository adgu-repo"
aws codeartifact associate-external-connection --external-connection public:npmjs --domain adgu --repository adgu-repo
