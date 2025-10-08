import botocore
import boto3    

client = boto3.client('s3', aws_access_key_id ='INSERT_ACCESS', aws_secret_access_key='INSERT_SECRET', region_name='INSERT_REGION')

try:
  client.create_bucket(Bucket='test', ACL='private')
except botocore.exceptions.ClientError as error:
    # Put your error handling logic here
    print(error)
    print("\nThere's a bucket name overlap.  That client error is not very helpful.\n")
    raise(error)
