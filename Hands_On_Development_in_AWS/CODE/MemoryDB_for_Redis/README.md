# MemoryDB for Redis

## CLI Interaction

### List Clusters
```
$ aws memorydb describe-clusters
{
    "Clusters": [
        {
            "Name": "deleteme",
            "Description": "Easy created demo cluster on 2023-05-20T00:53:49.853Z",
            "Status": "available",
            "NumberOfShards": 1,
            "ClusterEndpoint": {
                "Address": "clustercfg.deleteme.llgnjm.memorydb.us-east-2.amazonaws.com",
                "Port": 6379
            },
            "NodeType": "db.t4g.small",
            "EngineVersion": "7.0",
            "EnginePatchVersion": "7.0.7",
            "ParameterGroupName": "default.memorydb-redis7",
            "ParameterGroupStatus": "in-sync",
            "SecurityGroups": [
                {
                    "SecurityGroupId": "sg-080fdd5c7dd7b40d4",
                    "Status": "active"
                }
            ],
            "SubnetGroupName": "memorydbsng",
            "TLSEnabled": true,
            "ARN": "arn:aws:memorydb:us-east-2:146868985163:cluster/deleteme",
            "SnapshotRetentionLimit": 1,
            "MaintenanceWindow": "sat:04:30-sat:05:30",
            "SnapshotWindow": "23:00-00:00",
            "ACLName": "newacl",
            "AutoMinorVersionUpgrade": true,
            "DataTiering": "false"
        }
    ]
}
```


### Delete Cluster
```
$ aws memorydb delete-cluster --cluster-name deleteme
{
    "Cluster": {
        "Name": "deleteme",
        "Description": "Easy created demo cluster on 2023-05-20T00:53:49.853Z",
        "Status": "deleting",
        "NumberOfShards": 1,
        "ClusterEndpoint": {
            "Address": "clustercfg.deleteme.llgnjm.memorydb.us-east-2.amazonaws.com",
            "Port": 6379
        },
        "NodeType": "db.t4g.small",
        "EngineVersion": "7.0",
        "EnginePatchVersion": "7.0.7",
        "ParameterGroupName": "default.memorydb-redis7",
        "ParameterGroupStatus": "in-sync",
        "SecurityGroups": [
            {
                "SecurityGroupId": "sg-080fdd5c7dd7b40d4",
                "Status": "active"
            }
        ],
        "SubnetGroupName": "memorydbsng",
        "TLSEnabled": true,
        "ARN": "arn:aws:memorydb:us-east-2:146868985163:cluster/deleteme",
        "SnapshotRetentionLimit": 1,
        "MaintenanceWindow": "sat:04:30-sat:05:30",
        "SnapshotWindow": "23:00-00:00",
        "AutoMinorVersionUpgrade": true,
        "DataTiering": "false"
    }
}
```
