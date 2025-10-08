# ElastiCache

## CLI Examples

### List Clusters
```
$ aws elasticache describe-cache-clusters
{
    "CacheClusters": [
        {
            "CacheClusterId": "deletemeeccluster",
            "ConfigurationEndpoint": {
                "Address": "deletemeeccluster.llgnjm.cfg.use2.cache.amazonaws.com",
                "Port": 11211
            },
            "ClientDownloadLandingPage": "https://console.aws.amazon.com/elasticache/home#client-download:",
            "CacheNodeType": "cache.t4g.small",
            "Engine": "memcached",
            "EngineVersion": "1.6.17",
            "CacheClusterStatus": "available",
            "NumCacheNodes": 1,
            "PreferredAvailabilityZone": "us-east-2a",
            "CacheClusterCreateTime": "2023-05-19T23:24:12.290Z",
            "PreferredMaintenanceWindow": "tue:02:00-tue:03:00",
            "PendingModifiedValues": {},
            "CacheSecurityGroups": [],
            "CacheParameterGroup": {
                "CacheParameterGroupName": "default.memcached1.6",
                "ParameterApplyStatus": "in-sync",
                "CacheNodeIdsToReboot": []
            },
            "CacheSubnetGroupName": "elasticachesn",
            "AutoMinorVersionUpgrade": true,
            "SecurityGroups": [
                {
                    "SecurityGroupId": "sg-0be6e9c99a699a588",
                    "Status": "active"
                }
            ],
            "AuthTokenEnabled": false,
            "TransitEncryptionEnabled": false,
            "AtRestEncryptionEnabled": false,
            "ARN": "arn:aws:elasticache:us-east-2:146868985163:cluster:deletemeeccluster",
            "ReplicationGroupLogDeliveryEnabled": false,
            "LogDeliveryConfigurations": [],
            "NetworkType": "ipv4",
            "IpDiscovery": "ipv4"
        }
    ]
}
```

### Delete a Cluster
```
$ aws elasticache delete-cache-cluster --cache-cluster-id deletemeeccluster
{
    "CacheCluster": {
        "CacheClusterId": "deletemeeccluster",
        "ConfigurationEndpoint": {
            "Address": "deletemeeccluster.llgnjm.cfg.use2.cache.amazonaws.com",
            "Port": 11211
        },
        "ClientDownloadLandingPage": "https://console.aws.amazon.com/elasticache/home#client-download:",
        "CacheNodeType": "cache.t4g.small",
        "Engine": "memcached",
        "EngineVersion": "1.6.17",
        "CacheClusterStatus": "deleting",
        "NumCacheNodes": 1,
        "PreferredAvailabilityZone": "us-east-2a",
        "CacheClusterCreateTime": "2023-05-19T23:24:12.290Z",
        "PreferredMaintenanceWindow": "tue:02:00-tue:03:00",
        "PendingModifiedValues": {},
        "CacheSecurityGroups": [],
        "CacheParameterGroup": {
            "CacheParameterGroupName": "default.memcached1.6",
            "ParameterApplyStatus": "in-sync",
            "CacheNodeIdsToReboot": []
        },
        "CacheSubnetGroupName": "elasticachesn",
        "AutoMinorVersionUpgrade": true,
        "SecurityGroups": [
            {
                "SecurityGroupId": "sg-0be6e9c99a699a588",
                "Status": "active"
            }
        ],
        "TransitEncryptionEnabled": false,
        "AtRestEncryptionEnabled": false,
        "ARN": "arn:aws:elasticache:us-east-2:146868985163:cluster:deletemeeccluster",
        "ReplicationGroupLogDeliveryEnabled": false,
        "LogDeliveryConfigurations": [],
        "NetworkType": "ipv4",
        "IpDiscovery": "ipv4"
    }
}
```
