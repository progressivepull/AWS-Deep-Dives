# AWS SAM CLI
Amazon Web Service Serverless Application Model Command Line Interface

## Installation

### Installation on Linux
```
ubuntu@ip-172-31-0-250:~$ wget -q https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip
ubuntu@ip-172-31-0-250:~$ mkdir sam_cli
ubuntu@ip-172-31-0-250:~$ unzip -q aws-sam-cli-linux-x86_64.zip -d sam_cli/
ubuntu@ip-172-31-0-250:~$ sudo ./sam_cli/install
You can now run: /usr/local/bin/sam --version
ubuntu@ip-172-31-0-250:~$ sam --version
SAM CLI, version 1.84.0
ubuntu@ip-172-31-0-250:~$
```

## Run Hello World Example

### Initialize SAM
```
ubuntu@ip-172-31-0-250:~$ mkdir hw
ubuntu@ip-172-31-0-250:~$ cd hw
ubuntu@ip-172-31-0-250:~/hw$ sam init

	SAM CLI now collects telemetry to better understand customer needs.

	You can OPT OUT and disable telemetry collection by setting the
	environment variable SAM_CLI_TELEMETRY=0 in your shell.
	Thanks for your help!

	Learn More: https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-telemetry.html


You can preselect a particular runtime or package type when using the `sam init` experience.
Call `sam init --help` to learn more.

Which template source would you like to use?
	1 - AWS Quick Start Templates
	2 - Custom Template Location
Choice: 1

Choose an AWS Quick Start application template
	1 - Hello World Example
	2 - Data processing
	3 - Hello World Example With Powertools
	4 - Multi-step workflow
	5 - Scheduled task
	6 - Standalone function
	7 - Serverless API
	8 - Infrastructure event management
	9 - Lambda Response Streaming
	10 - Serverless Connector Hello World Example
	11 - Multi-step workflow with Connectors
	12 - Lambda EFS example
	13 - DynamoDB Example
	14 - Machine Learning
Template: 1

Use the most popular runtime and package type? (Python and zip) [y/N]: y

Would you like to enable X-Ray tracing on the function(s) in your application?  [y/N]:

Would you like to enable monitoring using CloudWatch Application Insights?
For more info, please view https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch-application-insights.html [y/N]:

Project name [sam-app]:

Cloning from https://github.com/aws/aws-sam-cli-app-templates (process may take a moment)

    -----------------------
    Generating application:
    -----------------------
    Name: sam-app
    Runtime: python3.9
    Architectures: x86_64
    Dependency Manager: pip
    Application Template: hello-world
    Output Directory: .
    Configuration file: sam-app/samconfig.toml

    Next steps can be found in the README file at sam-app/README.md


Commands you can use next
=========================
[*] Create pipeline: cd sam-app && sam pipeline init --bootstrap
[*] Validate SAM template: cd sam-app && sam validate
[*] Test Function in the Cloud: cd sam-app && sam sync --stack-name {stack-name} --watch

ubuntu@ip-172-31-0-250:~/hw$
ubuntu@ip-172-31-0-250:~/hw$ cd sam-app/
ubuntu@ip-172-31-0-250:~/hw/sam-app$ tree
.
├── README.md
├── __init__.py
├── events
│   └── event.json
├── hello_world
│   ├── __init__.py
│   ├── app.py
│   └── requirements.txt
├── samconfig.toml
├── template.yaml
└── tests
    ├── __init__.py
    ├── integration
    │   ├── __init__.py
    │   └── test_api_gateway.py
    ├── requirements.txt
    └── unit
        ├── __init__.py
        └── test_handler.py

5 directories, 14 files
ubuntu@ip-172-31-0-250:~/hw/sam-app$
```


