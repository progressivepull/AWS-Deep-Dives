**Demo Outline for Lesson 5.3: Comparing Model Performance Using A/B Testing**

----------

**Objective:**

This lab will demonstrate through setting up and running an **A/B test** in **SageMaker** to compare the performance of two models. Students will learn to configure endpoints, split traffic between models, monitor results, and interpret which model performs better.

----------

**1. Demo Setup**

**Prerequisites:**

-   AWS account with SageMaker Studio access
-   Two pre-trained models deployed in SageMaker (e.g., Model A and Model B)
-   Dataset for testing model performance (e.g., customer conversion prediction or sentiment analysis)

**Tools and Resources:**

-   SageMaker Studio for managing endpoints
-   Preprocessed test dataset in Amazon S3

----------

**2. Step-by-Step Demonstration**

----------

**Step 1: Explain A/B Testing in Machine Learning**

1.  **What is A/B Testing?**
-   A method to compare two models by exposing them to live or batch data and measuring their performance.

3.  **Why A/B Testing is important:**

-   To determine which model generalizes better to unseen data.
-   Avoid over-reliance on offline validation results and improve real-world performance.

5.  **How it works in SageMaker:**

-   Set up two models behind an endpoint.
-   Split traffic between the two models (e.g., 50%-50%).
-   Monitor performance metrics like latency prediction confidence.

----------

**Step 2: Prepare the Pre-Trained Models**

1.  Ensure that you have two trained models:

-   **Model A:** Baseline model (e.g., trained using default hyperparameters)
-   **Model B:** Improved model (e.g., optimized using hyperparameter tuning)

3.  Save the trained models to S3.

----------

**Step 3: Create an Endpoint for A/B Testing**

1.  Use **SageMaker Multi-Model Endpoint Configuration**:

-   Create an endpoint configuration that routes traffic between the two models.
-   Specify the traffic distribution (e.g., 50% to endpoint-a and 50% to endpoint-b).

3.  **Python code to create the endpoint:**

```
<![endif]-->

import boto3
sagemaker_client = boto3.client('sagemaker')

# Define the two models
variant_a = {
  'VariantName': 'ModelA',
  'ModelName': 'model-a-name',
  'InitialVariantWeight': 0.5,
  'InitialInstanceCount': 1,
  'InstanceType': 'ml.m5.large'
}
variant_b = {
  'VariantName': 'ModelB',
  'ModelName': 'model-b-name',
  'InitialVariantWeight': 0.5,
  'InitialInstanceCount': 1,
  'InstanceType': 'ml.m5.large'
}

# Create endpoint configuration
endpoint_config_name = 'ab-test-endpoint-config'
sagemaker_client.create_endpoint_config(
  EndpointConfigName=endpoint_config_name,
  ProductionVariants=[variant_a, variant_b]
)
# Deploy the endpoint
sagemaker_client.create_endpoint(
  EndpointName='ab-test-endpoint',
  EndpointConfigName=endpoint_config_name
)
```

----------

**Step 4: Test the Endpoint with Sample Data**

1.  Prepare sample requests using the test dataset (e.g., customer records or review texts).
2.  Use Python to send requests to the endpoint:
```
import json
import boto3

runtime = boto3.client('sagemaker-runtime')

# Sample input data
payload = {
  "features": [25, 50000, 1]  # Example feature vector
}

response = runtime.invoke_endpoint( 
  EndpointName='ab-test-endpoint',
  ContentType='text/csv',
  Body=json.dumps(payload)
)

print(response['Body'].read().decode('utf-8'))
```

----------

**Step 6: Monitor Performance Metrics**

1.  **Built-in metrics:** SageMaker automatically collects key metrics, such as:

-   Accuracy
-   Latency
-   Error rates

----------

**Step 7: Analyze and Interpret Results**

1.  Aggregate the predictions and analyze the results using a test set or real-time traffic data.
2.  Compare performance metrics:

-   Does Model B outperform Model A on accuracy, latency, or any other metrics?
-   Identify any trade-offs (e.g., Model B may be more accurate but slower).

4.  Example comparison table:

|Metric|Model A (Baseline) | Model B (Improved) |
|--|--|--|
|Accuracy %| 87|92|
|Latency(ms)|150|170|
|False Positive %|5|3|

----------

**Step 8: Decide the Winning Model**
Based on performance, decide whether to:

-   Fully migrate to Model B
-   Continue testing with more data
-   Retrain or fine-tune models if necessary
----------

**3. Wrap-Up Discussion**

**Key Takeaways:**
-   A/B testing helps evaluate model performance in real-world scenarios, beyond offline metrics.
-   SageMaker makes it easy to split traffic and compare models without downtime.
-   The final decision depends on multiple metrics, including both accuracy and latency.


