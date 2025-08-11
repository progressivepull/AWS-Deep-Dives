**Demo Outline for Lesson 9.1: IAM Roles and Permissions for SageMaker**

----------

**Objective:**

This lab will demonstrate how to create and configure **IAM roles and permissions** for SageMaker, ensuring secure and controlled access to AWS resources. Students will understand the importance of IAM roles and how to assign necessary policies for SageMaker training, deployment, and data access.

----------

**1. Demo Setup**

**Prerequisites:**

-   AWS account with SageMaker Studio access
-   Familiarity with Amazon S3 for storing data and models
-   Basic knowledge of IAM (Identity and Access Management)

**Tools and Resources:**

-   IAM service in AWS Management Console
-   Amazon S3 for data access
-   SageMaker Studio for running jobs

----------

**2. Step-by-Step Demonstration**

----------

**Step 1: Introduction to IAM Roles in SageMaker**

1.  **What is an IAM Role?**

-   An IAM role is a set of permissions that AWS services (like SageMaker) assume to perform actions on your behalf.

3.  **Why are IAM roles important in SageMaker?**

-   Secure access to resources like Amazon S3, Amazon CloudWatch, and other AWS services.
-   Fine-grained control over which actions SageMaker can perform.
-   Ensures compliance with least privilege principles.

5.  **Common use cases:**

-   Accessing training and validation data stored in S3.
-   Storing trained model artifacts in S3.
-   Logging training and endpoint metrics to CloudWatch.

----------

**Step 2: Create an IAM Role for SageMaker**

1.  **Navigate to AWS IAM > Roles > Create Role.**
2.  **Select SageMaker as the trusted service:**

-   Select the **SageMaker service** so that it can assume this role during training and other tasks.

4.  **Attach policies for common tasks:**

-   **AmazonS3FullAccess (or a custom policy):** To allow access to S3 buckets for training and model storage.
-   **CloudWatchLogsFullAccess:** To allow SageMaker to log training and inference events to CloudWatch.
-   **AmazonEC2ContainerRegistryReadOnly:** To pull Docker images during training.

6.  **Policy example for least privilege:**

-   Create a custom S3 policy to limit access to specific S3 buckets:

```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject"],
      "Resource": "arn:aws:s3:::my-bucket/*"
    }
  ]
}
```

5.  **Name and create the role:**

-   Example: SageMakerExecutionRole

----------

**Step 3: Assign the IAM Role to SageMaker**

1.  Open **SageMaker Studio** or navigate to **SageMaker > Notebook Instances**.
2.  Select or create a new notebook instance.
3.  In the IAM role section, select the newly created **SageMakerExecutionRole**.
4.  Alternatively, assign the role using the AWS CLI:


```
aws sagemaker create-notebook-instance \
  --notebook-instance-name "MyNotebookInstance" \
  --instance-type "ml.t2.medium" \
  --role-arn "arn:aws:iam::xxxxxx:role/SageMakerExecutionRole"
```

----------

**Step 4: Test Data Access Using the Assigned IAM Role**

1.  **Open the notebook instance** and run the following test script:


```
import boto3

# Access S3 using the assigned IAM role
s3 = boto3.client('s3')

# List objects in the bucket
response = s3.list_objects_v2(Bucket='my-bucket')
for obj in response.get('Contents', []):
  print(obj['Key'])
```

2.  **Verify that data access works as expected.** If permission errors occur, adjust the IAM role policies.

----------

**Step 5: Add CloudWatch Access to Monitor Training Jobs**

1.  Open **IAM > Roles > SageMakerExecutionRole > Add Permissions**.
2.  Attach the **CloudWatchLogsFullAccess** policy.
3.  **Test logging by running a SageMaker training job:**

-   Ensure logs appear in **Amazon CloudWatch > Logs**.

----------

**Step 6: Least Privilege Principle and Security Best Practices**

1.  **Follow the least privilege principle:**

-   Only grant permissions required for SageMaker workflows.
-   Avoid using overly permissive policies like AdministratorAccess.

3.  **Use fine-grained access control:**

-   Restrict S3 access to specific buckets or objects.
-   Grant read-only access for certain operations if possible.

5.  **Enable IAM role session logging:**

-   Use AWS CloudTrail to monitor the use of IAM roles by SageMaker.

----------

**Step 7: Automate Role Assignments Using Infrastructure as Code (Optional)**

1.  **Define IAM roles and policies using AWS CloudFormation or Terraform:**

-   Example YAML configuration:

```
Resources:
  SageMakerExecutionRole:
    Type: "AWS::IAM::Role"
    Properties:
      AssumeRolePolicyDocument:
        Version: "2012-10-17"
        Statement:
          - Effect: "Allow"
            Principal:
              Service: "sagemaker.amazonaws.com"
            Action: "sts:AssumeRole"
      Policies:
        - PolicyName: "SageMakerS3Access"
          PolicyDocument:
            Version: "2012-10-17"
            Statement:
              - Effect: "Allow"
                Action: "s3:GetObject"
                Resource: "arn:aws:s3:::my-bucket/*"
```

----------

**3. Wrap-Up Discussion**

**Key Takeaways:**

-   IAM roles are essential for securely running SageMaker workloads.
-   Follow the least privilege principle when assigning permissions.
-   Monitor IAM role usage through CloudTrail and adjust policies as needed.


