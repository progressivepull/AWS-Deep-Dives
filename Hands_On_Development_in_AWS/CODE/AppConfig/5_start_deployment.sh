#!/bin/sh
echo ">>>>> aws appconfig list-applications"
aws appconfig list-applications
echo "Which app id?:"
read app_id

echo ">>>>> aws appconfig list-environments --application-id $app_id"
aws appconfig list-environments --application-id $app_id
echo "Which env id?:"
read env_id


echo ">>>>> aws appconfig list-configuration-profiles --application-id $app_id"
aws appconfig list-configuration-profiles --application-id $app_id
echo "Which profile id?:"
read profile_id

echo ">>>>> aws appconfig list-hosted-configuration-versions --configuration-profile-id $profile_id --application-id $app_id"
aws appconfig list-hosted-configuration-versions --configuration-profile-id $profile_id --application-id $app_id
echo "Which VersionNumber?:"
read ver

echo ">>>>> aws appconfig start-deployment --application-id $app_id --environment-id $env_id --deployment-strategy-id AppConfig.AllAtOnce --configuration-profile-id $profile_id --configuration-version $ver"
aws appconfig start-deployment --application-id $app_id --environment-id $env_id --deployment-strategy-id AppConfig.AllAtOnce --configuration-profile-id $profile_id --configuration-version $ver
