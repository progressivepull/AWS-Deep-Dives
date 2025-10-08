#!/bin/sh
echo ">>>>>   Deploy eks-sample-service.yaml"
echo ">>>>>     kubectl apply -f eks-sample-service.yaml"
kubectl apply -f eks-sample-service.yaml
echo
