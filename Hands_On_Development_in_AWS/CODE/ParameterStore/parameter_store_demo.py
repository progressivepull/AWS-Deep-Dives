#!/usr/bin/python3

import boto3
import time
import json

client = boto3.client('ssm', aws_access_key_id ='INSERT_ACCESS', aws_secret_access_key='INSERT_SECRET',                    region_name='INSERT_REGION')

def put_parameters():
  print("Putting 5 parameters")
  try:
    client.put_parameter(Name="Key1", Value="Value1", Type="String")
    client.put_parameter(Name="Key2", Value="Value2", Type="String")
    client.put_parameter(Name="Key3", Value="Value3", Type="String")
    client.put_parameter(Name="Key4", Value="Value4", Type="String")
    client.put_parameter(Name="Key5", Value="Value5", Type="String")
  except:
    print("\nERROR: Exception putting parameters, assuming they exist for demo purposes.")

def dump_parameters():
  print("\nDump all parameters: (Key -- Value)")
  params = client.describe_parameters()
  for p in params["Parameters"]:
    param = client.get_parameter(Name=p["Name"])
    print("{}\t--\t{}".format(param["Parameter"]["Name"], param["Parameter"]["Value"]))
  print()

def delete_all_parameters():
  print("\nDeleting all parameters...")
  params = client.describe_parameters()
  for p in params["Parameters"]:
    param = client.get_parameter(Name=p["Name"])
    do_delete = input("Delete key named: \"{}\" (y/n)? ".format(param["Parameter"]["Name"]))
    if do_delete == "y": 
      delete_result = client.delete_parameter(Name=param["Parameter"]["Name"])
      print(delete_result)
  print()

put_parameters()
dump_parameters()
delete_all_parameters()
dump_parameters()
