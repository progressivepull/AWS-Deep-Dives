#!/bin/sh
#https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-data-access.html
# NOTE: the principal referenced below needs to be updated to your accound/iam user

aws opensearchserverless create-access-policy \
    --name adgu-data-access-policy \
    --type data \
    --policy "[{\"Rules\":[{\"ResourceType\":\"collection\",\"Resource\":[\"collection/adgu-application\"],\"Permission\":[\"aoss:*\"]},{\"ResourceType\":\"index\",\"Resource\":[\"index/adgu-application/*\"],\"Permission\":[\"aoss:*\"]}],\"Principal\":[\"arn:aws:iam::146868985163:user/nick\"]}]"
