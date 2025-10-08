#!/bin/sh

# Proper way to do this
# use --query on the aws sns list-topics call and use JMESPath to find the topic
# and/or use aws sts get-caller-identity and extract the Account number and create the ARN yourself

echo ">>>>>   Getting topic ARNs"
aws sns list-topics
echo
echo "Which ARN to delete? "
read ARN
echo

echo ">>>>>   aws sns delete-topic --topic-arn $ARN"
aws sns delete-topic --topic-arn $ARN
echo
