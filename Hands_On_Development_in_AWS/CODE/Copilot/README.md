# Copilot

## Install
```
$ sh install-copilot-mac.sh
NOTE: OS specific installation
Password:
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100 49.4M  100 49.4M    0     0  3195k      0  0:00:15  0:00:15 --:--:-- 3488k
👩‍✈️ Launch and manage containerized applications on AWS.

Commands
  Getting Started 🌱
    init        Create a new ECS or App Runner application.
    docs        Open the copilot docs.

  Develop ✨
    app         Commands for applications.
                Applications are a collection of services and environments.
    env         Commands for environments.
                Environments are deployment stages shared between services.
    svc         Commands for services.
                Services are long-running ECS or App Runner services.
    job         Commands for jobs.
                Jobs are tasks that are triggered by events.
    task        Commands for tasks.
                One-off Amazon ECS tasks that terminate once their work is done.

  Release 🚀
    pipeline    Commands for pipelines.
                Continuous delivery pipelines to release services.
    deploy      Deploy a Copilot job or service.

  Extend 🧸
    storage     Commands for working with storage and databases.
    secret      Commands for secrets.
                Secrets are sensitive information that you need in your application.

  Settings ⚙️
    version     Print the version number.
    completion  Output shell completion code.

Flags
  -h, --help      help for copilot
  -v, --version   version for copilot

Examples
  Displays the help menu for the "init" command.
  `$ copilot init --help`
```


