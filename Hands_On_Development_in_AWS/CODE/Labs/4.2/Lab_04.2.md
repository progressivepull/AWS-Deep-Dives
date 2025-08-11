**Demo Outline for Lesson 4.2: Setting Up and Running SageMaker Training Jobs**

----------

**Objective:**

The demo will show how to set up and execute a **SageMaker training job** using a built-in algorithm, define the input data configuration, specify hyperparameters, and monitor the training job through SageMaker Studio.

----------

**1. Demo Setup**

**Prerequisites:**

-   AWS account with SageMaker Studio access
-   Amazon S3 bucket with a prepared dataset (e.g., a CSV or Parquet file for training)
-   Familiarity with machine learning concepts (training, validation, hyperparameters)

**Sample Dataset Suggestion:**

-   A binary classification dataset for customer purchase prediction:  
    sample_realistic_loan_approval_dataset.csv

----------

**2. Step-by-Step Demonstration**

----------

**Step 1: Upload Training Data to Amazon S3**

1.  Open the **Amazon S3 console**.
2.  Choose an existing bucket or create a new one.
3.  Upload the training dataset (e.g., training_data.csv) to an appropriate folder:

----------

**Step 2: Launch SageMaker Studio**

1.  Navigate to **SageMaker Studio** from the AWS Management Console.
2.  Open the notebook or **SageMaker Studio interface** for managing training jobs.
3.  Create a Canvas space to use Data Wrangler and start a JupyterLab instance.

----------

**Step 3: Preprocess the data**

1.  Preprocess the data in Data Wrangler
2.  Ensure:

-   Feature for prediction is the first column.
-   Only numerical features are supported.

3.  Export the dataset to S3 in the Data Flow view and note the storage location.

----------

**Step 4: Train and Deploy the model via JupyterLab notebook**

1.  Connect to the Jupyter instance and clone the repository.
2.  Review and set key hyperparameters for the selected algorithm:

-   For **XGBoost**, key hyperparameters include:

-   max_depth: Controls the maximum depth of decision trees.
-   eta (learning rate): Controls the step size during optimization.
-   num_round: Number of boosting rounds.
-   Example configuration:

```
{
  "max_depth": "5",
  "eta": "0.2",
  "num_round": "100",
  "objective": "binary:logistic"
}
```

2.  (Optional) Use **hyperparameter tuning** to find optimal values automatically.


----------

**Step 5: Select Training Instances**

1.  Choose the compute resources for training:

-   Instance type: For example, ml.m5.large for small to medium jobs or ml.p3.2xlarge for larger jobs with GPUs.
-   Number of instances: For distributed training, you can select multiple instances.

3.  Explain the cost considerations and performance trade-offs for different instance types.

----------

**Step 6: Launch the Training Job**

1.  Review all configurations and click **Start Training**.
2.  Monitor the progress of the job through the **SageMaker Studio dashboard** or **SageMaker Training Jobs section**.

----------

**Step 7: Monitor and Evaluate the Training Job**

1.  **View logs:** Open the CloudWatch logs to track training progress and detect errors.
2.  **View metrics:** Review training metrics such as:

-   Training loss
-   Validation accuracy
-   Learning rate schedules (if applicable)

----------

**Step 8: Retrieve and Review the Trained Model**

1.  Once the training job is complete, navigate to the S3 output location.
2.  Review the generated model artifacts:

-   Trained model parameters
-   Metadata and any output logs

3.  (Optional) Use a SageMaker notebook to **load and evaluate the model locally** before deployment.
4.  In SageMaker AI, view the model and note the **Prospective instances to deploy model** option.

----------

**Step 9: Deploy the model**
1.  Continue with the code in the notebook to execute a prediction against the deployed model.

----------

**Step 10: Execute a prediction**

1.  Continue with the code in the notebook to execute a prediction against the deployed model.

Example Python prediction code:
```
# Create a Predictor object
predictor = Predictor(
    endpoint_name=endpoint_name,
    serializer=CSVSerializer(),  # Ensures input is formatted as CSV
    deserializer=JSONDeserializer(),  # Parses JSON output
)

# Sample input data (excluding the target column)
sample_data = [[30, 1, 330300]]  # Must be a 2D list

# Invoke the endpoint
prediction = predictor.predict(sample_data)

print("Prediction response:", prediction)
```
----------

**3. Wrap-Up Discussion**

**Key Takeaways:**

-   Setting up and running a SageMaker training job involves:

-   Configuring input/output data paths
-   Selecting appropriate hyperparameters
-   Choosing suitable compute resources

-   Monitoring and evaluating the job ensures the model is ready for deployment.

