import boto3
client = boto3.client('rds', aws_access_key_id ='INSERT_KEY_ID', aws_secret_access_key='INSERT_SECRET', region_name='INSERT_REGION')

databases = client.describe_db_instances()
print()
print("Database Count: " + str(len(databases["DBInstances"])));
print()

for db in databases["DBInstances"]:
  print("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=")
  print("Name: {}".format(db["DBInstanceIdentifier"]))
  print("Engine: {}".format(db["Engine"]))
  print("Host: {}".format(db["Endpoint"]["Address"]))
  print("Status: {}".format(db["DBInstanceStatus"]))

print("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=")
print()
