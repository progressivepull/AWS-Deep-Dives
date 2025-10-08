# ParameterStore
## CLI Examples
### Create Parameter
```
[nick@nuc ParameterStore]$ aws ssm put-parameter --name "prod_db_connection_string" --value "mongodb://1.2.3.4/prod" --type String
{
    "Version": 1,
    "Tier": "Standard"
}
[nick@nuc ParameterStore]$ aws ssm put-parameter --name "dev_db_connection_string" --value "mongodb://4.3.2.1/dev" --type String
{
    "Version": 1,
    "Tier": "Standard"
}

```

### List Parameters
```
[nick@nuc ParameterStore]$ aws ssm describe-parameters
{
    "Parameters": [
        {
            "Name": "dev_db_connection_string",
            "Type": "String",
            "LastModifiedDate": 1692986270.14,
            "LastModifiedUser": "arn:aws:iam::146868985163:user/nick",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        },
        {
            "Name": "prod_db_connection_string",
            "Type": "String",
            "LastModifiedDate": 1692986037.483,
            "LastModifiedUser": "arn:aws:iam::146868985163:user/nick",
            "Version": 1,
            "Tier": "Standard",
            "Policies": [],
            "DataType": "text"
        }
    ]
}
```

### Get A Parameter
```
[nick@nuc ParameterStore]$ aws ssm get-parameter --name "prod_db_connection_string"
{
    "Parameter": {
        "Name": "prod_db_connection_string",
        "Type": "String",
        "Value": "mongodb://1.2.3.4/prod",
        "Version": 1,
        "LastModifiedDate": 1692986037.483,
        "ARN": "arn:aws:ssm:us-east-2:146868985163:parameter/prod_db_connection_string",
        "DataType": "text"
    }
}
[nick@nuc ParameterStore]$ aws ssm get-parameter --name "dev_db_connection_string"
{
    "Parameter": {
        "Name": "dev_db_connection_string",
        "Type": "String",
        "Value": "mongodb://4.3.2.1/dev",
        "Version": 1,
        "LastModifiedDate": 1692986270.14,
        "ARN": "arn:aws:ssm:us-east-2:146868985163:parameter/dev_db_connection_string",
        "DataType": "text"
    }
}

```
