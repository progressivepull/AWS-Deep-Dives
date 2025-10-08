import botocore
import boto3    

ec2client = boto3.client('ec2', aws_access_key_id ='IDONTKNOW', aws_secret_access_key='NOTSOSECRET', region_name='us-east-2')

# The following will cause an unauthorized exception
# Comment the following after trying it
response = ec2client.describe_instances()

try:
    response = ec2client.describe_instances()

except botocore.exceptions.ClientError as error:
    # Put your error handling logic here
    print(error)
    #raise error

except botocore.exceptions.ParamValidationError as error:
    raise ValueError('The parameters you provided are incorrect: {}'.format(error))

