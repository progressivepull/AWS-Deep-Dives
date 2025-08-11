**Demo Outline for Lesson 9.2: VPC Configurations for Secure Endpoint Deployment**

----------

**Objective:**

This lab will demonstrate how to deploy **SageMaker endpoints inside an Amazon VPC (Virtual Private Cloud)** to ensure secure, private communication between SageMaker and AWS services, such as Amazon S3 and Amazon RDS. Students will set up a VPC, configure security groups, and deploy a secure SageMaker endpoint.

----------

**1. Demo Setup**

**Prerequisites:**

-   AWS account with SageMaker Studio access
-   VPC with subnets configured in **at least 2 availability zones**
-   IAM role with permissions to manage SageMaker and VPC resources

**Tools and Resources:**

-   Amazon SageMaker for endpoint deployment
-   Amazon VPC for secure network configurations
-   Amazon S3 for model and data storage

----------

**2. Step-by-Step Demonstration**

----------

**Step 1: Introduction to VPC Configurations**

1.  **What is a VPC?**

-   A **Virtual Private Cloud (VPC)** is a logically isolated section of the AWS Cloud where you can launch AWS resources in a virtual network.

3.  **Why deploy SageMaker in a VPC?**

-   To ensure that all traffic between SageMaker and services like Amazon S3 is routed securely without traversing the internet.
-   To meet security and compliance requirements for private deployments.

5.  **Components involved:**

-   **Subnets:** Isolated sections of the VPC.
-   **Security groups:** Define inbound and outbound traffic rules.
-   **VPC endpoints:** Provide private connectivity to AWS services like S3.

----------

**Step 2: Set Up a VPC**

1.  **Navigate to AWS VPC > Create VPC.**
2.  Choose **VPC with public and private subnets**.

-   Enable private subnets in at least two availability zones for fault tolerance.

4.  **Configure VPC settings:**

-   VPC name: sagemaker-secure-vpc
-   CIDR block: 10.0.0.0/16

----------

**Step 3: Set Up Subnets and Security Groups**

1.  **Subnets:** Ensure you have both public and private subnets:

-   Public subnet: For internet access if needed
-   Private subnet: For deploying the SageMaker endpoint

3.  **Security groups:**

-   Create a security group named sagemaker-endpoint-sg with the following rules:

-   Inbound: Allow traffic from trusted IP ranges (e.g., your local machine or corporate network)
-   Outbound: Allow traffic to Amazon S3 and any other required services

Example inbound rule for port 443 (HTTPS):

-   Type: HTTPS
-   Protocol: TCP
-   Port Range: 443
-   Source: Custom (IP address range)

----------

**Step 4: Deploy the SageMaker Endpoint**

1.  **Specify the VPC configuration:**  
    When creating a SageMaker endpoint, specify the subnets and security groups.
    2.  **Python code to deploy the endpoint:**

```
import boto3
sagemaker = boto3.client('sagemaker')

# Create the endpoint configuration
response = sagemaker.create_endpoint_config(
  EndpointConfigName='secure-endpoint-config',
  ProductionVariants=[
    {
      'VariantName': 'AllTraffic',
      'ModelName': 'my-trained-model',
      'InitialInstanceCount': 1,
      'InstanceType': 'ml.m5.large'
    }
  ],
  KmsKeyId='',  # Optional: Add a KMS key for encryption
  NetworkConfig={
    'VpcConfig': {
      'SecurityGroupIds': ['sg-xxxxxxxxxxxxxx'],  # Replace with your security group ID
      'Subnets': ['subnet-xxxxxxxxxxxxxx']  # Replace with your subnet IDs
    }
  }
)

# Deploy the endpoint
sagemaker.create_endpoint(
  EndpointName='secure-endpoint',
  EndpointConfigName='secure-endpoint-config'
)
```

----------

**Step 5: Test the Endpoint**

1.  Open SageMaker Studio or a Python environment.
2.  Send a sample request to the endpoint:

```
import boto3
import json
runtime = boto3.client('sagemaker-runtime')
response = runtime.invoke_endpoint(
  EndpointName='InsideVPCwithSGEndpoint',
  ContentType='text/csv',
  Body="25, 2, 123456"
)
print(response['Body'].read().decode('utf-8'))
```

3.  Verify that the request is processed without errors and that no public internet access was required.

----------

**Step 6: Verify Security and Connectivity**

1.  **Network monitoring:**

-   Use **Amazon VPC Flow Logs** to monitor network traffic and verify that traffic is restricted to private subnets and endpoints.

3.  **Check logs in CloudWatch:**

-   Ensure that no unauthorized access attempts were logged.

----------

**Step 7: Secure Access to Other AWS Services (Optional)**

1.  **Create additional VPC endpoints** for services like Amazon RDS or Amazon SageMaker Feature Store if your model relies on them.
2.  **Example:** Private access to an RDS instance:

-   Create an endpoint for RDS in the same VPC.
-   Configure the security group to allow traffic from SageMaker.

----------

**3. Wrap-Up Discussion**

**Key Takeaways:**

-   Deploying SageMaker endpoints in a VPC ensures private, secure communication without exposing resources to the public internet.
-   VPC endpoints allow secure access to services like Amazon S3.
-   Proper configuration of security groups and subnets is crucial for maintaining network security.

