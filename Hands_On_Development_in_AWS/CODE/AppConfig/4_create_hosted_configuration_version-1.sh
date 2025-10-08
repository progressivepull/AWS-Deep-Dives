#!/bin/sh
if [ $# -ne 2 ]; then
  echo "Usage: $0 <app_id> <configuration_profile_id>"
  exit
fi

echo aws appconfig create-hosted-configuration-version --application-id $1 --configuration-profile-id $2 --content '{"number":1}' --content-type "application/json" outputfile

aws appconfig create-hosted-configuration-version --application-id $1 --configuration-profile-id $2 --content '{"number":1}' --content-type "application/json" outputfile

echo ">>>>> contents of outputfile:"
cat outputfile
echo
