#!/bin/sh

echo ">>>>>   aws sns create-topic --name adguiot_notify"
aws sns create-topic --name adguiot_notify
echo 


echo ">>>>>   What email address would you like to subscribe?"
read EMAIL
echo

echo ">>>>>   Listing SNS topic ARNs"
aws sns list-topics
echo

echo ">>>>>   What is the ARN of the topic to add the subscriber to?"
read ARN
echo

echo ">>>>>   aws sns subscribe --topic-arn $ARN --protocol email --notification-endpoint $EMAIL"
aws sns subscribe --topic-arn $ARN --protocol email --notification-endpoint $EMAIL
echo 

echo ">>>>> Please check your email and click the link to confirm the subscription."
echo
