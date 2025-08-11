
**Demo Outline for Lesson 6.2: Batch Inference and Asynchronous Inference**

----------

**Objective:**

This lab will demonstrate through performing **batch inference** and **asynchronous inference** using SageMaker. Students will learn how to configure and run batch jobs for large datasets and use asynchronous endpoints for handling high-latency predictions efficiently.

----------

**1. Demo Setup**

**Prerequisites:**

-   AWS account with SageMaker Studio access
-   Pre-trained machine learning model saved in S3 (e.g., for classification or regression)
-   Input data for inference stored in Amazon S3 (e.g., a CSV or JSON file containing test records)

**Tools and Resources:**

-   Amazon SageMaker for creating batch jobs and asynchronous endpoints
-   Amazon S3 for storing input data and prediction results

----------

**2. Step-by-Step Demonstration**

----------

**Part 1: Batch Inference**

----------

**Step 1: Batch Inference Introduction**

1.  **Batch inference** is used when predictions are required for **large batches of data** rather than real-time requests.
2.  Benefits of batch inference:

-   Efficient for large datasets
-   Cost-effective since you can run it on demand
-   Ideal for use cases like offline processing and data pipeline integration

----------
**Step 2: Model Preparation**
1.  Ensure your loan approval model is running on an endpoint.


----------

**Step 3: Prepare the Input Data**

1.  Create or upload a sample dataset to **Amazon S3**:

-   Example data: s3://my-bucket/batch-input-data/data.csv
-   The dataset should have multiple rows of input features, such as:

```
25,50000,2
35,60000,3
45,45000,1
```
----------

**Step 3: Create a SageMaker Batch Transform Job**

1.  Navigate to **SageMaker Studio > Batch Transform Jobs** and create a new job.
2.  Provide the following configurations:

-   **Model name:** Select a pre-trained model (e.g., customer-purchase-model)
-   **Input location:** Provide the S3 location of the input data (s3://my-bucket/batch-input-data/data.csv)
-   **Output location:** Specify an S3 bucket where predictions will be saved (s3://my-bucket/batch-output-data/)
-   **Instance type:** Select an appropriate instance type (e.g., ml.m5.large)

4.  **Configure data formats:** Ensure input and output formats are correctly set (e.g., CSV or JSON).

----------

**Step 4: Run the Batch Transform Job**

1.  Start the batch job and monitor its progress in SageMaker Studio.
2.  Once completed, check the **output location** in Amazon S3 for the prediction results.

----------

**Step 5: Review and Interpret the Predictions**

1.  Open the output file to review predictions:

----------

**Part 2: Asynchronous Inference**

----------

**Step 1: Introduce Asynchronous Inference**

1.  **Asynchronous inference** is used when predictions take longer to compute, making it unsuitable for real-time endpoints.
2.  Benefits of asynchronous inference:

-   Ideal for long-running predictions or models with high latency (e.g., NLP or image processing).
-   Efficient for handling large-scale requests without blocking resources.

----------

**Step 2: Deploy an Asynchronous Endpoint**

1.  **Navigate to SageMaker Studio > Endpoints** and select **Create Endpoint Configuration**.
2.  Provide the following configurations:

-   **Model name:** Select the model you want to deploy.
-   **Instance type:** Choose an instance type based on the model’s resource requirements.
-   **Asynchronous configurations:**

-   **S3 input and output locations:** Specify where requests and responses will be stored.
-   Example:

-   Input: s3://my-bucket/async-input/
-   Output: s3://my-bucket/async-output/

4.  Deploy the endpoint and wait for it to become **InService**.

----------

**Step 3: Submit Asynchronous Inference Requests**

1.  Upload the input file containing test records to the specified **S3 input location**.
2.  Use the **boto3 SDK** to invoke the endpoint asynchronously

----------

**Step 4: Monitor and Retrieve Predictions**

1.  Monitor the job status in **SageMaker Studio** or **Amazon S3**.
2.  Once completed, check the **output location** for prediction results:

----------

**Step 5: Compare Batch and Asynchronous Inference**

|**Feature**|**Batch Inference**|**Asynchronous Inference**|
|--|--|--|
|Use case|Large datasets, offline predictions|High-latency models or long-running jobs|
|Input/Output storage|Amazon S3|Amazon S3|
|Real-time interaction|No|No|
|Typical application|Data pipelines, offline processing|NLP, image processing, large-scale systems|

----------

**3. Wrap-Up Discussion**

**Key Takeaways:**

-   Batch inference is ideal for offline predictions on large datasets.
-   Asynchronous inference handles long-running prediction jobs efficiently.
-   SageMaker provides flexibility in choosing the right inference option based on the use case.

