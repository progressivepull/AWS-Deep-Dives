#!/bin/sh

aws opensearchserverless create-security-policy \
  --name adgu-policy \
  --type network --policy "[{\"Description\":\"Public access for logs collection\",\"Rules\":[{\"ResourceType\":\"dashboard\",\"Resource\":[\"collection\/adgu-application\"]},{\"ResourceType\":\"collection\",\"Resource\":[\"collection\/adgu-application\"]}],\"AllowFromPublic\":true}]"
