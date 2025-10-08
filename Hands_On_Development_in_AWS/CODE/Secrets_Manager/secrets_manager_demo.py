import boto3
from botocore.exceptions import ClientError

import random

client = boto3.client('secretsmanager', , aws_access_key_id ='INSERT_ACCESS', aws_secret_access_key='INSERT_SECRET', region_name='INSERT_REGION')

r = random.randint(100, 9999)

secret_name = "prod/test/key-{}".format(str(r))
secret_value = "supersecret-{}".format(str(r))

def create_secret():
    try:
        print("\n>>>>> Creating secret with SecretId: {}".format(secret_name))
        create_secret_value_response = client.create_secret(Name=secret_name)
    except ClientError as e:
        raise e

    print("Create Secret Response:\n{}".format(create_secret_value_response))

def put_secret():
    try:
        print("\n>>>>> Putting secret value: {} to SecretId: {}".format(secret_value, secret_name))
        put_secret_value_response = client.put_secret_value(SecretId=secret_name, SecretString=secret_value)
    except ClientError as e:
        raise e

    print("Put Secret Value Response:\n{}".format(put_secret_value_response))


def get_secret():
    try:
        print("\n>>>>> Getting secret with SecretId: {}".format(secret_name))
        get_secret_value_response = client.get_secret_value(SecretId=secret_name)
    except ClientError as e:
        # For a list of exceptions thrown, see
        # https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_GetSecretValue.html
        raise e

    # Decrypts secret using the associated KMS key.
    print("Get Secret Value Response:\n{}".format(get_secret_value_response));

def delete_secret():
    try:
        print("\n>>>>> Deleting secret with SecretId: {}".format(secret_name))
        delete_secret_value_response = client.delete_secret(SecretId=secret_name)
    except ClientError as e:
        raise e

    print("Delete Secret Response:\n{}".format(delete_secret_value_response))

create_secret()
put_secret()
get_secret()
delete_secret()
