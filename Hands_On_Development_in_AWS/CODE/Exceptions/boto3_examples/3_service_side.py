import botocore
import boto3    

ec2client = boto3.client('ec2', aws_access_key_id ='ACCESS_KEY', aws_secret_access_key='SECRET_KEY', region_name='INSERT_REGION')

try:
    response = ec2client.describe_instances(InstanceIds=[ 'InvalidID' ])

except botocore.exceptions.ClientError as error:
    # Put your error handling logic here
    print(error)
    #raise error

except botocore.exceptions.ParamValidationError as error:
    raise ValueError('The parameters you provided are incorrect: {}'.format(error))


try:
    response = ec2client.describe_instances(InstanceIds=[ 'i-05149ff2019b97596' ])
    print("No error for describe_instances ID: i-05149ff2019b97596")

except botocore.exceptions.ClientError as error:
    # Put your error handling logic here
    print(error)
    #raise error

except botocore.exceptions.ParamValidationError as error:
    raise ValueError('The parameters you provided are incorrect: {}'.format(error))