## Deploy Demo Application
```
$ sh deploy-demo.sh
>>>>>   It is recommended to use copilot to delete after deploying this demo.
>>>>>   Many resources are created with the one copilot command.

>>>>>   rm -rf demo-temp

>>>>>   mkdir demo-temp; cd demo-temp
>>>>>   git clone https://github.com/aws-samples/amazon-ecs-cli-sample-app.git demo-app
Cloning into 'demo-app'...
remote: Enumerating objects: 12, done.
remote: Counting objects: 100% (4/4), done.
remote: Compressing objects: 100% (4/4), done.
remote: Total 12 (delta 1), reused 0 (delta 0), pack-reused 8
Receiving objects: 100% (12/12), 5.22 KiB | 2.61 MiB/s, done.
Resolving deltas: 100% (2/2), done.

>>>>>   cd demo-app

>>>>>   copilot init --app demo --name api --type 'Load Balanced Web Service' --dockerfile './Dockerfile' --port 80 --deploy
Welcome to the Copilot CLI! We're going to walk you through some questions
to help you get set up with a containerized application on AWS. An application is a collection of
containerized services that operate together.

Ok great, we'll set up a Load Balanced Web Service named api in application demo.

✔ Proposing infrastructure changes for stack demo-infrastructure-roles
- Creating the infrastructure for stack demo-infrastructure-roles                               [create complete]  [33.4s]
  - A StackSet admin role assumed by CloudFormation to manage regional stacks                   [create complete]  [11.8s]
  - An IAM role assumed by the admin role to create ECR repositories, KMS keys, and S3 buckets  [create complete]  [12.9s]
✔ The directory copilot will hold service manifests for application demo.

Note: Architecture type arm64 has been detected. We will set platform 'linux/x86_64' instead. If you'd rather build and run as architecture type arm64, please change the 'platform' field in your workload manifest to 'linux/arm64'.
✔ Wrote the manifest for service api at ../../../copilot/api/manifest.yml
Your manifest contains configurations like your container size and port.

- Update regional resources with stack set "demo-infrastructure"  [succeeded]  [0.0s]

✔ Wrote the manifest for environment test at ../../../copilot/environments/test/manifest.yml
- Update regional resources with stack set "demo-infrastructure"  [succeeded]  [0.0s]
- Update regional resources with stack set "demo-infrastructure"  [succeeded]          [128.4s]
  - Update resources in region "us-east-2"                        [create complete]    [125.2s]
    - KMS key to encrypt pipeline artifacts between stages        [create complete]    [120.8s]
    - ECR container image repository for "api"                    [create complete]    [0.0s]
    - S3 Bucket to store local artifacts                          [create in progress]  [102.6s]
✔ Proposing infrastructure changes for the demo-test environment.
- Creating the infrastructure for the demo-test environment.  [create complete]  [31.0s]
  - An IAM Role for AWS CloudFormation to manage resources    [create complete]  [11.4s]
  - An IAM Role to describe resources in your environment     [create complete]  [11.5s]
✔ Provisioned bootstrap resources for environment test in region us-east-2 under application demo.
✔ Provisioned bootstrap resources for environment test.
✔ Proposing infrastructure changes for the demo-test environment.
- Creating the infrastructure for the demo-test environment.                  [update complete]  [71.1s]
  - An ECS cluster to group your services                                     [create complete]  [2.5s]
  - A security group to allow your containers to talk to each other           [create complete]  [0.0s]
  - An Internet Gateway to connect to the public internet                     [create complete]  [18.6s]
  - Private subnet 1 for resources with no internet access                    [create complete]  [1.4s]
  - Private subnet 2 for resources with no internet access                    [create complete]  [3.7s]
  - A custom route table that directs network traffic for the public subnets  [create complete]  [8.1s]
  - Public subnet 1 for resources that can access the internet                [create complete]  [3.7s]
  - Public subnet 2 for resources that can access the internet                [create complete]  [0.0s]
  - A private DNS namespace for discovering services within the environment   [create complete]  [46.2s]
  - A Virtual Private Cloud to control networking of your AWS resources       [create complete]  [9.8s]
Login Succeeded
Building your container image "api": docker build -t 146868985163.dkr.ecr.us-east-2.amazonaws.com/demo/api:latest -t 146868985163.dkr.ecr.us-east-2.amazonaws.com/demo/api:cee7709 --platform linux/x86_64 --label com.aws.copBuilding your container image "api": docker build -t 146868985163.dkr.ecr.us-east-2.amazonaws.com/demo/api:latest -t 146868985163.dkr.ecr.us-east-2.amazonaws.com/demo/api:cee7709 --platform linux/x86_64 --label com.aws.copBuilding your container image "api": docker build -t 146868985163.dkr.ecr.us-east-2.amazonaws.com/demo/api:latest -t 146868985163.dkr.ecr.us-east-2.amazonaws.com/demo/api:cee7709 --platform linux/x86_64 --label com.aws.copBuilding your container image "api": docker build -t 146868985163.dkr.ecr.us-east-2.amazonaws.com/demo/api:latest -t 146868985163.dkr.ecr.us-east-2.amazonaws.com/demo/api:cee7709 --platform linux/x86_64 --label com.aws.copilot.image.builder=copilot-cli --label com.aws.copilot.image.container.name=api --label com.aws.copilot.image.version=v1.28.0 /Users/nick/bb/awsdevassoc/Copilot/demo-temp/demo-app -f /Users/nick/bb/awsdevassoc/Copilot/demo-temp/demo-app/Dockerfile
     4ca29ffc4a01: Layer already exists
     a83110139647: Layer already exists
     ac4d164fef90: Layer already exists
     cee7709: digest: sha256:2b2a90693e2b072134843455fef16cb564f5e95218c135d9433a86e9561ba86f size: 1986

✔ Proposing infrastructure changes for stack demo-test-api
- Creating the infrastructure for stack demo-test-api                             [create complete]    [322.5s]
  - Service discovery for your services to communicate within the VPC             [create complete]    [0.0s]
  - Update your environment's shared resources                                    [update complete]    [144.1s]
    - A security group for your load balancer allowing HTTP traffic               [create complete]    [0.0s]
    - An Application Load Balancer to distribute public traffic to your services  [create complete]    [125.4s]
    - A load balancer listener to route HTTP traffic                              [create in progress]  [155.6s]
  - An IAM role to update your environment stack                                  [create complete]    [11.6s]
  - An IAM Role for the Fargate agent to make AWS API calls on your behalf        [create complete]    [11.6s]
  - An HTTP listener rule for path `/` that forwards HTTP traffic to your tasks   [create complete]    [0.0s]
  - A custom resource assigning priority for HTTP listener rules                  [create complete]    [0.0s]
  - A CloudWatch log group to hold your service logs                              [create complete]    [0.0s]
  - An IAM Role to describe load balancer rules for assigning a priority          [create complete]    [11.6s]
  - An ECS service to run and maintain your tasks in the environment cluster      [create complete]    [123.6s]
    Deployments
               Revision  Rollout      Desired  Running  Failed  Pending
      PRIMARY  1         [completed]  1        1        0       0
  - A target group to connect the load balancer to your service on port 80        [create complete]    [17.7s]
  - An ECS task definition to group your containers and run them on ECS           [create complete]    [0.0s]
  - An IAM role to control permissions for the containers in your tasks           [create complete]    [11.6s]
✔ Deployed service api.
Recommended follow-up action:
  - You can access your service at http://demo-Publi-10OJM9IFT04RZ-946196431.us-east-2.elb.amazonaws.com over the internet.
- Be a part of the Copilot ✨community✨!
  Ask or answer a question, submit a feature request...
  Visit 👉 https://aws.github.io/copilot-cli/community/get-involved/ to see how!

```

## Delete Demo Application
```
$ sh delete-demo.sh
>>>>>   copilot app delete demo
Sure? Yes
✔ Delete stack demo-test-api
- Update regional resources with stack set "demo-infrastructure"  [succeeded]        [8.8s]
  - Update resources in region "us-east-2"                        [update complete]  [5.9s]

✔ Deleted service api from application demo.
✔ Retained IAM roles for the "test" environment
✔ Delete environment stack demo-test
✔ Deleted environment "test" from application "demo".
✔ Cleaned up deployment resources.
✔ Deleted regional resources for application "demo"
✔ Delete application roles stack demo-infrastructure-roles
✔ Deleted application configuration.
✔ Deleted local .workspace file.
```
