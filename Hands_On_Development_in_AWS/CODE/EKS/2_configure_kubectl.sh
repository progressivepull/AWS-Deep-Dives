#!/bin/sh
if ! command -v kubectl &> /dev/null
then
    echo "kubectl could not be found, please install"
    exit
fi


echo ">>>>>   Listing Clusters"
echo ">>>>>   aws eks list-clusters"
aws eks list-clusters
echo

echo ">>>>>   Enter cluster name: "
read cluster
echo

echo ">>>>> aws eks update-kubeconifg --name $cluster"
aws eks update-kubeconfig --name $cluster
echo


echo ">>>>> Verify"
echo ">>>>> kubectl get pods --all-namespaces"
kubectl get pods --all-namespaces