### Runtime failure Demo
Ensure you have the required runtime installed.
```
ubuntu@ip-172-31-0-250:~/hw/sam-app$ sam build
Starting Build use cache
Manifest file is changed (new hash: 3298f13049d19cffaa37ca931dd4d421) or dependency folder (.aws-sam/deps/f7b9ead7-176d-4d6a-912b-703295d19fd1) is
missing for (HelloWorldFunction), downloading dependencies and copying/building source
Building codeuri: /home/ubuntu/hw/sam-app/hello_world runtime: python3.9 metadata: {} architecture: x86_64 functions: HelloWorldFunction

Build Failed
Error: PythonPipBuilder:Validation - Binary validation failed for python, searched for python in following locations  : ['/usr/bin/python3', '/bin/python3'] which did not satisfy constraints for runtime: python3.9. Do you have python for runtime: python3.9 on your PATH?
ubuntu@ip-172-31-0-250:~/hw/sam-app$
```

### Build the application
```
ubuntu@ip-172-31-0-250:~/hw/sam-app$ sam build
Starting Build use cache                                                                                                                              
Manifest file is changed (new hash: 3298f13049d19cffaa37ca931dd4d421) or dependency folder (.aws-sam/deps/f7b9ead7-176d-4d6a-912b-703295d19fd1) is    
missing for (HelloWorldFunction), downloading dependencies and copying/building source                                                                
Building codeuri: /home/ubuntu/hw/sam-app/hello_world runtime: python3.9 metadata: {} architecture: x86_64 functions: HelloWorldFunction              
Running PythonPipBuilder:CleanUp                                                                                                                      
Running PythonPipBuilder:ResolveDependencies                                                                                                          
Running PythonPipBuilder:CopySource                                                                                                                   
Running PythonPipBuilder:CopySource                                                                                                                   

Build Succeeded

Built Artifacts  : .aws-sam/build
Built Template   : .aws-sam/build/template.yaml

Commands you can use next
=========================
[*] Validate SAM template: sam validate
[*] Invoke Function: sam local invoke
[*] Test Function in the Cloud: sam sync --stack-name {{stack-name}} --watch
[*] Deploy: sam deploy --guided
ubuntu@ip-172-31-0-250:~/hw/sam-app$ 
```

