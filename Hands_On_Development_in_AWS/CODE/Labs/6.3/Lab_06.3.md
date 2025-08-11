**Demo Outline for Lesson 6.3: Using SageMaker Neo for Edge Deployment**

----------

**Objective:**

This demo will showcase how to use **SageMaker Neo** to optimize and compile a machine learning model for deployment on edge devices, such as IoT devices, mobile devices, or embedded systems. Students will learn the benefits of model optimization, how to compile models using SageMaker Neo, and deploy them for edge inference.

----------

**1. Demo Setup**

**Prerequisites:**

-   AWS account with SageMaker Studio access
-   A pre-trained model saved in Amazon S3 (e.g., an image classification model using ResNet or a regression model using XGBoost)
-   AWS IoT Greengrass (optional) if deploying to a real edge device

**Tools and Resources:**

-   SageMaker Neo for model compilation
-   Pre-trained model in Amazon S3
-   Edge runtime (optional) or local test environment
-   https://docs.aws.amazon.com/sagemaker/latest/dg/neo-deployment-edge.html
-   https://docs.aws.amazon.com/sagemaker/latest/dg/neo.html
-   https://docs.aws.amazon.com/sagemaker/latest/dg/neo-getting-started-edge-step3.html

----------

**2. Step-by-Step Demonstration**

----------

**Step 1: Introduction to SageMaker Neo**

1.  **What is SageMaker Neo?**

-   SageMaker Neo allows you to **compile and optimize models** for deployment on edge devices by converting them into a format optimized for specific hardware platforms.

3.  **Why use SageMaker Neo?**

-   Improved **latency and inference speed** on edge devices.
-   Reduced **model size and memory requirements**.
-   Compatibility with multiple device types, such as **Raspberry Pi, Nvidia Jetson, ARM, and Intel architectures**.

5.  **Use cases:**

-   Autonomous vehicles
-   Smart devices
-   Mobile applications
-   IoT systems

----------

**Step 2: Review the Pre-trained Model**

1.  Use a **pre-trained model** (e.g., the loan approval dataset).

-   Model stored in Amazon S3: s3://my-bucket/model-artifacts/model.tar.gz

3.  Verify that the model has been trained and can be used for inference.

----------

**Step 3: Open SageMaker Studio and Launch the Compilation Job**

1.  Navigate to **SageMaker Studio > Neo Compilation Jobs** and select **Create Compilation Job**.
2.  Provide the following details:

-   **Model name:** The pre-trained model to be compiled.
-   **Model artifact location:** The S3 path of the model (s3://my-bucket/model-artifacts/model.tar.gz)
-   **Target device:** Select the appropriate target hardware (e.g., rasp3b for Raspberry Pi, jetson_tx2 for Nvidia Jetson).
-   **Instance type:** Select an appropriate SageMaker instance to run the compilation.

----------

**Step 4: Configure the Compilation Job**

1.  Define the **input configuration**, including the model’s input shape and data type:

-   Example for an image classification model:

```
{
  "InputShape": {"data": [1, 3, 224, 224]},
  "DataType": "float32",
  "Framework": "MXNET"
}
```
2.  Specify the **output location** for the compiled model (e.g., s3://my-bucket/neo-compiled-model-output/).

----------

**Step 5: Run the Compilation Job**

1.  Launch the compilation job and monitor its status in SageMaker Studio.
2.  Once the job completes, check the output location in Amazon S3 for the compiled model artifacts.

----------

**Step 6: Deploy the Compiled Model**

1.  **Choose the deployment option:**

-   **AWS IoT Greengrass**: If deploying to IoT devices managed via AWS IoT.
-   **Local deployment**: Download the compiled model and deploy it manually on a test environment or edge device.

3.  **Test locally:** For a local deployment, download the compiled model and run it using a runtime compatible with the edge device (e.g., Deep Learning Runtime).

DLR (Deep Learning Runtime) is an open-source runtime library designed to efficiently run machine learning models that have been compiled by AWS SageMaker Neo or Apache TVM.  

-   Example test script (Python):
```
# download the compiled model to a Linux host
mkdir dlr-model
tar xvzf model-LINUX_X86_64.tar.gz --directory dlr-model

```

```
import dlr
import numpy as np
import csv
import os

from dlr.counter.phone_home import PhoneHome
PhoneHome.disable_feature()

# Load the SageMaker Neo model
MODEL_DIR = "./dlr-model"  # Path where the compiled model is stored
model = dlr.DLRModel(MODEL_DIR, 'cpu', 0)  # Modify 'cpu' based on your target device (e.g., 'gpu', 'cuda')

def preprocess_csv(csv_string):
    """
    Converts a CSV string into a NumPy array suitable for inference.
    Assumes numerical data with no headers.
    """
    csv_reader = csv.reader(csv_string.strip().split("\n"))
    data = [list(map(float, row)) for row in csv_reader]  # Convert to float
    return np.array(data, dtype=np.float32)

def run_inference(csv_string):
    """
    Runs inference on the provided CSV string.
    """
    input_data = preprocess_csv(csv_string)
    input_name = model.get_input_names()[0]  # Get model input name
    output = model.run({input_name: input_data})
    return output

# Run inference
csv_input = """32,4,153000"""
result = run_inference(csv_input)
print("Inference: {} Result: {}".format(csv_input, result[0][0][0]))

csv_input = """44,1,52000"""
result = run_inference(csv_input)
print("Inference: {} Result: {}".format(csv_input, result[0][0][0]))

csv_input = """77,3,120000"""
result = run_inference(csv_input)
print("Inference: {} Result: {}".format(csv_input, result[0][0][0]))

csv_input = """51,0,89333"""
result = run_inference(csv_input)
print("Inference: {} Result: {}".format(csv_input, result[0][0][0]))

csv_input = """18,3,18000"""
result = run_inference(csv_input)
print("Inference: {} Result: {}".format(csv_input, result[0][0][0]))
```

3.  **If using AWS IoT Greengrass:**

-   Create an AWS IoT Greengrass group and deploy the model using the **ML inference component**.

----------

**Step 7: Monitor and Evaluate Performance**

1.  Evaluate the **latency, inference speed, and resource utilization** of the model on the edge device.
2.  Compare performance between the original model and the optimized model to demonstrate the efficiency gained using SageMaker Neo.

----------

**3. Wrap-Up Discussion**

**Key Takeaways:**

-   SageMaker Neo makes it easy to optimize models for edge deployment with minimal effort.
-   Optimized models improve inference speed, memory efficiency, and scalability.
-   Edge deployment is critical for use cases requiring offline or real-time inference.

