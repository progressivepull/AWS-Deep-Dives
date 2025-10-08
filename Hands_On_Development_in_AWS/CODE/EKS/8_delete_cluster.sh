#!/bin/sh
echo ">>>>>   eksctl get clusters"
eksctl get clusters
echo

echo ">>>>> Delete which cluster?"
read CLUSTER
echo

echo ">>>>>   eksctl delete cluster --name $CLUSTER"
eksctl delete cluster --name $CLUSTER
echo

echo ">>>>>   Please check the CloudFormation console -> stack -> resources to ensure everything was deleted."
echo
