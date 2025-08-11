**Demo Outline for Lesson 2.1: Data Cleaning and Preprocessing with SageMaker Data Wrangler**

----------

**Objective:**

The demo will focus on cleaning and preprocessing a raw dataset using SageMaker Data Wrangler. The key tasks will include handling missing values, detecting and handling outliers, feature transformations, and encoding categorical variables.

----------

**1. Demo Setup**

**Prerequisites:**

-   AWS account access
-   Amazon S3 bucket with a sample raw dataset (containing issues like missing values, outliers, and categorical features)
-   SageMaker Studio environment set up

**Sample Dataset:**

A dataset is provided with this repository containing 5,000 items with the following features: `sample_loan_approval_dataset_dirty.csv`

-   CustomerID (Unique identifier)
-   Age (With some missing values)
-   Income (With outliers)
-   Gender (Categorical)
-   PurchaseAmount (Numerical)

----------

**2. Step-by-Step Demonstration**

----------

**Step 1: Launch SageMaker Data Wrangler**

1.  Open SageMaker Studio.
2.  Launch Data Wrangler and create a new flow.
3.  Import the raw dataset from Amazon S3 or use an existing SageMaker dataset.

----------

**Step 2: Data Profiling and Initial Exploration**

1.  Preview the dataset in Data Wrangler to view its structure (columns and sample rows).
2.  Use Data Wrangler’s profiling tools to generate summary statistics, including:

-   Mean, median, and standard deviation for continuous columns.
-   Frequency distributions for categorical variables.
-   Missing value counts.

----------

**Step 3: Handle Missing Data**

1.  Identify missing data in columns such as Age or Income.
2.  Demonstrate different strategies for handling missing values:

-   Drop rows or columns with a high proportion of missing data.
-   Impute missing values using the mean, median, or mode.
-   Example: Impute missing Age values using the median.

----------

**Step 4: Handle Outliers**

1.  Detect potential outliers in continuous variables (e.g., Income or PurchaseAmount) using box plots or summary statistics.
2.  Demonstrate how to handle outliers:

-   Apply clipping (set upper and lower limits).
-   Replace outliers with the median.
-   Drop rows with extreme outliers.
-   Example: Clip Income values that exceed $200,000.

----------

**Step 5: Normalize or Scale Features**

1.  Normalize continuous variables (e.g., Income or PurchaseAmount) to improve model performance.

-   Use min-max scaling to transform the data between 0 and 1.
-   Alternatively, use z-score normalization to center data around the mean.

----------

**Step 6: Encode Categorical Variables**

1.  Handle categorical variables like Gender using one of the following encoding techniques:

-   One-hot encoding: Creates binary columns for each category.
-   Label encoding: Assigns numeric labels to categories.
-   Example: One-hot encode Gender into binary columns Male and Female.

----------

**Step 7: Create New Features (Optional)**

-   Demonstrate feature creation using existing columns.
-   Example: Create a new feature Age Group by binning the Age column into categories (e.g., young, middle-aged, senior).

----------

**Step 8: Data Validation and Final Review**

1.  Review the transformed dataset to ensure missing values, outliers, and encoding issues have been handled properly.
2.  Generate summary statistics and visualizations to validate that the data is ready for model training.

----------

**Step 9: Export the Cleaned Dataset**

1.  Choose the Create Model option to export the preprocessed data:

-   Amazon S3

----------

**3. Wrap-Up Discussion**

**Key Takeaways:**

-   How to profile raw data and identify common issues like missing values and outliers.
-   Cleaning and transforming data using built-in features of Data Wrangler.
-   The importance of scaling, encoding, and creating new features for machine learning.

