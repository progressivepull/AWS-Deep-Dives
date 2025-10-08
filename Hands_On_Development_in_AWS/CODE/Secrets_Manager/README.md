# Secrets Manager

## CLI Example
** Create Secret **
```
$ aws secretsmanager create-secret --name "guru/awsdev/test"
{
    "ARN": "arn:aws:secretsmanager:us-east-2:146868985163:secret:guru/awsdev/test-bMEWwG",
    "Name": "guru/awsdev/test"
}
```

** Put secret value **  
```
$ aws secretsmanager put-secret-value --secret-id "guru/awsdev/test" --secret-string "supersecret"
{
    "ARN": "arn:aws:secretsmanager:us-east-2:146868985163:secret:guru/awsdev/test-bMEWwG",
    "Name": "guru/awsdev/test",
    "VersionId": "147b7b04-6f9c-46c1-8f1b-895db9807237",
    "VersionStages": [
        "AWSCURRENT"
    ]
}
```

** Get Secret Value **
```
$ aws secretsmanager get-secret-value --secret-id "guru/awsdev/test"
{
    "ARN": "arn:aws:secretsmanager:us-east-2:146868985163:secret:guru/awsdev/test-bMEWwG",
    "Name": "guru/awsdev/test",
    "VersionId": "147b7b04-6f9c-46c1-8f1b-895db9807237",
    "SecretString": "supersecret",
    "VersionStages": [
        "AWSCURRENT"
    ],
    "CreatedDate": 1684461001.564
}
```
