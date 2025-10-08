#!/bin/sh
#
# NOTE: Replace acct (146...) with your AWS account #
#

acct="146868985163"

echo ">>>>>   Creating policy named: ADGUIOT_StepFunction_Policy"
aws iam create-policy --policy-name "ADGUIOT_StepFunction_Policy" --policy-document '{ "Version": "2012-10-17", "Statement": [ {   "Sid": "VisualEditor0", "Effect": "Allow", "Action": [ "sns:Publish", "lambda:InvokeFunction" ],  "Resource": "*" }   ]   }'
echo



#Create Role
echo ">>>>>   Creating Role named: ADGUIOT_StepFunction_Role"
aws iam create-role --role-name "ADGUIOT_StepFunction_Role" --assume-role-policy-document '{ "Version": "2012-10-17", "Statement": [ { "Sid": "", "Effect": "Allow", "Principal": { "Service": "states.amazonaws.com" }, "Action": "sts:AssumeRole" } ] }' --description "Allow StepFunctions to call AWS services"
echo

# Attach Policy to new role
echo ">>>>>   Attaching policy ADGUIOT_StepFunction_Policy to role ADGUIOT_StepFunction_Role"
aws iam attach-role-policy --role-name "ADGUIOT_StepFunction_Role" --policy-arn "arn:aws:iam::$acct:policy/ADGUIOT_StepFunction_Policy"
echo
