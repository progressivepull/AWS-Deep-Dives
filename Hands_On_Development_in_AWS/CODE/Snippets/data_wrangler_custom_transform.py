# Table is available as variable `df`
import json
import boto3
from pyspark.sql.functions import col, udf

query_column = "age"
output_column = "age_category"

def determine_category(query):
  if query < 30: 
    return "young"
  elif query > 60:
    return "old"
  else:
    return "mid"

    
determine_category_udf = udf(determine_category)
df = df.withColumn(output_column, determine_category_udf(col(query_column)))
