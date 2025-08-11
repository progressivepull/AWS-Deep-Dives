**Demo Outline for Lesson 6.1: Deploying Models to Endpoints with SageMaker Web Console**

----------

**Objective:**

This lab will demonstrate how to deploy a trained model to a **real-time inference endpoint** in SageMaker, invoke the endpoint with sample requests, and monitor predictions and performance.

----------

**1. Demo Setup**

**Prerequisites:**

-   AWS account with SageMaker Studio access
-   A pre-trained machine learning model saved in Amazon S3 (e.g., classification or regression model)
-   A sample dataset for making predictions (e.g., customer information or product reviews)

**Tools and Resources:**

-   Amazon SageMaker Studio for endpoint management
-   Amazon S3 for storing the model artifacts
-   Python environment to invoke the endpoint using **boto3**

----------

**2. Step-by-Step Demonstration**

----------

**Step 1: Review the Trained Model**

1.  Use a pre-trained model saved in S3, such as the **XGBoost** model trained to predict loan approvals:

-   Example S3 location: s3://my-bucket/model-artifacts/model.tar.gz

3.  Alternatively, train a model using SageMaker (e.g., **Linear Learner** or **XGBoost**) and output the model artifacts to S3.

----------

**Step 2: Create a SageMaker Model**

1.  Navigate to **SageMaker Studio > Models** and select **Create Model**.
2.  Provide the following configuration:

-   **Model name:** For example, loan-approval-model
-   **Model artifact path:** S3 location of the model artifact (s3://my-bucket/model-artifacts/model.tar.gz)
-   **Inference container:** Select the appropriate container image for the model (e.g., XGBoost container).

----------

**Step 3: Create a Real-Time Endpoint**

1.  Navigate to **SageMaker Studio > Endpoints** and select **Create Endpoint Configuration**.
2.  Provide the following details:

-   **Model name:** Link it to the model created in the previous step.
-   **Instance type:** Select an appropriate instance type (e.g., ml.m5.large).
-   **Initial instance count:** For example, set it to 1 for the demo.

4.  **Create and deploy the endpoint**:

-   Give the endpoint a name (e.g., loan-approval-endpoint) and deploy it.

6.  Wait for the endpoint to be fully deployed (the status will show **InService**).

----------

**Step 4: Prepare Test Input Data**

1.  Load the sample input data from a CSV file or manually define it in a Python script.
2.  Example input for predicting customer purchase likelihood:

```
20, 0, 88332
```
----------

**Step 5: Invoke the Endpoint Using Python**

1.  Open a notebook or Python environment in SageMaker Studio.
2.  Use the **boto3** SDK to send a request to the endpoint:

```
import boto3
import json
import random

endpoint_name = "INSERT_ENDPOINT_NAME"

# Initialize SageMaker runtime
runtime = boto3.client('sagemaker-runtime')


for i in range(50):
    # Generate random input data
    payload = "{},{},{}".format(random.randint(18,80), random.randint(0, 5), random.randint(10000, 150000))


    # Invoke the endpoint
    response = runtime.invoke_endpoint(
      EndpointName=endpoint_name,
      ContentType='text/CSV',
      Body=payload
    )

    # Print the prediction
    print("{}: Input: {} Output: {}".format(i, payload, response['Body'].read().decode('utf-8').strip()))
```
----------

**Step 6: Interpret the Response**

1.  Review the prediction returned by the endpoint.

----------

**Step 7: Monitor the Endpoint**

1.  Go to the **Amazon SageMaker Console > Endpoints** to view endpoint performance.
2.  Monitor metrics such as:

-   **Latency:** How long it takes to process requests.
-   **Invocation count:** The number of requests received by the endpoint.
-   **Errors:** Monitor any invocation errors.

4.  (Optional) Use **Amazon CloudWatch** to set up alerts on key metrics.

----------

**Step 8: Delete the Endpoint**

1.  **Delete the endpoint** after the demo to avoid incurring unnecessary costs:

```
sagemaker = boto3.client('sagemaker')
sagemaker.delete_endpoint(EndpointName='loan-approval-endpoint')
```
----------

**3. Wrap-Up Discussion**

**Key Takeaways:**

-   Real-time inference allows you to make predictions dynamically using SageMaker endpoints.
-   Proper monitoring ensures performance and reliability in production environments.
-   Managing costs involves scaling instances or deleting endpoints when they are no longer needed.



