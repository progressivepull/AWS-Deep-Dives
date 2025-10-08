#!/bin/sh
echo ">>>>> aws appconfig list-applications"
aws appconfig list-applications
echo "Which app id?:"
read app_id

echo ">>>>> aws appconfig list-environments --application-id $app_id"
aws appconfig list-environments --application-id $app_id
echo "Which env id?:"
read env_id

echo ">>>>> aws appconfig list-deployments --application-id $app_id --environment-id $env_id"
aws appconfig list-deployments --application-id $app_id --environment-id $env_id

