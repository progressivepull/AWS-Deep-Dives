# Simple EC2 Role Demo

## Create IAM Role
* Navigate to AWS console -> IAM  
* Roles -> Create Role  
    * Trusted Entity: AWS Service -> EC2  
    * Attach Amazon-managed Permission: AmazonEC2ReadOnlyAccess  
    * Name: EC2-ReadOnly  
    * Save  
  
## Launch EC2 Instance with Role Attached
* Navigate to EC2  
* Launch Instance  
    * AMI: Amazon Linux 2  
    * Class: any  
    * Role: EC2-ReadOnly  

Log into the instance and, without configurating AWS CLI, run  
```
aws ec2 describe-instances --region us-east-2
```  
Provided the region is correct, you should see your instances wihout needing to provide AWS Access Key and Secret Key.
