#!/bin/sh
for k in `ls Lambda_Functions | grep ADGUIOT_`; do
  echo ">>>>>   Deleting $k"
  echo ">>>>>   aws lambda delete-function --function-name $k"
  aws lambda delete-function --function-name $k
done
