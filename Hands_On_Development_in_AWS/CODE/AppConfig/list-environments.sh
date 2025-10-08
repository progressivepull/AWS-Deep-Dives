#!/bin/sh
if [ $# -ne 1 ]; then
  echo "Usage: $0 <app_id>"
  exit
fi

echo ">>>>> aws appconfig list-environments --application-id $1"
aws appconfig list-environments --application-id $1
