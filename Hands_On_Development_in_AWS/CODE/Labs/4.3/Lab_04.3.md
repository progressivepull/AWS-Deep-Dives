**Demo Outline for Lesson 4.3: Hyperparameter Tuning with SageMaker Automatic Model Tuning**

----------

**Objective:**

The demo will showcase how to use **SageMaker’s automatic model tuning feature** to optimize hyperparameters for better model performance. Students will learn to define the search space, configure a tuning job, and monitor the results to select the best combination of hyperparameters.

----------

**1. Demo Setup**

**Prerequisites:**

-   AWS account with SageMaker Studio access
-   Dataset uploaded to Amazon S3 (e.g., customer purchase prediction or regression dataset)
-   Familiarity with SageMaker training jobs and basic hyperparameter concepts

**Tools and Resources:**

-   Built-in algorithm (e.g., **XGBoost** or **Linear Learner**)
-   Preprocessed training data available at an S3 location

----------

**2. Step-by-Step Demonstration**

----------

**Step 1: Define the Problem and Dataset**

1.  Open **SageMaker Studio** and navigate to the **S3 bucket** containing the training dataset.
-   For example: `s3://my-bucket/training-data/training_data.csv`

3.  **Use case example:** Optimize the hyperparameters of an XGBoost model for predicting whether a customer will make a purchase.

----------

**Step 2: Set Up Hyperparameter Tuning Configuration**

[https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-ex-tuning-job.html](https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-ex-tuning-job.html)
[https://docs.aws.amazon.com/sagemaker/latest/dg/autopilot-metrics-validation.html](https://docs.aws.amazon.com/sagemaker/latest/dg/autopilot-metrics-validation.html)

1.  **Navigate to SageMaker Studio > Create Tuning Job.**
2.  Define the following key configurations:

-   **Objective metric:** The metric you want to optimize (e.g., validation:accuracy for classification, validation:rmse for regression).
-   **Training job name:** Specify a name for the tuning job.
-   **Algorithm:** Select a built-in algorithm such as **XGBoost** or **Linear Learner**.

----------

**Step 3: Define the Hyperparameter Search Space**

1.  Choose the hyperparameters to tune and specify their ranges:

-   **Discrete parameters:** For parameters with specific possible values (e.g., max_depth).
-   **Continuous parameters:** For ranges of numerical values (e.g., eta, learning rate).
-   **Categorical parameters:** For non-numerical options (e.g., tree methods).

Example configuration for **XGBoost**:

```

{
  "max_depth": {
    "MinValue": "3",
    "MaxValue": "10",  
    "ScalingType": "Linear"
  },
  "eta": {
    "MinValue": "0.01",
    "MaxValue": "0.3",
    "ScalingType": "Logarithmic"
  },
  "gamma": {
    "MinValue": "0",
    "MaxValue": "5",
    "ScalingType": "Linear"
  }
}
```
2.  Set the **parameter ranges** carefully based on knowledge of the algorithm and dataset characteristics.

----------

**Step 4: Specify the Objective Metric**

1.  Choose the **metric to optimize** during tuning.
-   For example, use `validation:accuracy` to maximize classification accuracy or `validation:rmse` to minimize regression error.
3.  Define whether the goal is to **maximize or minimize** the objective metric.

----------

**Step 5: Configure the Tuning Strategy**

1.  Choose a search strategy:
-   **Random Search:** Randomly samples hyperparameters within the specified ranges.
-   **Bayesian Optimization:** Learns from previous trials to improve the search and reach convergence faster.

3.  Specify the number of training jobs to run concurrently and the maximum number of training jobs:
-   Example:
-   MaxParallelTrainingJobs = 3
-   MaxTrainingJobs = 20

----------

**Step 6: Launch the Hyperparameter Tuning Job**

1.  Click **Start Tuning Job**.
2.  Monitor the tuning process in **SageMaker Studio** or the **SageMaker Console**.

----------

**Step 7: Monitor the Job and Review Results**

1.  View the list of completed training jobs and their associated hyperparameter values.
2.  Compare the performance metrics of each job to find the best set of hyperparameters.

Example table of results:
|Training Job|Max Depth|Eta|Gamma|Objective Metric (Validation Accuracy)|
|--|--|--|--|--|
|Job 1|5|0.1|0.0|0.86|
|Job 2|7|0.05|0.5|0.88|
|Job 3|6|0.2|0.3|0.91|

----------

**Step 8: Deploy the Best Model**

1.  Select the training job with the best performance and **deploy the model** using a SageMaker endpoint.
2.  (Optional) Save the best hyperparameters and retrain the model using a larger training dataset for final deployment.

----------

**Step 10: (Optional) Analyze the Hyperparameter Tuning Results**

1.  Use visualizations to understand how different hyperparameters affect model performance.
-   Example: Create a plot showing how `eta` and `max_depth` correlate with the accuracy metric.

----------

**3. Wrap-Up Discussion**

**Key Takeaways:**
-   SageMaker’s automatic model tuning simplifies hyperparameter optimization by automating the search process.
-   Carefully defining the search space and objective metric is critical for effective tuning.
-   Bayesian optimization is often more efficient than random search for complex models.


