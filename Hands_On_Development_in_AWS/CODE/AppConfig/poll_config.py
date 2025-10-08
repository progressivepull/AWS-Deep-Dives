#!/usr/bin/python3

import boto3
import time
import json

app_id = "INSERT_APPLICATION_ID"
env_id = "INSERT_ENVIRONMENT_ID"
prof_id = "INSERT_PROFILE_ID"
client = boto3.client('appconfigdata', aws_access_key_id ='INSERT_ACCESS', aws_secret_access_key='INSERT_SECRET', region_name='INSERT_REGION')

session_start_response = client.start_configuration_session(ApplicationIdentifier=app_id, EnvironmentIdentifier=env_id, ConfigurationProfileIdentifier=prof_id)
token = session_start_response["InitialConfigurationToken"]
sleep_dur = 60

print("InitialConfigurationToken:\n{}\n\n".format(token))

def get_config():
  global token
  global sleep_dur
  # Note from the documentation:
  # This API may return empty configuration data if the client already has the  latest  version.
  latest_configuration_response = client.get_latest_configuration(ConfigurationToken=token)
  token = latest_configuration_response["NextPollConfigurationToken"]
  print("New token:\n{}\n".format(token))
  sleep_dur = latest_configuration_response["NextPollIntervalInSeconds"]
  print("sleep_dur:\n{}\n".format(sleep_dur))
  config = latest_configuration_response['Configuration'].read()
  print("Configuration:\n{}\n\n".format(config))


while True:
  get_config()
  print("Sleeping for {} seconds".format(sleep_dur))
  while sleep_dur > 0:
    print(sleep_dur)
    time.sleep(5)
    sleep_dur -= 5
