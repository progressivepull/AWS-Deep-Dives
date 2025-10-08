#!/bin/sh
# Note, you have to supply the API ID.  You can find this at the AppSync Service Homepage:
# https://<region>.console.aws.amazon.com/appsync/home
# or on "Integrate with your app" in the Appsync web console

origwd=`pwd`
echo ">>>>>   Original working directory: " $origwd
echo

echo -n ">>>>>   Enter the API ID: "
read APIID
echo ">>>>>   API ID: $APIID"
echo

echo ">>>>>   Installing AWS Amplify CLI"
echo ">>>>>   sudo npm install -g @aws-amplify/cli"
sudo npm install -g @aws-amplify/cli
echo

echo ">>>>>   Creating temporary directory at /tmp/appsynctest"
echo ">>>>>   mkdir /tmp/appsynctest; cd /tmp/appsynctest"
mkdir /tmp/appsynctest
cd /tmp/appsynctest
echo

echo ">>>>>   amplify init"
amplify init
echo

echo ">>>>>   amplify add codegen --apiId $APIID"
amplify add codegen --apiId $APIID
echo

echo ">>>>>   amplify codegen"
amplify codegen
echo

echo ">>>>>   cp $origwd/app.js src/app.js"
cp $origwd/app.js src/app.js
echo

echo ">>>>>   cp $origwd/package.json ./package.json"
cp $origwd/package.json ./package.json
echo

echo ">>>>>   npm install"
npm install 
echo

