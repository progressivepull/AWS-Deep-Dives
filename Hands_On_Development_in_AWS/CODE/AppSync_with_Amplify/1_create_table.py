import json
import time
import boto3    

table_name = "AppSyncCar" 

client = boto3.client('dynamodb', aws_access_key_id ='INSERT_KEY_ID', aws_secret_access_key='INSERT_SECRET', region_name='INSERT_REGION')


# 
# List current tables
#
tables = client.list_tables()
print()
print("> Current tables")
for table in tables["TableNames"]:
  print("    " + table)
print("")

#
# Create table
#
print("> Creating table")
response = client.create_table(
    AttributeDefinitions=[ { 'AttributeName': 'id', 'AttributeType': 'N' }, ],
    TableName=table_name,
    KeySchema=[ { 'AttributeName': 'id', 'KeyType': 'HASH' }, ],
    ProvisionedThroughput={ 'ReadCapacityUnits': 1, 'WriteCapacityUnits': 1 },
    SSESpecification={ 'Enabled': False }
)
print("    Created table ARN: " + response["TableDescription"]["TableArn"] + "\n")


#
# Wait for table to be ACTIVE
#
print("> Waiting for table state: ACTIVE")
c = 0
while c < 15:
  table_state = client.describe_table(TableName=table_name)
  state = table_state["Table"]["TableStatus"]
  print("    Check " + str(c) + ": " + state)
  if (state == "ACTIVE"): 
    c = 15
  else:
    c += 1
    time.sleep(1)
  

# 
# Load one item into the table
#

print("\n> Inserting 1 item into {}".format(table_name))
item={
        'id':{'N':"1"},
        'make':{'S':"Mazda"},
        'model':{'S':"RX-7"},
        'year':{'N':"1982"}
        }
print("    The item:\n    {}".format(json.dumps(item)))
client.put_item(TableName=table_name, Item=item)

print("\n> Scanning table for count")
count = client.scan(TableName=table_name)
print("    {} item(s) in the new table:".format(count["Count"]))
for item in count["Items"]:
  print("    {}".format(json.dumps(item)))

print()


