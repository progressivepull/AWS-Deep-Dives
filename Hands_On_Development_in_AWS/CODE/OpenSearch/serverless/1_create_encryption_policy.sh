#!/bin/sh

aws opensearchserverless create-security-policy \
  --name adgu-policy \
  --type encryption --policy "{\"Rules\":[{\"ResourceType\":\"collection\",\"Resource\":[\"collection\/adgu-application\"]}],\"AWSOwnedKey\":true}"
