#!/bin/sh
aws rds create-db-instance --db-instance-identifier "AWSDevTest" --db-instance-class db.t3.micro --engine MySQL --master-username root --master-user-password "supersecret" --no-multi-az --allocated-storage 20
