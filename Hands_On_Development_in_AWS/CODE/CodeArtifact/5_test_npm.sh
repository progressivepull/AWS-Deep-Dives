#!/bin/sh
echo ">>>>> mkdir /tmp/codeartifact-test"
mkdir /tmp/codeartifact-test
echo ">>>>> cd /tmp/codeartifact-test"
cd /tmp/codeartifact-test


echo ">>>>> npm install --save --verbose helloworld"
npm install --save --verbose helloworld


echo "Head into the CodeArtifact service and view the repo."
echo "See the following for information about adding a private package."
echo "https://aws.amazon.com/blogs/devops/publishing-private-npm-packages-aws-codeartifact/"
