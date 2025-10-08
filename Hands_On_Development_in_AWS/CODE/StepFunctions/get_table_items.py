#!/usr/bin/python3
import json
import time
import boto3

table_name = "ADGUIOT"

client = boto3.client('dynamodb', aws_access_key_id ='INSERT_KEY_ID', aws_secret_access_key='INSERT_SECRET', region_name='INSERT_REGION')

print("\n> Scanning table")
count = client.scan(TableName=table_name)
print("    {} item(s) in the new table:".format(count["Count"]))
for item in count["Items"]:
    print("    {}".format(json.dumps(item)))
