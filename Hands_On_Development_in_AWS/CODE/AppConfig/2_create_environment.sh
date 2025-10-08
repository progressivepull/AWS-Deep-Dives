#!/bin/sh
if [ $# -ne 1 ]; then
  echo "Usage: $0 <app-id>"
  exit
fi


echo ">>>>> aws appconfig create-environment --application-id $1 --name Prod"
aws appconfig create-environment --application-id $1 --name Prod
