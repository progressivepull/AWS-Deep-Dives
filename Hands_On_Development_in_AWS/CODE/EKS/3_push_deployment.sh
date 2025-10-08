#!/bin/sh
echo ">>>>>   Creating namespace"
echo ">>>>>     kubectl create namespace eks-sample-app"
kubectl create namespace eks-sample-app
echo

echo ">>>>>   Deploy eks-sample-deployment.yaml"
echo ">>>>>     kubectl apply -f eks-sample-deployment.yaml"
kubectl apply -f eks-sample-deployment.yaml
echo
