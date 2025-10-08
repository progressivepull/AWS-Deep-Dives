#!/bin/sh
for k in `ls Lambda_Functions | grep ADGUIOT_`; do
  echo Deploying $k
  cd Lambda_Functions/$k
  ./create_function.sh
  cd ../..
done
