#!/bin/sh
#
# NOTE: Replace acct (146...) with your AWS account #
#

acct="146868985163"

# Detach Policy to new role
echo ">>>>>   Detaching policy ADGUIOT_StepFunction_Policy from role ADGUIOT_StepFunction_Role"
echo '>>>>>   aws iam detach-role-policy --role-name "ADGUIOT_StepFunction_Role" --policy-arn "arn:aws:iam::'$acct':policy/ADGUIOT_StepFunction_Policy'
aws iam detach-role-policy --role-name "ADGUIOT_StepFunction_Role" --policy-arn "arn:aws:iam::$acct:policy/ADGUIOT_StepFunction_Policy"
echo

#Delete Role
echo ">>>>>   Deleting Role named: ADGUIOT_StepFunction_Role"
echo '>>>>>   aws iam delete-role --role-name "ADGUIOT_StepFunction_Role"'
aws iam delete-role --role-name "ADGUIOT_StepFunction_Role"
echo


# Delete Policy
echo ">>>>>   Deleting policy named: ADGUIOT_StepFunction_Policy"
echo '>>>>>   aws iam delete-policy --policy-arn "arn:aws:iam::'$acct':policy/ADGUIOT_StepFunction_Policy"'
aws iam delete-policy --policy-arn "arn:aws:iam::$acct:policy/ADGUIOT_StepFunction_Policy"

