**Demo Outline for Lesson 1.3: Ingesting Data with Amazon S3 and SageMaker Data Wrangler**

----------

**Objective:**

The purpose of this demo is to show how to ingest data from Amazon S3 into **SageMaker Data Wrangler** and demonstrate basic data preprocessing, exploration, and transformation.

----------

**1. Demo Setup**

**Prerequisites:**

-   AWS account access
-   Amazon S3 bucket with sample CSV or Parquet dataset (e.g., customer data, product sales, etc.)
-   SageMaker Studio environment set up
-   Basic familiarity with AWS services

**Sample Dataset Suggestion:**

A sample customer sales dataset containing columns like:

-   CustomerID
-   Age
-   Gender
-   Product
-   PurchaseAmount
-   Country

----------

**2. Step-by-Step Demonstration**

----------

**Step 1: Launch SageMaker Studio**

1.  Navigate to the **AWS Management Console**.
2.  Open **Amazon SageMaker** and select **SageMaker Studio**.
3.  Choose or create a **new notebook environment** for this lesson.

----------

**Step 2: Upload Sample Dataset to Amazon S3**

1.  Open the **Amazon S3 Console**.
2.  Select an existing bucket or create a new bucket.
3.  Upload the sample dataset (e.g., sales_data.csv) to the chosen S3 bucket.

----------

**Step 3: Launch SageMaker Data Wrangler**

1.  In **SageMaker Studio**, click on **Data Wrangler** to create a new flow.
2.  Select **Import Data** and choose **Amazon S3** as the data source.

----------

**Step 4: Connect to S3 and Ingest Data**

1.  Provide the **S3 path** to the uploaded dataset (e.g., s3://my-bucket/sample_sales_dataset_dirty.csv).
2.  Select the file format (CSV, Parquet, etc.).
3.  Review and **confirm the schema** detected by Data Wrangler.

----------

**Step 5: Data Preview and Basic Exploration**

1.  **Preview the dataset** in SageMaker Data Wrangler to verify column names, data types, and sample rows.
2.  Perform **basic summary statistics** (mean, median, missing values) for continuous variables like PurchaseAmount.
3.  Check for any **missing or inconsistent data** using built-in data profiling tools.

----------

**Step 6: Perform Simple Data Transformations**

Demonstrate key transformations to prepare the data for machine learning:

-   **Handle missing data:** Replace or drop missing values.

-   Example: Replace missing Age values with the median.

-   **Encoding:** Convert categorical variables like Gender and Country into numerical values.
-   **Column renaming:** Rename columns if needed for clarity (e.g., change PurchaseAmount to Purchase_Value).

----------

**Step 7: Visualize Data (Optional)**

-   Use **Data Wrangler's built-in visualization** tools to create histograms, box plots, or scatter plots.

-   Example: Create a histogram of PurchaseAmount to observe spending distribution.

----------

**Step 8: Export the Preprocessed Data**

1.  Click **Create model** option to **export the cleaned and transformed dataset**.
2.  Data will be stored in S3

----------

**3. Wrap-Up Discussion**

**Key Takeaways from the Demo:**

-   How to ingest raw data from Amazon S3 into SageMaker Canvas Data Wrangler.
-   Basic data exploration and profiling techniques.
-   Simple data cleaning and transformation for machine learning.
-   How to save and export the transformed data.


