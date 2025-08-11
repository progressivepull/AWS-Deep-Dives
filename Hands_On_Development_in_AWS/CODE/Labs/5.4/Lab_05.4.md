**Demo Outline for Lesson 5.4: Managing Model Versions with SageMaker Model Registry**

----------

**Objective:**

The lab will demonstrate the **SageMaker Model Registry**, showcasing how to register, version, and deploy models. Students will also learn how to manage model updates and track different model versions for production use.

----------

**1. Demo Setup**

**Prerequisites:**

-   AWS account with SageMaker Studio access
-   A pre-trained machine learning model saved in Amazon S3
-   Familiarity with SageMaker training and deployment workflows

**Tools and Resources:**

-   SageMaker Model Registry
-   Amazon S3 for storing model artifacts
-   SageMaker Studio for managing the registry

----------

**2. Step-by-Step Demonstration**

----------

**Step 1: Introduction to SageMaker Model Registry**

1.  **What is the SageMaker Model Registry?**

-   A service to track and version models, making it easier to manage multiple versions and deployments.
-   Supports the full lifecycle of a model, from registration to deployment and monitoring.

3.  **Why model versioning is important:**

-   Track performance improvements across model versions.
-   Enable rollback to previous versions if issues arise in production.
-   Ensure model auditability and reproducibility.

----------

**Step 2: Train or Use a Pre-trained Model**

1.  Ensure you have a pre-trained model artifact saved in **Amazon S3** (e.g., a classification model).

-   Example location: s3://my-bucket/model-artifacts/model-v1.tar.gz

3.  Alternatively, run a simple SageMaker training job using **XGBoost** or **Linear Learner** to generate model artifacts.

----------

**Step 3: Create a Model Group in SageMaker Model Registry**

1.  Navigate to **SageMaker Studio > Model Registry**.
2.  **Create a new model group**:

-   Name the group (e.g., customer-churn-models).
-   Provide a brief description (e.g., “Tracks models for predicting customer churn”).

----------

**Step 4: Register a New Model Version**

1.  Go to the **Model Registry** and click on **Register Model Version**.
2.  Provide the following details:

-   **Model group name:** Select the model group created earlier.
-   **Model artifact location:** S3 path of the trained model (`s3://my-bucket/model-artifacts/model-v1.tar.gz`).
-   **Inference container:** Specify the container image for the inference environment (e.g., XGBoost).

4.  **Provide metadata:** Include information such as:

-   Hyperparameters used during training
-   Training dataset location
-   Version notes (e.g., “Baseline model with default parameters”)

6.  Click **Register** to create the model version.

----------

**Step 5: Track and Manage Model Versions**

1.  Open the **model group view** to see the list of registered versions.
2.  Review the details of each version, including:

-   Registration time
-   Metadata and description
-   Status (e.g., pending approval, approved, or archived)

----------

**Step 6: Approve a Model for Deployment**

1.  Select the **latest version** (e.g., Version 1) and mark it as **approved** for deployment.
2.  Add any approval notes for audit purposes (e.g., “Validated on test data with 90% accuracy”).

----------

**Step 7: Deploy the Approved Model to an Endpoint**

1.  From the model version details, click on **Deploy Model**.
2.  Configure the endpoint:

-   **Instance type:** Choose an appropriate instance type (e.g., ml.m5.large).
-   **Endpoint name:** Provide a name for the endpoint (e.g., churn-prediction-endpoint).

4.  Launch the deployment and monitor its progress.

----------

**Step 8: Manage Model Updates**

1.  Train or load a new version of the model (e.g., model-v2.tar.gz).
2.  Register the new version under the same model group.
3.  Mark the new version as **approved** after validation.
4.  (Optional) Roll back to a previous version if necessary.

----------

**3. Wrap-Up Discussion**

**Key Takeaways:**

-   SageMaker Model Registry helps track and version models throughout their lifecycle.
-   Approval workflows ensure only validated models are deployed.
-   Easy rollback to previous versions provides flexibility and safety in production.

