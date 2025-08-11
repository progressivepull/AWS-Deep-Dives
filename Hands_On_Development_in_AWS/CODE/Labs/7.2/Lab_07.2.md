**Demo Outline for Lesson 7.2: Integrating Data Processing and Training Steps**

----------

**Objective:**

This lab will demonstrate how to **integrate data processing and model training steps** in a single SageMaker Pipeline. Students will learn how to preprocess data using a SageMaker Processing job, pass the cleaned data to a training step, and execute the pipeline.

----------

**1. Demo Setup**

**Prerequisites:**

-   AWS account with SageMaker Studio access
-   A sample dataset uploaded to Amazon S3 (e.g., for classification or regression)
-   Basic familiarity with SageMaker Pipelines

**Tools and Resources:**

-   SageMaker Studio
-   Amazon S3 for storing datasets and artifacts
-   SageMaker Processing and Training jobs

----------

**2. Step-by-Step Demonstration**

----------

**Step 1: Upload Dataset to Amazon S3**

1.  Use a sample dataset (e.g., customer churn prediction or house price prediction).
2.  Upload the raw dataset to an S3 bucket:

-   Example: s3://my-bucket/ml-pipeline-raw-data/dirty.csv

4.  Ensure the dataset has features and a target column.

----------

**Step 2: Create a Data Processing Step**

1.  Define a **Python preprocessing script** (preprocessing.py):

```
import os
import numpy as np
import pandas as pd

from sklearn.impute import SimpleImputer

# CSV Headers:
# LoanApproved,Age,EducationLevel,Income

if __name__ == "__main__":
    base_dir = "/opt/ml/processing"

    df = pd.read_csv(
        f"{base_dir}/input/dirty.csv"
    )

    # Create imputer for empty values
    imp_mean = SimpleImputer(missing_values=np.nan, strategy='mean')
    imp_mean.fit(df)
    out = imp_mean.transform(df)

    # split into training and validation datasets
    train, validation = np.split(out, [int(0.7 * len(out))])
    
    # Convert to integer before saving to CSV
    pd.DataFrame(train).astype(int).to_csv(f"{base_dir}/train/train.csv", header=False, index=False)
    pd.DataFrame(validation).astype(int).to_csv(f"{base_dir}/validation/validation.csv", header=False, index=False)
```
2.  **Set up the SageMaker Processing Job:**

-   Use **SageMaker SKLearnProcessor** for data preprocessing.
-   **Python code to define the step:**

```
from sagemaker.sklearn.processing import SKLearnProcessor
from sagemaker.processing import ProcessingInput, ProcessingOutput
from sagemaker.workflow.steps import ProcessingStep

framework_version = "1.2-1"

sklearn_processor = SKLearnProcessor(
    framework_version=framework_version,
    instance_type="ml.m5.xlarge",
    instance_count=1,
    base_job_name="sklearn-process",
    role=role,
    sagemaker_session=pipeline_session,
)


processor_args = sklearn_processor.run(
    inputs=[
        ProcessingInput(source=input_process_path, destination="/opt/ml/processing/input"),
    ],
    outputs=[
        ProcessingOutput(output_name="train", source="/opt/ml/processing/train"),
        ProcessingOutput(output_name="validation", source="/opt/ml/processing/validation"),
        ProcessingOutput(output_name="test", source="/opt/ml/processing/test"),
    ],
    code="preprocessing.py",
)

step_process = ProcessingStep(name="DataProcess", step_args=processor_args)

```
----------

**Step 3: Create a Model Training Step**

1.  **Use a built-in SageMaker algorithm** such as XGBoost or Linear Learner.
2.  Define the **training step using SageMaker Python SDK**:

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
            s3_data=step_process.properties.ProcessingOutputConfig.Outputs["train"].S3Output.S3Uri,
            content_type="text/csv",
        ),
        "validation": TrainingInput(
            s3_data=step_process.properties.ProcessingOutputConfig.Outputs["validation"].S3Output.S3Uri,
            content_type="text/csv",
        ),
    }
)
```
----------

**Step 4: Integrate the Steps in a SageMaker Pipeline**

1.  **Define the pipeline:**

-   Include both the data processing step and the model training step.
-   Ensure that the output of the processing step is connected to the input of the training step.

```

model = Model(
    image_uri=xgb_image_uri,
    sagemaker_session=pipeline_session,
    model_data=step_train.properties.ModelArtifacts.S3ModelArtifacts,
    role=role,
)
step_create_model = ModelStep(
    name="CreateModel",
    step_args=model.create(instance_type="ml.m5.large", accelerator_type="ml.eia1.medium"),
)


pipeline_name = "ADGUPipeline"
pipeline = Pipeline(
    name=pipeline_name,
    steps=[step_process, step_train, step_create_model],
)


```
2.  **Validate and visualize the pipeline:**

-   Validate the pipeline definition using:

```
pipeline.upsert(role_arn=role)
```
----------

**Step 5: Execute the Pipeline**

1.  **Start the pipeline execution:**

```
execution = pipeline.start()
execution.wait()
execution.describe()
```
2.  Monitor the execution through the **SageMaker Studio > Pipelines Dashboard**.

----------

**Step 6: Review the Output**

1.  Once the pipeline execution is complete:

-   **Cleaned data:** Check the output location in S3.
-   **Trained model:** Check the output location for the model.

----------

**Step 7: (Optional) Register the Model in the Model Registry**

1.  If the model meets performance criteria, register it in the SageMaker **Model Registry** for versioning and deployment.

----------

**Step 8: Automate the Pipeline**

1.  Integrate the pipeline with **AWS Step Functions** or **Amazon EventBridge** to automatically trigger execution when new data is available.

----------

**3. Wrap-Up Discussion**

**Key Takeaways:**

-   SageMaker Pipelines seamlessly integrate data preprocessing and model training.
-   Outputs from one step can serve as inputs to the next, ensuring reproducibility and scalability.
-   Automating the pipeline reduces manual intervention and enables continuous model updates.
learning workflows.
