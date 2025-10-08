# CodeArtifact
This example creates a CodeArtifact Domain and Repository for use with NPM and provides upstream access to npmjs.

## Create and Test Script Output
```
[nick@nuc CodeArtifact]$ ./1_create_domain.sh
>>>>> aws codeartifact create-domain --domain adgu
{
    "domain": {
        "name": "adgu",
        "owner": "146868985163",
        "arn": "arn:aws:codeartifact:us-east-2:146868985163:domain/adgu",
        "status": "Active",
        "createdTime": 1692990289.96,
        "encryptionKey": "arn:aws:kms:us-east-2:146868985163:key/2f1a937f-7939-4814-ab28-c1ce5b72bb32",
        "repositoryCount": 0,
        "assetSizeBytes": 0,
        "s3BucketArn": "arn:aws:s3:::assets-250872398865-us-east-2"
    }
}
[nick@nuc CodeArtifact]$
[nick@nuc CodeArtifact]$
[nick@nuc CodeArtifact]$ ./2_create_repo.sh
>>>>> aws codeartifact create-repository --domain adgu --repository adgu-repo
{
    "repository": {
        "name": "adgu-repo",
        "administratorAccount": "146868985163",
        "domainName": "adgu",
        "domainOwner": "146868985163",
        "arn": "arn:aws:codeartifact:us-east-2:146868985163:repository/adgu/adgu-repo",
        "upstreams": [],
        "externalConnections": [],
        "createdTime": 1692990293.299
    }
}
[nick@nuc CodeArtifact]$
[nick@nuc CodeArtifact]$
[nick@nuc CodeArtifact]$ ./3_add_external_npmjs.sh
>>>>> aws codeartifact associate-external-connection --external-connection public:npmjs --domain adgu --repository adgu-repo
{
    "repository": {
        "name": "adgu-repo",
        "administratorAccount": "146868985163",
        "domainName": "adgu",
        "domainOwner": "146868985163",
        "arn": "arn:aws:codeartifact:us-east-2:146868985163:repository/adgu/adgu-repo",
        "upstreams": [],
        "externalConnections": [
            {
                "externalConnectionName": "public:npmjs",
                "packageFormat": "npm",
                "status": "AVAILABLE"
            }
        ],
        "createdTime": 1692990293.299
    }
}
[nick@nuc CodeArtifact]$
[nick@nuc CodeArtifact]$
[nick@nuc CodeArtifact]$ ./4_configure_npm.sh
>>>>> aws codeartifact login --tool npm --repository adgu-repo --domain adgu
Successfully configured npm to use AWS CodeArtifact repository https://adgu-146868985163.d.codeartifact.us-east-2.amazonaws.com/npm/adgu-repo/
Login expires in 12 hours and 2 minutes at 2023-08-26 00:04:59-07:00
[nick@nuc CodeArtifact]$
[nick@nuc CodeArtifact]$
[nick@nuc CodeArtifact]$ ./5_test_npm.sh
>>>>> mkdir /tmp/codeartifact-test
>>>>> cd /tmp/codeartifact-test
>>>>> npm install --save --verbose helloworld
npm verb cli /usr/bin/node /usr/bin/npm
npm info using npm@9.8.1
npm info using node@v20.5.0
npm verb title npm install helloworld
npm verb argv "install" "--save" "--loglevel" "verbose" "helloworld"
npm verb logfile logs-max:10 dir:/home/nick/.npm/_logs/2023-08-25T19_03_23_597Z-
npm verb logfile /home/nick/.npm/_logs/2023-08-25T19_03_23_597Z-debug-0.log
npm http fetch GET 200 https://adgu-146868985163.d.codeartifact.us-east-2.amazonaws.com/npm/adgu-repo/helloworld 512ms (cache updated)

added 1 package in 626ms
npm verb exit 0
npm info ok
Head into the CodeArtifact service and view the repo.
See the following for information about adding a private package.
https://aws.amazon.com/blogs/devops/publishing-private-npm-packages-aws-codeartifact/
[nick@nuc CodeArtifact]$
```
