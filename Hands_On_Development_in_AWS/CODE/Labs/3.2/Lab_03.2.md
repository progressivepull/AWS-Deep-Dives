**Demo Outline for Lesson 3.2: Configuring Data for SageMaker Training Jobs**

----------

**Objective:**

The purpose of this demo is to show how to configure preprocessed data for a **SageMaker training job** by selecting the appropriate data format, uploading the data to Amazon S3, and connecting it to SageMaker's training jobs.

----------

**1. Demo Setup**

**Prerequisites:**

-   AWS account access
-   Amazon S3 bucket for storing the dataset
-   sample_realistic_loan_approval_dataset from the repository
-   SageMaker Studio environment set up

----------

**2. Step-by-Step Demonstration**

----------

**Step 1: Load Data**

1.  Launch **SageMaker Studio** and open **SageMaker Data Wrangler**.
2.  Load the sample_realistic_loan_approval_dataset.parquet dataset.
3.  Handle outliers and missing data.

----------

**Step 3: Export Data from SageMaker Data Wrangler**

1.  Add an **Export** to your data flow and choose **Amazon S3** as the export destination.
2.  Select the appropriate data format (e.g., CSV or Parquet).
3.  Provide the **S3 bucket path** and folder where the data will be stored.

-   Example: s3://my-training-bucket/preprocessed-data/

----------

**Step 4: Verify Data Upload in S3**

1.  Navigate to the **Amazon S3 console**.
2.  Check that the dataset is successfully uploaded to the correct S3 location.
3.  Verify the file structure, format, and metadata if necessary.

----------

**Step 5: Create a SageMaker Training Job and start it**

1.  Go back to **SageMaker Studio** and create a **JupyterLab application**.
2.  Access the application and create a new Python3 (ipykernel) notebook and give it a proper name.
3.  Clone the awsmlassoc repository and open the ipynb for this lab.
4.  Fill in the necessary information for your account
5.  Execute the notebook cells.

----------

**Step 6: Validate the Training Job**

1.  Go back to **SageMaker Studio** and navigate to Training > Jobs
2.  Select the new training job and review the available information
3.  Watch logs in real time

----------

**Step 7: Review the Training Output**

1.  Once the training job completes:
-   Navigate to the output S3 location to view the **trained model artifacts** (model binary files).


----------

**3. Wrap-Up**

**Key Takeaways:**

-   Using JupyterLab and SageMaker SDK to create a training job using a dataset stored in S3

