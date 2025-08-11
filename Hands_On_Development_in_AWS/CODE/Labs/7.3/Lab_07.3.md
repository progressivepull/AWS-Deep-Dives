**Demo Outline for Lesson 7.3: Triggering Pipelines with EventBridge for Retraining**

----------

**Objective:**

This demo will demonstrate how to trigger SageMaker Pipelines automatically using Amazon EventBridge when new training data is uploaded to Amazon S3. Students will configure EventBridge to monitor data uploads and execute a SageMaker retraining pipeline.

----------

**1. Demo Setup**

**Prerequisites:**

-   AWS account with SageMaker Studio access
-   SageMaker Pipeline set up (from previous lessons) with data processing and model training steps
-   S3 bucket configured to store training data

**Tools and Resources:**

-   Amazon EventBridge to trigger pipeline execution
-   Amazon S3 to upload new training data
-   SageMaker Studio to define and execute pipelines

----------

**2. Step-by-Step Demonstration**

----------

**Step 1: Review the Existing Pipeline**

1.  Review the **SageMaker Pipeline** created in the previous lesson, which includes:

-   **Data processing step:** Cleans the data and stores it in S3.
-   **Model training step:** Trains a model using cleaned data.
-   **Output locations:** Stores the cleaned data and trained model in S3.

----------

**Step 2: Create or Identify the S3 Bucket for Training Data**

1.  Identify or create an S3 bucket where new training data will be uploaded.
2.  Ensure that the pipeline is configured to use this bucket as its input for data processing.

----------

**Step 3: Set Up Amazon EventBridge**

1.  Navigate to **Amazon EventBridge** in the AWS Management Console.
2.  **Create a new rule** to trigger the pipeline when new data is uploaded:

-   **Rule name:**  TriggerSageMakerPipelineOnDataUpload
-   **Event source:** Select **S3** as the event source.
-   **Event pattern:** Configure the pattern to detect PUT operations in the bucket.

```
{
  "source": ["aws.s3"],
  "detail-type": ["Object Created"],
  "detail": {
    "bucket": {
      "name": ["adgu-datasets"]
    },
    "object": {
      "key": [{
        "wildcard": "pipeline-dataset/*.csv"
      }]
    }
  }
}
```
----------

**Step 4: Define the Target as SageMaker Pipeline Execution**

1.  **Set SageMaker Pipeline as the target** of the EventBridge rule.

-   **Target service:** SageMaker Pipelines
-   **Pipeline name:** Select the pipeline created earlier.
-   **Role ARN:** Ensure that EventBridge has permission to invoke the SageMaker pipeline using an IAM role.

3.  (Optional) Pass the S3 object key as input to the pipeline execution.

-   This allows the pipeline to use the newly uploaded data automatically.

----------

**Step 5: Test the EventBridge Trigger**

1.  Upload a new training data file to the S3 bucket:

```
aws s3 cp new_training_data.csv s3://my-bucket/ml-training-data/new_training_data.csv
```
2.  Monitor **Amazon EventBridge** to ensure the event is triggered and the pipeline starts executing.

----------

**Step 76: Monitor the Pipeline Execution**

1.  Open **SageMaker Studio > Pipelines** to monitor the progress of the pipeline.
2.  Check the logs and output artifacts:

-   Cleaned data location in S3
-   Trained model location in S3

----------

**Step 8: Automate Continuous Retraining**

1.  Discuss how **new data uploads can automatically trigger retraining** without manual intervention.
2.  Optionally, integrate the pipeline with a **Model Registry** to register and deploy updated models.

----------

**3. Wrap-Up Discussion**

**Key Takeaways:**

-   Amazon EventBridge can be used to automate ML workflows by triggering pipelines on new data events.
-   Dynamic pipeline configurations enable flexible and scalable retraining.
-   Automating retraining ensures models stay up to date with evolving data.