### Deploy
Ensure AWS you have credential configured.
```
ubuntu@ip-172-31-0-250:~/hw/sam-app$ sam deploy --guided

Configuring SAM deploy
======================

	Looking for config file [samconfig.toml] :  Found
	Reading default arguments  :  Success

	Setting default arguments for 'sam deploy'
	=========================================
	Stack Name [sam-app]:
	AWS Region [us-east-2]:
	#Shows you resources changes to be deployed and require a 'Y' to initiate deploy
	Confirm changes before deploy [Y/n]: n
	#SAM needs permission to be able to create roles to connect to the resources in your template
	Allow SAM CLI IAM role creation [Y/n]:
	#Preserves the state of previously provisioned resources when an operation fails
	Disable rollback [y/N]:
	HelloWorldFunction may not have authorization defined, Is this okay? [y/N]: y
	Save arguments to configuration file [Y/n]:
	SAM configuration file [samconfig.toml]:
	SAM configuration environment [default]:

	Looking for resources needed for deployment:

	Managed S3 bucket: aws-sam-cli-managed-default-samclisourcebucket-14ttmgidyodkr
	A different default S3 bucket can be set in samconfig.toml and auto resolution of buckets turned off by setting resolve_s3=False

        Parameter "stack_name=sam-app" in [default.deploy.parameters] is defined as a global parameter [default.global.parameters].
        This parameter will be only saved under [default.global.parameters] in /home/ubuntu/hw/sam-app/samconfig.toml.

	Saved arguments to config file
	Running 'sam deploy' for future deployments will use the parameters saved above.
	The above parameters can be changed by modifying samconfig.toml
	Learn more about samconfig.toml syntax at
	https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-config.html

	Uploading to sam-app/52182b25e6a404d6c7e9f18a8cf85d8f  603576 / 603576  (100.00%)

	Deploying with following values
	===============================
	Stack name                   : sam-app
	Region                       : us-east-2
	Confirm changeset            : False
	Disable rollback             : False
	Deployment s3 bucket         : aws-sam-cli-managed-default-samclisourcebucket-14ttmgidyodkr
	Capabilities                 : ["CAPABILITY_IAM"]
	Parameter overrides          : {}
	Signing Profiles             : {}

Initiating deployment
=====================

	Uploading to sam-app/185bd384b262e3a36a77c8082fa81a5c.template  1200 / 1200  (100.00%)


Waiting for changeset to be created..

CloudFormation stack changeset
-------------------------------------------------------------------------------------------------------------------------------------------------
Operation                            LogicalResourceId                    ResourceType                         Replacement
-------------------------------------------------------------------------------------------------------------------------------------------------
+ Add                                HelloWorldFunctionHelloWorldPermis   AWS::Lambda::Permission              N/A
                                     sionProd
+ Add                                HelloWorldFunctionRole               AWS::IAM::Role                       N/A
+ Add                                HelloWorldFunction                   AWS::Lambda::Function                N/A
+ Add                                ServerlessRestApiDeployment47fc2d5   AWS::ApiGateway::Deployment          N/A
                                     f9d
+ Add                                ServerlessRestApiProdStage           AWS::ApiGateway::Stage               N/A
+ Add                                ServerlessRestApi                    AWS::ApiGateway::RestApi             N/A
-------------------------------------------------------------------------------------------------------------------------------------------------


Changeset created successfully. arn:aws:cloudformation:us-east-2:146868985163:changeSet/samcli-deploy1684552534/7da3e1b0-e13b-4faf-a46b-5b1d9d2fba9d


2023-05-20 03:15:40 - Waiting for stack create/update to complete

CloudFormation events from stack operations (refresh every 5.0 seconds)
-------------------------------------------------------------------------------------------------------------------------------------------------
ResourceStatus                       ResourceType                         LogicalResourceId                    ResourceStatusReason
-------------------------------------------------------------------------------------------------------------------------------------------------
CREATE_IN_PROGRESS                   AWS::IAM::Role                       HelloWorldFunctionRole               -
CREATE_IN_PROGRESS                   AWS::IAM::Role                       HelloWorldFunctionRole               Resource creation Initiated
CREATE_COMPLETE                      AWS::IAM::Role                       HelloWorldFunctionRole               -
CREATE_IN_PROGRESS                   AWS::Lambda::Function                HelloWorldFunction                   -
CREATE_IN_PROGRESS                   AWS::Lambda::Function                HelloWorldFunction                   Resource creation Initiated
CREATE_COMPLETE                      AWS::Lambda::Function                HelloWorldFunction                   -
CREATE_IN_PROGRESS                   AWS::ApiGateway::RestApi             ServerlessRestApi                    -
CREATE_IN_PROGRESS                   AWS::ApiGateway::RestApi             ServerlessRestApi                    Resource creation Initiated
CREATE_COMPLETE                      AWS::ApiGateway::RestApi             ServerlessRestApi                    -
CREATE_IN_PROGRESS                   AWS::ApiGateway::Deployment          ServerlessRestApiDeployment47fc2d5   -
                                                                          f9d
CREATE_IN_PROGRESS                   AWS::Lambda::Permission              HelloWorldFunctionHelloWorldPermis   -
                                                                          sionProd
CREATE_IN_PROGRESS                   AWS::Lambda::Permission              HelloWorldFunctionHelloWorldPermis   Resource creation Initiated
                                                                          sionProd
CREATE_IN_PROGRESS                   AWS::ApiGateway::Deployment          ServerlessRestApiDeployment47fc2d5   Resource creation Initiated
                                                                          f9d
CREATE_COMPLETE                      AWS::ApiGateway::Deployment          ServerlessRestApiDeployment47fc2d5   -
                                                                          f9d
CREATE_IN_PROGRESS                   AWS::ApiGateway::Stage               ServerlessRestApiProdStage           -
CREATE_IN_PROGRESS                   AWS::ApiGateway::Stage               ServerlessRestApiProdStage           Resource creation Initiated
CREATE_COMPLETE                      AWS::ApiGateway::Stage               ServerlessRestApiProdStage           -
CREATE_COMPLETE                      AWS::Lambda::Permission              HelloWorldFunctionHelloWorldPermis   -
                                                                          sionProd
CREATE_COMPLETE                      AWS::CloudFormation::Stack           sam-app                              -
-------------------------------------------------------------------------------------------------------------------------------------------------

CloudFormation outputs from deployed stack
---------------------------------------------------------------------------------------------------------------------------------------------------
Outputs
---------------------------------------------------------------------------------------------------------------------------------------------------
Key                 HelloWorldFunctionIamRole
Description         Implicit IAM Role created for Hello World function
Value               arn:aws:iam::146868985163:role/sam-app-HelloWorldFunctionRole-XY1GMVCNA4X1

Key                 HelloWorldApi
Description         API Gateway endpoint URL for Prod stage for Hello World function
Value               https://xniva3vs0j.execute-api.us-east-2.amazonaws.com/Prod/hello/

Key                 HelloWorldFunction
Description         Hello World Lambda Function ARN
Value               arn:aws:lambda:us-east-2:146868985163:function:sam-app-HelloWorldFunction-4KZMpZOYejyP
---------------------------------------------------------------------------------------------------------------------------------------------------


Successfully created/updated stack - sam-app in us-east-2

ubuntu@ip-172-31-0-250:~/hw/sam-app$
```

