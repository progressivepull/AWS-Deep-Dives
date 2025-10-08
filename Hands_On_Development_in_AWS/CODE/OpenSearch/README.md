# Amazon OpenSearch Service

## CLI Examples

### Create Managed Cluster Domain with defaults
```
$ aws opensearch create-domain --domain-name adgudomain --ebs-options "EBSEnabled=true,VolumeSize=20"
{
    "DomainStatus": {
        "DomainId": "146868985163/adgudomain",
        "DomainName": "adgudomain",
        "ARN": "arn:aws:es:us-east-2:146868985163:domain/adgudomain",
        "Created": true,
        "Deleted": false,
        "Processing": true,
        "UpgradeProcessing": false,
        "EngineVersion": "OpenSearch_2.5",
        "ClusterConfig": {
            "InstanceType": "m4.large.search",
            "InstanceCount": 1,
            "DedicatedMasterEnabled": false,
            "ZoneAwarenessEnabled": false,
            "WarmEnabled": false,
            "ColdStorageOptions": {
                "Enabled": false
            },
            "MultiAZWithStandbyEnabled": false
        },
        "EBSOptions": {
            "EBSEnabled": true,
            "VolumeType": "gp2",
            "VolumeSize": 20
        },
        "AccessPolicies": "",
        "SnapshotOptions": {
            "AutomatedSnapshotStartHour": 0
        },
        "CognitoOptions": {
            "Enabled": false
        },
        "EncryptionAtRestOptions": {
            "Enabled": false
        },
        "NodeToNodeEncryptionOptions": {
            "Enabled": false
        },
        "AdvancedOptions": {
            "override_main_response_version": "false",
            "rest.action.multi.allow_explicit_index": "true"
        },
        "ServiceSoftwareOptions": {
            "CurrentVersion": "",
            "NewVersion": "",
            "UpdateAvailable": false,
            "Cancellable": false,
            "UpdateStatus": "COMPLETED",
            "Description": "There is no software update available for this domain.",
            "AutomatedUpdateDate": 0.0,
            "OptionalDeployment": true
        },
        "DomainEndpointOptions": {
            "EnforceHTTPS": false,
            "TLSSecurityPolicy": "Policy-Min-TLS-1-0-2019-07",
            "CustomEndpointEnabled": false
        },
        "AdvancedSecurityOptions": {
            "Enabled": false,
            "InternalUserDatabaseEnabled": false,
            "AnonymousAuthEnabled": false
        },
        "AutoTuneOptions": {
            "State": "DISABLED",
            "UseOffPeakWindow": false
        },
        "ChangeProgressDetails": {
            "ChangeId": "2fed5cea-1eb9-4c00-b47e-dd9551556836"
        },
        "OffPeakWindowOptions": {
            "Enabled": true,
            "OffPeakWindow": {
                "WindowStartTime": {
                    "Hours": 2,
                    "Minutes": 0
                }
            }
        },
        "SoftwareUpdateOptions": {
            "AutoSoftwareUpdateEnabled": false
        }
    }
}
```

### Create Serverless Collection
See scripts in the serverless directory.
```
$ sh 1_create_encryption_policy.sh
{
    "securityPolicyDetail": {
        "createdDate": 1686859780559,
        "lastModifiedDate": 1686859780559,
        "name": "adgu-policy",
        "policy": {
            "Rules": [
                {
                    "Resource": [
                        "collection/adgu-application"
                    ],
                    "ResourceType": "collection"
                }
            ],
            "AWSOwnedKey": true
        },
        "policyVersion": "MTY4Njg1OTc4MDU1OV8x",
        "type": "encryption"
    }
}

$ sh 2_create_network_policy.sh
{
    "securityPolicyDetail": {
        "createdDate": 1686859784196,
        "lastModifiedDate": 1686859784196,
        "name": "adgu-policy",
        "policy": [
            {
                "Rules": [
                    {
                        "Resource": [
                            "collection/adgu-application"
                        ],
                        "ResourceType": "dashboard"
                    },
                    {
                        "Resource": [
                            "collection/adgu-application"
                        ],
                        "ResourceType": "collection"
                    }
                ],
                "AllowFromPublic": true,
                "Description": "Public access for logs collection"
            }
        ],
        "policyVersion": "MTY4Njg1OTc4NDE5Nl8x",
        "type": "network"
    }
}

$ sh 3_create_collection.sh
{
    "createCollectionDetail": {
        "arn": "arn:aws:aoss:us-east-2:146868985163:collection/7m1hnsqqv03i98zh7gu1",
        "createdDate": 1686859786989,
        "description": "A collection for storing log data",
        "id": "7m1hnsqqv03i98zh7gu1",
        "kmsKeyArn": "auto",
        "lastModifiedDate": 1686859786989,
        "name": "adgu-application",
        "status": "CREATING",
        "type": "SEARCH"
    }
}

$ sh 4_data_access_policy.sh
{
    "accessPolicyDetail": {
        "createdDate": 1686861608981,
        "lastModifiedDate": 1686861608981,
        "name": "adgu-data-access-policy",
        "policy": [
            {
                "Rules": [
                    {
                        "Resource": [
                            "collection/adgu-application"
                        ],
                        "Permission": [
                            "aoss:*"
                        ],
                        "ResourceType": "collection"
                    },
                    {
                        "Resource": [
                            "index/adgu-application/*"
                        ],
                        "Permission": [
                            "aoss:*"
                        ],
                        "ResourceType": "index"
                    }
                ],
                "Principal": [
                    "arn:aws:iam::146868985163:user/nick"
                ]
            }
        ],
        "policyVersion": "MTY4Njg2MTYwODk4MV8x",
        "type": "data"
    }
}
```

 
### List Managed Cluster Domains
```
$ aws opensearch list-domain-names
{
    "DomainNames": [
        {
            "DomainName": "adgudomain",
            "EngineType": "OpenSearch"
        }
    ]
}
```


### List Serverless Collections
```
$ aws opensearchserverless list-collections
{
    "collectionSummaries": [
        {
            "arn": "arn:aws:aoss:us-east-2:146868985163:collection/7m1hnsqqv03i98zh7gu1",
            "id": "7m1hnsqqv03i98zh7gu1",
            "name": "adgu-application",
            "status": "ACTIVE"
        }
    ]
}
```
