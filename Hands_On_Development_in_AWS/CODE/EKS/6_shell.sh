#!/bin/sh
echo ">>>>> kubectl get pods -n eks-sample-app"
kubectl get pods -n eks-sample-app
echo

echo ">>>>>   Which pod?"
read POD

echo ">>>>>   Will now attempt to connect the shell on pod: $POD"
echo ">>>>>     Once connected, run 'curl eks-sample-linux-service'"
echo ">>>>>     CoreDNS will resolve the service name"

echo ">>>>> kubectl exec -it $POD -n eks-sample-app -- /bin/bash"
kubectl exec -it $POD -n eks-sample-app -- /bin/bash
echo

