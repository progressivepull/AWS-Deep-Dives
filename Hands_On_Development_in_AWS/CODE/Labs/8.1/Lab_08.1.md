**Demo Outline for Lesson 8.1: Using SageMaker Model Monitor for Data Drift and Quality**

----------

**Objective:**

This lab will demonstrate how to use **SageMaker Model Monitor** to detect **data drift** and **monitor data quality** in deployed machine learning models. Students will set up monitoring jobs to track input data, detect issues, and generate reports that help maintain model accuracy over time.

----------

**1. Demo Setup**

**Prerequisites:**

-   AWS account with SageMaker Studio access
-   A pre-trained model deployed to a SageMaker endpoint
-   Test dataset stored in Amazon S3 for simulating data drift

**Tools and Resources:**

-   SageMaker Model Monitor
-   Amazon S3 for storing monitoring reports
-   SageMaker Studio for configuration and review

----------

**2. Step-by-Step Demonstration**

----------

**Step 1: Introduction to SageMaker Model Monitor**

1.  **What is SageMaker Model Monitor?**

-   A service that continuously monitors the data sent to a deployed model and detects issues such as data drift, missing values, and anomalies.

3.  **Why monitor models?**

-   Maintain model performance in production.
-   Detect changes in input data distributions (data drift).
-   Identify missing or corrupted data affecting predictions.

5.  **Key components:**

-   Baseline data: The data used to establish a reference for comparison.
-   Monitoring schedule: Periodic jobs to check data quality and drift.
-   Monitoring reports: Summary of detected issues and alerts.

----------

**Step 2: Deploy a Pre-trained Model**

1.  Deploy a pre-trained model (e.g., a classification or regression model) to a SageMaker endpoint:

-   **Model artifact location:**  s3://my-bucket/model-artifacts/model.tar.gz
-   **Endpoint name:**  data-drift-monitor-endpoint

3.  Confirm the endpoint is active by testing it with sample inputs.

----------

**Step 3: Create a Baseline Data Set**

1.  Select or create a dataset that represents the **expected input data distribution**.

-   Example: s3://my-bucket/baseline-data/train.csv

3.  Ensure the baseline dataset includes clean data that the model was trained on.

----------

**Step 4: Generate a Baseline Statistics Report**

1.  Use SageMaker to run a **baseline job** that computes statistics and constraints:

-   **Python code to define the baseline job:**

```
from sagemaker.model_monitor import DefaultModelMonitor
from sagemaker.session import Session

session = Session()

# Define the baseline job
monitor = DefaultModelMonitor(
  role='arn:aws:iam::xxxxxx:role/SageMakerRole',
  instance_count=1,
  instance_type='ml.m5.large',
  volume_size_in_gb=20,
  max_runtime_in_seconds=3600,
  sagemaker_session=session
)

baseline_job = monitor.suggest_baseline(
  baseline_dataset='s3://my-bucket/baseline-data/train.csv',
  dataset_format={'csv': {'header': True}},  
  output_s3_uri='s3://my-bucket/monitoring/baseline-output'
)

baseline_job.wait()
```
2.  Review the baseline statistics and constraints generated in the S3 output.

----------

**Step 5: Set Up the Monitoring Schedule**

1.  **Define the monitoring job:** Create a periodic monitoring job to compare real-time data against the baseline.

```
from sagemaker.model_monitor import MonitoringSchedule
from sagemaker.model_monitor import CronExpressionGenerator

# Define the schedule
schedule = monitor.create_monitoring_schedule(
  monitor_schedule_name='data-drift-monitor-schedule',
  endpoint_input='data-drift-monitor-endpoint',
  output_s3_uri='s3://my-bucket/monitoring/output',
  statistics=monitor.baseline_statistics(),
  constraints=monitor.suggested_constraints(),
  schedule_expression=CronExpressionGenerator.hourly()
)
```
2.  **Review the job configuration:** Ensure that the job monitors the correct endpoint and writes results to S3.

----------

**Step 6: Simulate Data Drift**

1.  Upload a dataset with **different data distributions** to simulate data drift.

-   Example: A test dataset with new feature values or missing columns.
-   Upload the file to S3: `s3://my-bucket/simulated-drift-data/test.csv`

3.  Send predictions to the endpoint using this dataset.

----------

**Step 7: Trigger the Monitoring Job**

1.  The monitoring job will run automatically based on the schedule (e.g., hourly).
2.  To trigger it manually for the demo, use the following Python code:

```

monitor.run_baseline(
  baseline_dataset='s3://my-bucket/simulated-drift-data/test.csv',
  dataset_format={'csv': {'header': True}},
  wait=True
)
```
----------

**Step 8: Review the Monitoring Reports**

1.  Navigate to the **Amazon S3 location** where the monitoring reports are stored (s3://my-bucket/monitoring/output/).
2.  Open and review the key sections of the reports:

-   **Statistics:** Compare current statistics with baseline values.
-   **Violations:** Identify any violations of constraints, such as:

-   Data drift
-   Missing or corrupted data
-   Out-of-range feature values

4.  Example summary:

```
Feature: Age
Baseline Mean: 35
Current Mean: 45
Violation: Significant deviation detected
```
----------

**Step 9: Set Up Alerts (Optional)**

1.  Use **Amazon CloudWatch** to set up alarms based on model monitor metrics.
2.  Configure alerts to notify the team when significant data drift or quality issues are detected.

----------

**3. Wrap-Up Discussion**

**Key Takeaways:**

-   SageMaker Model Monitor automatically detects data drift and quality issues.
-   Regular monitoring helps maintain the reliability and accuracy of deployed models.
-   Monitoring reports provide actionable insights to address data-related issues.