### Test
API Gateway endpoint is in the output of the previous command, or you can run:
```
ubuntu@ip-172-31-0-250:~/hw/sam-app$ sam list endpoints
Endpoints
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Resource ID                                 Physical ID                                 Cloud Endpoints                             Methods
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
HelloWorldFunction                          sam-app-HelloWorldFunction-4KZMpZOYejyP     -                                           -
ServerlessRestApi                           xniva3vs0j                                  https://xniva3vs0j.execute-api.us-          /hello['get']
                                                                                        east-2.amazonaws.com/Prod
                                                                                        https://xniva3vs0j.execute-api.us-
                                                                                        east-2.amazonaws.com/Stage
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ubuntu@ip-172-31-0-250:~/hw/sam-app$


ubuntu@ip-172-31-0-250:~/hw/sam-app$ sam list endpoints --output json
[
  {
    "LogicalResourceId": "HelloWorldFunction",
    "PhysicalResourceId": "sam-app-HelloWorldFunction-4KZMpZOYejyP",
    "CloudEndpoint": "-",
    "Methods": "-"
  },
  {
    "LogicalResourceId": "ServerlessRestApi",
    "PhysicalResourceId": "xniva3vs0j",
    "CloudEndpoint": [
      "https://xniva3vs0j.execute-api.us-east-2.amazonaws.com/Prod",
      "https://xniva3vs0j.execute-api.us-east-2.amazonaws.com/Stage"
    ],
    "Methods": [
      "/hello['get']"
    ]
  }
]
ubuntu@ip-172-31-0-250:~/hw/sam-app$
```


### Send request to validate execution
```
ubuntu@ip-172-31-0-250:~/hw/sam-app$ curl https://xniva3vs0j.execute-api.us-east-2.amazonaws.com/Prod/hello; echo
{"message": "hello world"}
ubuntu@ip-172-31-0-250:~/hw/sam-app$
```


