#!/usr/bin/python3 

import boto3
import pandas as pd
import time
from sagemaker.feature_store.feature_group import FeatureGroup
from sagemaker.session import Session

# AWS Configuration
region = boto3.Session().region_name
sagemaker_client = boto3.client("sagemaker", region_name=region)
featurestore_runtime = boto3.client("sagemaker-featurestore-runtime", region_name=region)
sagemaker_session = Session()

# SageMaker Feature Group Name
FEATURE_GROUP_NAME = "HomeSales"

# Load CSV data
CSV_FILE_PATH = "sample_home_sales_dataset_300.csv"  

# Read CSV into a Pandas DataFrame
df = pd.read_csv(CSV_FILE_PATH)

# Ensure timestamp is in string format (Epoch time)
df["timestamp"] = df["timestamp"].astype(str)

# Convert DataFrame to SageMaker Feature Store format
def format_records(dataframe):
    """Format data to the SageMaker Feature Store structure"""
    records = []
    for _, row in dataframe.iterrows():
        record = [
            {"FeatureName": "id", "ValueAsString": str(row["id"])},
            {"FeatureName": "timestamp", "ValueAsString": row["timestamp"]},
            {"FeatureName": "built", "ValueAsString": str(int(row["built"]))},
            {"FeatureName": "price", "ValueAsString": str(float(row["price"]))},
            {"FeatureName": "distanceToElem", "ValueAsString": str(int(row["distanceToElem"]))},
            {"FeatureName": "bedrooms", "ValueAsString": str(int(row["bedrooms"]))},
            {"FeatureName": "bathrooms", "ValueAsString": str(int(row["bathrooms"]))},
        ]
        records.append(record)
    return records

# Ingest data into SageMaker Feature Store
def ingest_data(dataframe):
    """Ingests data into SageMaker Feature Store"""
    records = format_records(dataframe)
    for record in records:
        response = featurestore_runtime.put_record(
            FeatureGroupName=FEATURE_GROUP_NAME,
            Record=record
        )
        print(f"Record ID {record[0]['ValueAsString']} ingested, Response: {response}")

if __name__ == "__main__":
    print("Starting data ingestion for HomeSales Feature Group...")
    ingest_data(df)
    print("Data ingestion complete!")

