#!/bin/sh
echo ">>>>> kubectl get all -n eks-sample-app"
kubectl get all -n eks-sample-app
echo

echo ">>>>> kubectl -n eks-sample-app describe service eks-sample-linux-service"
kubectl -n eks-sample-app describe service eks-sample-linux-service
echo

echo ">>>>> Run the following, replace 65betcetc"
echo "kubectl -n eks-sample-app describe pod eks-sample-linux-deployment-65b7669776-m6qxz"
echo
