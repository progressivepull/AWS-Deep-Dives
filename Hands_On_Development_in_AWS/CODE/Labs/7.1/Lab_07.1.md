**Demo Outline for Lesson 7.1: Building and Automating ML Pipelines in SageMaker**

https://docs.aws.amazon.com/sagemaker/latest/dg/pipelines.html

----------

**Objective:**

This lab will demonstrate how to build and automate end-to-end machine learning pipelines using **SageMaker Pipelines**. Students will create a pipeline that includes data preprocessing, model training, evaluation, and deployment stages.

----------

**1. Demo Setup**

**Prerequisites:**

-   AWS account with SageMaker Studio access
-   Preprocessed dataset stored in Amazon S3
-   Basic knowledge of SageMaker model training and deployment workflows

**Tools and Resources:**

-   SageMaker Pipelines
-   SageMaker Studio
-   Amazon S3 for storing datasets and artifacts

----------

**2. Step-by-Step Demonstration**

----------

**Step 1: Introduction to SageMaker Pipelines**

1.  **What are SageMaker Pipelines?**

-   SageMaker Pipelines automate and orchestrate various steps in the ML workflow, such as data preprocessing, model training, evaluation, and deployment.

3.  **Why use pipelines?**

-   Ensure reproducibility of workflows.
-   Automate model updates and deployments.
-   Reduce manual intervention and improve productivity.

5.  **Pipeline components:**

-   Processing step (data cleaning and preprocessing)
-   Training step
-   Evaluation step
-   Model registration step
-   Conditional deployment step

----------

**Step 2: Prepare the Dataset and S3 Locations**

1.  Upload a sample dataset to **Amazon S3**:

-   Example dataset: s3://my-bucket/ml-pipeline-dataset/train.csv

3.  Ensure that the dataset includes features and a target variable for a classification or regression task.

----------

**Step 3: Discuss the Abalone Example**

[https://github.com/aws/amazon-sagemaker-examples/blob/main/sagemaker-pipelines/tabular/abalone_build_train_deploy/sagemaker-pipelines-preprocess-train-evaluate-batch-transform.ipynb](https://github.com/aws/amazon-sagemaker-examples/blob/main/sagemaker-pipelines/tabular/abalone_build_train_deploy/sagemaker-pipelines-preprocess-train-evaluate-batch-transform.ipynb)
-  Discuss the SageMaker Visual Editor

----------

**Step 4: Create a Pipeline**

1.  **Specify parameters**
```
# Initialize session
### Local
# from sagemaker.workflow.pipeline_context import LocalPipelineSession
# local_pipeline_session = LocalPipelineSession()
# pipeline_session = local_pipeline_session
### Remote
pipeline_session = PipelineSession()

role = "arn:aws:iam::146868985163:role/SageMaker-ExecutionRole"
s3_bucket = "adgu-datasets"

# Define Parameters
xgb_image_uri = image_uris.retrieve(framework='xgboost',region='us-east-1', version='1.7-1')
input_train_path = f"s3://{s3_bucket}/pipeline-dataset/train.csv"
input_validate_path = f"s3://{s3_bucket}/pipeline-dataset/validate.csv"
model_path = f"s3://{s3_bucket}/pipeline-model/"
```


2.  **Specify the model training step** 
```
xgb_train = Estimator(
    image_uri=xgb_image_uri,
    instance_type="ml.m5.xlarge",
    instance_count=1,
    output_path=model_path,
    role=role,
    sagemaker_session=pipeline_session,
)
xgb_train.set_hyperparameters(
    objective="reg:squarederror",
    num_round=50,
    max_depth=5,
    eta=0.2,
    subsample=0.7
)

# Use estimator directly in the TrainingStep insteaad of calling fit()
step_train = TrainingStep(
    name="Train",
    estimator=xgb_train,
    inputs={
        "train": TrainingInput(
            s3_data=input_train_path,
            content_type="text/csv",
        ),
        "validation": TrainingInput(
            s3_data=input_validate_path,
            content_type="text/csv",
        ),
    }
)
```

3.  **Specify the model creation step** 
```
model = Model(
    image_uri=xgb_image_uri,
    sagemaker_session=pipeline_session,
    model_data=step_train.properties.ModelArtifacts.S3ModelArtifacts,
    role=role,
)
step_create_model = ModelStep(
    name="AbaloneCreateModel",
    step_args=model.create(instance_type="ml.m5.large", accelerator_type="ml.eia1.medium"),
)
```


4.  **Specify the model registration step** 
```
step_register = RegisterModel(
    name="RegisterModel",
    estimator=xgb_train,
    model_data=step_train.properties.ModelArtifacts.S3ModelArtifacts,
    content_types=["text/csv"],
    response_types=["application/json"],
    inference_instances=["ml.m5.xlarge"],
    transform_instances=["ml.m5.xlarge"],
    model_package_group_name="PipelineModelPackageGroup",
    approval_status="Approved"
)
```


5.  **Create the Pipline and Execute**
```
pipeline_name = "ADGUPipeline"
pipeline = Pipeline(
    name=pipeline_name,
    steps=[step_train, step_create_model, step_register],
)

pipeline.upsert(role_arn=role)
execution = pipeline.start()
execution.describe()
```

----------

**Step 5: Monitor the Pipeline**

1.  Monitor pipeline execution through **SageMaker Studio > Pipelines**.
2.  Review logs and output artifacts, including the trained model and evaluation metrics.

----------

**Step 6: Optional - Automate Pipeline Execution**

-   Integrate the pipeline with **AWS Step Functions** or **Amazon EventBridge** to trigger automatic execution when new training data is uploaded to S3.

1.  Create an SQS queue to receive the event notificiation
```
aws sqs create-queue --queue-name "pipeline-dataset-queue"
```

2.  Configure IAM policy to allow S3 to generate events to the SQS queue.
```
{
    "Version": "2012-10-17",
    "Id": "example-ID",
    "Statement": [
        {
            "Sid": "example-statement-ID",
            "Effect": "Allow",
            "Principal": {
                "Service": "s3.amazonaws.com"
            },
            "Action": [
                "SQS:SendMessage"
            ],
            "Resource": "arn:aws:sqs:us-east-1:146868985163:pipeline-dataset-queue",
            "Condition": {
                "ArnLike": {
                    "aws:SourceArn": "arn:aws:s3:*:*:adgu-datasets"
                },
                "StringEquals": {
                    "aws:SourceAccount": "146868985163"
                }
            }
        }
    ]
}
```

3.  Create an SNS topic and subscribe an email to it.
3.  Configure event notifications on the S3 bucket, use prefix and suffix to narrow the object's triggering the event.
4.  Create a lambda function to trigger the SageMaker Pipeline execution.  Ensure the execution role permits the execution of SageMaker pipelines, receiveMessage from SQS and publishMessage to SNS.
5.  Configure a trigger on the SQS queue to call the Lambda Function  

----------

**3. Wrap-Up Discussion**

**Key Takeaways:**

-   SageMaker Pipelines automate and streamline end-to-end ML workflows.
-   Each step in the pipeline is modular and reusable.
-   Integrating the Model Registry ensures model versioning and governance.