### Modify app.js and sync the changes
```
ubuntu@ip-172-31-0-250:~/hw/sam-app$ vi hello_world/app.py
ubuntu@ip-172-31-0-250:~/hw/sam-app$ sam sync --watch

The SAM CLI will use the AWS Lambda, Amazon API Gateway, and AWS StepFunctions APIs to upload your code without
performing a CloudFormation deployment. This will cause drift in your CloudFormation stack.
**The sync command should only be used against a development stack**.

Confirm that you are synchronizing a development stack.

Enter Y to proceed with the command, or enter N to cancel:
 [Y/n]:
Queued infra sync. Waiting for in progress code syncs to complete...
Starting infra sync.
Manifest is not changed for (HelloWorldFunction), running incremental build
Building codeuri: /home/ubuntu/hw/sam-app/hello_world runtime: python3.9 metadata: {} architecture: x86_64 functions: HelloWorldFunction
Running PythonPipBuilder:CopySource

Build Succeeded

Successfully packaged artifacts and wrote output template to file /tmp/tmpfaume8t3.
Execute the following command to deploy the packaged template
sam deploy --template-file /tmp/tmpfaume8t3 --stack-name <YOUR STACK NAME>


	Deploying with following values
	===============================
	Stack name                   : sam-app
	Region                       : us-east-2
	Disable rollback             : False
	Deployment s3 bucket         : aws-sam-cli-managed-default-samclisourcebucket-14ttmgidyodkr
	Capabilities                 : ["CAPABILITY_NAMED_IAM", "CAPABILITY_AUTO_EXPAND"]
	Parameter overrides          : {}
	Signing Profiles             : null

Initiating deployment
=====================


2023-05-20 03:21:30 - Waiting for stack create/update to complete

CloudFormation events from stack operations (refresh every 0.5 seconds)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ResourceStatus                              ResourceType                                LogicalResourceId                           ResourceStatusReason
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
UPDATE_IN_PROGRESS                          AWS::CloudFormation::Stack                  sam-app                                     Transformation succeeded
CREATE_IN_PROGRESS                          AWS::CloudFormation::Stack                  AwsSamAutoDependencyLayerNestedStack        -
CREATE_IN_PROGRESS                          AWS::CloudFormation::Stack                  AwsSamAutoDependencyLayerNestedStack        Resource creation Initiated
CREATE_COMPLETE                             AWS::CloudFormation::Stack                  AwsSamAutoDependencyLayerNestedStack        -
UPDATE_IN_PROGRESS                          AWS::Lambda::Function                       HelloWorldFunction                          -
UPDATE_COMPLETE                             AWS::Lambda::Function                       HelloWorldFunction                          -
UPDATE_COMPLETE_CLEANUP_IN_PROGRESS         AWS::CloudFormation::Stack                  sam-app                                     -
UPDATE_COMPLETE                             AWS::CloudFormation::Stack                  sam-app                                     -
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CloudFormation outputs from deployed stack
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Outputs
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Key                 HelloWorldFunctionIamRole
Description         Implicit IAM Role created for Hello World function
Value               arn:aws:iam::146868985163:role/sam-app-HelloWorldFunctionRole-XY1GMVCNA4X1

Key                 HelloWorldApi
Description         API Gateway endpoint URL for Prod stage for Hello World function
Value               https://xniva3vs0j.execute-api.us-east-2.amazonaws.com/Prod/hello/

Key                 HelloWorldFunction
Description         Hello World Lambda Function ARN
Value               arn:aws:lambda:us-east-2:146868985163:function:sam-app-HelloWorldFunction-4KZMpZOYejyP
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


Stack update succeeded. Sync infra completed.

CodeTrigger not created as CodeUri or DefinitionUri is missing for ServerlessRestApi.
Infra sync completed.
```

### Send request to validate modification
```
ubuntu@ip-172-31-0-250:~/hw/sam-app$ curl https://xniva3vs0j.execute-api.us-east-2.amazonaws.com/Prod/hello; echo
{"message": "hello there, friend"}
ubuntu@ip-172-31-0-250:~/hw/sam-app$
```


### Delete the application and all resources
NOTE: this does not delete ALL resources.  For example, the S3 bucket will remain.
```
ubuntu@ip-172-31-0-250:~/hw/sam-app$ sam delete
	Are you sure you want to delete the stack sam-app in the region us-east-2 ? [y/N]: y
	Do you want to delete the template file 6ba5c7b80fc9bfafd7433b47fdda1979.template in S3? [y/N]: y
        - Deleting S3 object with key 64a67661a89fd1be74a1bc69dddfab17
        - Deleting S3 object with key b41318fe9bbc85deaadb18f1a887386d.template
        - Deleting S3 object with key 6ba5c7b80fc9bfafd7433b47fdda1979.template
	- Deleting Cloudformation stack sam-app

Deleted successfully
ubuntu@ip-172-31-0-250:~/hw/sam-app$
```

## Note
You can use `sam local invoke` to to test locally.  Also, `sam local start-api` will launch a docker container with the API.

