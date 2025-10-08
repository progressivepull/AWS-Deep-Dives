#!/bin/sh
if [ $# -ne 1 ]; then
  echo "Usage: $0 <app_id>"
  exit
fi

echo ">>>>> aws appconfig create-configuration-profile --location-uri hosted --application-id $1 --name adgu-prod-config"
aws appconfig create-configuration-profile --location-uri hosted --application-id $1 --name adgu-prod-config
