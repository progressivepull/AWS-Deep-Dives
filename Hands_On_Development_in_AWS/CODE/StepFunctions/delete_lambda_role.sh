#!/bin/sh
#
# NOTE: Replace acct (146...) with your AWS account #
#

acct="146868985163"

# Detach Policy to new role
echo ">>>>>   Detaching policy ADGUIOT_Lambda_Policy from role ADGUIOT_Lambda_Execution_Role"
echo '>>>>>   aws iam detach-role-policy --role-name "ADGUIOT_Lambda_Execution_Role" --policy-arn "arn:aws:iam::$acct:policy/ADGUIOT_Lambda_Policy"'
aws iam detach-role-policy --role-name "ADGUIOT_Lambda_Execution_Role" --policy-arn "arn:aws:iam::$acct:policy/ADGUIOT_Lambda_Policy"
echo

#Delete Role
echo ">>>>>   Deleting Role named: ADGUIOT_Lambda_Execution_Role"
echo '>>>>>   aws iam delete-role --role-name "ADGUIOT_Lambda_Execution_Role"'
aws iam delete-role --role-name "ADGUIOT_Lambda_Execution_Role"
echo


# Delete Policy
echo ">>>>>   Deleting policy named: ADGUIOT_Lambda_Policy"
echo '>>>>>   aws iam delete-policy --policy-arn "arn:aws:iam::'$acct':policy/ADGUIOT_Lambda_Policy"'
aws iam delete-policy --policy-arn "arn:aws:iam::$acct:policy/ADGUIOT_Lambda_Policy"
