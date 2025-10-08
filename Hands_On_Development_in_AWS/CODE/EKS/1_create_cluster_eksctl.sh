#!/bin/sh

if ! command -v eksctl &> /dev/null
then
    echo "eksctl could not be found, please install"
    exit
fi

echo "!!! NOTE !!!"
echo "This creates a large amount of resources in your account, some are not free."
echo "Press Ctrl-C to kill or enter to continue."
read ANS


echo ">>>>>   Enter the name of the cluster you want to create:"
read CLUSTER

# Fargate – Linux
#    Select this type of node if you want to run Linux applications on AWS Fargate. Fargate is a serverless compute engine that lets you deploy Kubernetes Pods without managing Amazon EC2 instances.
#    Add --fargate option to the create cluster command
# Managed nodes – Linux
#    Select this type of node if you want to run Amazon Linux applications on Amazon EC2 instances. Though not covered in this guide, you can also add Windows self-managed and Bottlerocket nodes to your cluster.

echo ">>>>>   Creating managed nodes cluster in us-east-2"
echo ">>>>>   eksctl create cluster --name $CLUSTER --region us-east-2"
eksctl create cluster --name $CLUSTER --region us-east-2


