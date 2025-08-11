**Demo Outline for Lesson 4.1: Overview of SageMaker Built-in Algorithms and JumpStart Models**

----------

**Objective:**

This demo introduces Amazon SageMaker’s **built-in algorithms** and **JumpStart models**, demonstrating how to choose and deploy them quickly for common machine learning tasks, such as regression, classification, and NLP.

----------

**1. Demo Setup**

**Prerequisites:**

-   AWS account with SageMaker Studio access
-   Familiarity with ML concepts (e.g., supervised learning, classification, and regression)
-   Basic understanding of Amazon S3 for storing training data

**Tools and Resources:**

-   Datasets from the repository
-   SageMaker Studio environment

----------

**2. Step-by-Step Demonstration**

----------

**Step 1: Open SageMaker Studio**

1.  Navigate to **SageMaker Studio** from the AWS Management Console.
2.  Launch the **Studio environment** and open Canvas.

----------

**Step 2: Explore SageMaker Built-in Algorithms**

1.  Go to [SageMaker Documentation](https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html) to browse the list of built-in algorithms.

-   Examples of common algorithms include:

-   **XGBoost:** For regression and classification tasks
-   **Linear Learner:** For binary and multiclass classification
-   **K-Means:** For clustering
-   **Factorization Machines:** For recommendation systems

3.  **Highlight key features:**

-   Fully optimized and pre-installed
-   Can be used with minimal configuration
-   Scalable on large datasets

5.  **Explore algorithm options in the SageMaker Studio UI:**

-   Go to **Training** in SageMaker AI and view algorithm options.
-   Review the **Jumpstar Models** and typical use cases.

----------

**Step 3: Demonstrate Training with a Built-in Algorithm (XGBoost Example) in Canvas**

1.  **Dataset:** Use a sample dataset, such as predicting loan approval likelihood.
2.  Upload data to Amazon S3
3.  Preprocess the data
4.  Create a SageMaker model training job
5.  **Configure permissions to allow model deployment from Canvas
6.  Test inference.  [https://docs.aws.amazon.com/sagemaker/latest/dg/realtime-endpoints-test-endpoints.html](https://docs.aws.amazon.com/sagemaker/latest/dg/realtime-endpoints-test-endpoints.html)

```
import boto3
import pandas as pd

client = boto3.client("runtime.sagemaker")
body = pd.DataFrame(
    [['30', '88999','3']]
).to_csv(header=False, index=False).encode("utf-8")
    
response = client.invoke_endpoint(
    EndpointName="canvas-loan-prediction-deployment",
    ContentType="text/csv",
    Body=body,
    Accept="application/json"
)
print(response["Body"].read().decode('utf-8'))
```

Response:
```
{"predictions": [{"predicted_label": "True", "probability": 0.7052448987960815, "probabilities": "[0.29475510120391846, 0.7052448987960815]", "labels": "['False', 'True']"}]}
```

7.  In SageMaker AI, visit Inference > Endpoints and view the endpoint.

----------

**Step 4: Introduction to SageMaker JumpStart**

1.  Open the **SageMaker JumpStart interface** in SageMaker Studio:

-   Navigate to **SageMaker Studio > JumpStart**.

3.  Purpose of JumpStart:

-   Pre-built, pretrained models for various use cases (e.g., image classification, text analysis, object detection).
-   Easy deployment and fine-tuning options.

5.  Browse available models, including:

-   **Computer Vision:** ResNet, MobileNet, EfficientNet
-   **NLP:** BERT, GPT
-   **Tabular Data:** XGBoost, AutoGluon

----------

**Step 5: Deploy a Pretrained Model (Text Sentiment Classification using BERT)**

1.  **Select a BERT-based sentiment classification model** from JumpStart.
2.  **Deploy the model with a few clicks:**

-   Choose an instance type for deployment.
-   Review Advanced Settings
-   Start the deployment and monitor the endpoint.

4.  **Test the deployed model:**

-   Send sample input data (e.g., a product review) to the endpoint using a Python script:
```
import boto3

runtime = boto3.client('sagemaker-runtime')
endpoint_name = 'INSERT_ENDPOINT_NAME'
response = runtime.invoke_endpoint(
  EndpointName=endpoint_name,
  ContentType='text/csv',
  Body='The product was amazing and exceeded expectations.'
)
print(response['Body'].read().decode('utf-8'))
```

----------

**Step 6: Fine-Tuning a JumpStart Model (Optional)**

1.  Choose an available pretrained model (e.g., ResNet) and fine-tune it on a custom dataset.

----------

**3. Wrap-Up Discussion**

**Key Takeaways:**

-   SageMaker offers a variety of built-in algorithms optimized for fast and scalable training.
-   JumpStart models provide pretrained options for quick deployment and fine-tuning.
-   Both options reduce the time and effort needed to build ML solutions from scratch.
