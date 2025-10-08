# EKS

## Install kubectl
```
[nick@nuc EKS]$ sh install_kubectl_nix.sh
>>>>>   It depends on your OS/arch.  Visit the following URL and install >=1.27
https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html

>>>>>   Attempting install...

>>>>>   curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.27.1/2023-04-19/bin/linux/amd64/kubectl
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 46.9M  100 46.9M    0     0  7601k      0  0:00:06  0:00:06 --:--:-- 8909k

>>>>>   chmod +x kubectl

>>>>>   mkdir -p /home/nick/bin && mv ./kubectl /home/nick/bin/kubectl && export PATH=/home/nick/bin:/home/nick/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/var/lib/flatpak/exports/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/local/bin:/home/nick/bb/my_linux/bin:/home/nick/bin:/opt/code/bin:/home/nick/.local/bin:/home/nick/.dotnet

>>>>>   Adding to .bashrc
```

## Install eksctl
```
[nick@nuc EKS]$ sh install_eksctl_nix.sh
>>>>>   It depends on your OS/arch.  Visit the following URL for info
https://github.com/weaveworks/eksctl/blob/main/README.md#installation

>>>>>   Attempting install...

>>>>>   curl -sLO 'https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_Linux_amd64.tar.gz'

>>>>>   tar -xzf eksctl_Linux_amd64.tar.gz -C /tmp && rm eksctl_Linux_amd64.tar.gz

>>>>>   sudo mv /tmp/eksctl /usr/local/bin
[sudo] password for nick:
```

## Deploy EKS Cluster using eksctl
Note the time it takes for this to finish.  

```
[nick@nuc EKS]$ sh 1_create_cluster_eksctl.sh
!!! NOTE !!!
This creates a large amount of resources in your account, some are not free.
Press Ctrl-C to kill or enter to continue.

>>>>>   Enter the name of the cluster you want to create:
DeleteMeEKSCluster2
>>>>>   Creating managed nodes cluster in us-east-2
>>>>>   eksctl create cluster --name DeleteMeEKSCluster2 --region us-east-2
2023-06-09 14:31:33 [ℹ]  eksctl version 0.144.0
2023-06-09 14:31:33 [ℹ]  using region us-east-2
2023-06-09 14:31:34 [ℹ]  setting availability zones to [us-east-2b us-east-2a us-east-2c]
2023-06-09 14:31:34 [ℹ]  subnets for us-east-2b - public:192.168.0.0/19 private:192.168.96.0/19
2023-06-09 14:31:34 [ℹ]  subnets for us-east-2a - public:192.168.32.0/19 private:192.168.128.0/19
2023-06-09 14:31:34 [ℹ]  subnets for us-east-2c - public:192.168.64.0/19 private:192.168.160.0/19
2023-06-09 14:31:34 [ℹ]  nodegroup "ng-42e7aa11" will use "" [AmazonLinux2/1.25]
2023-06-09 14:31:34 [ℹ]  using Kubernetes version 1.25
2023-06-09 14:31:34 [ℹ]  creating EKS cluster "DeleteMeEKSCluster2" in "us-east-2" region with managed nodes
2023-06-09 14:31:34 [ℹ]  will create 2 separate CloudFormation stacks for cluster itself and the initial managed nodegroup
2023-06-09 14:31:34 [ℹ]  if you encounter any issues, check CloudFormation console or try 'eksctl utils describe-stacks --region=us-east-2 --cluster=DeleteMeEKSCluster2'
2023-06-09 14:31:34 [ℹ]  Kubernetes API endpoint access will use default of {publicAccess=true, privateAccess=false} for cluster "DeleteMeEKSCluster2" in "us-east-2"
2023-06-09 14:31:34 [ℹ]  CloudWatch logging will not be enabled for cluster "DeleteMeEKSCluster2" in "us-east-2"
2023-06-09 14:31:34 [ℹ]  you can enable it with 'eksctl utils update-cluster-logging --enable-types={SPECIFY-YOUR-LOG-TYPES-HERE (e.g. all)} --region=us-east-2 --cluster=DeleteMeEKSCluster2'
2023-06-09 14:31:34 [ℹ]
2 sequential tasks: { create cluster control plane "DeleteMeEKSCluster2",
    2 sequential sub-tasks: {
        wait for control plane to become ready,
        create managed nodegroup "ng-42e7aa11",
    }
}
2023-06-09 14:31:34 [ℹ]  building cluster stack "eksctl-DeleteMeEKSCluster2-cluster"
2023-06-09 14:31:35 [ℹ]  deploying stack "eksctl-DeleteMeEKSCluster2-cluster"
2023-06-09 14:32:05 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster2-cluster"
2023-06-09 14:32:35 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster2-cluster"
2023-06-09 14:33:36 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster2-cluster"
2023-06-09 14:34:36 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster2-cluster"
2023-06-09 14:35:37 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster2-cluster"
2023-06-09 14:36:37 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster2-cluster"
2023-06-09 14:37:38 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster2-cluster"
2023-06-09 14:38:39 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster2-cluster"
2023-06-09 14:39:40 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster2-cluster"
2023-06-09 14:41:43 [ℹ]  building managed nodegroup stack "eksctl-DeleteMeEKSCluster2-nodegroup-ng-42e7aa11"
2023-06-09 14:41:44 [ℹ]  deploying stack "eksctl-DeleteMeEKSCluster2-nodegroup-ng-42e7aa11"
2023-06-09 14:41:44 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster2-nodegroup-ng-42e7aa11"
2023-06-09 14:42:15 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster2-nodegroup-ng-42e7aa11"
2023-06-09 14:43:09 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster2-nodegroup-ng-42e7aa11"
2023-06-09 14:44:17 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster2-nodegroup-ng-42e7aa11"
2023-06-09 14:44:17 [ℹ]  waiting for the control plane to become ready
2023-06-09 14:44:17 [✔]  saved kubeconfig as "/home/nick/.kube/config"
2023-06-09 14:44:17 [ℹ]  no tasks
2023-06-09 14:44:17 [✔]  all EKS cluster resources for "DeleteMeEKSCluster2" have been created
2023-06-09 14:44:18 [ℹ]  nodegroup "ng-42e7aa11" has 2 node(s)
2023-06-09 14:44:18 [ℹ]  node "ip-192-168-48-104.us-east-2.compute.internal" is ready
2023-06-09 14:44:18 [ℹ]  node "ip-192-168-66-208.us-east-2.compute.internal" is ready
2023-06-09 14:44:18 [ℹ]  waiting for at least 2 node(s) to become ready in "ng-42e7aa11"
2023-06-09 14:44:18 [ℹ]  nodegroup "ng-42e7aa11" has 2 node(s)
2023-06-09 14:44:18 [ℹ]  node "ip-192-168-48-104.us-east-2.compute.internal" is ready
2023-06-09 14:44:18 [ℹ]  node "ip-192-168-66-208.us-east-2.compute.internal" is ready
2023-06-09 14:44:19 [ℹ]  kubectl command should work with "/home/nick/.kube/config", try 'kubectl get nodes'
2023-06-09 14:44:19 [✔]  EKS cluster "DeleteMeEKSCluster2" in "us-east-2" region is ready
```

## Configure kubectl using AWS CLI
```
[nick@nuc EKS]$ sh 2_configure_kubectl.sh
>>>>>   Listing Clusters
>>>>>   aws eks list-clusters
{
    "clusters": [
        "DeleteMeEKSCluster2"
    ]
}

>>>>>   Enter cluster name:
DeleteMeEKSCluster2

>>>>> aws eks update-kubeconifg --name DeleteMeEKSCluster2
Added new context arn:aws:eks:us-east-2:146868985163:cluster/DeleteMeEKSCluster2 to /home/nick/.kube/config

>>>>> Verify
>>>>> kubectl get pods --all-namespaces
NAMESPACE     NAME                      READY   STATUS    RESTARTS   AGE
kube-system   aws-node-2qns6            1/1     Running   0          78m
kube-system   aws-node-kzvwf            1/1     Running   0          78m
kube-system   coredns-8fd4db68f-2cfjh   1/1     Running   0          83m
kube-system   coredns-8fd4db68f-zccs4   1/1     Running   0          83m
kube-system   kube-proxy-7ph4x          1/1     Running   0          78m
kube-system   kube-proxy-rrktm          1/1     Running   0          78m
```

## Deploy sample application and service
```
[nick@nuc EKS]$ sh 3_push_deployment.sh
>>>>>   Creating namespace
>>>>>     kubectl create namespace eks-sample-app
namespace/eks-sample-app created

>>>>>   Deploy eks-sample-deployment.yaml
>>>>>     kubectl apply -f eks-sample-deployment.yaml
deployment.apps/eks-sample-linux-deployment created

[nick@nuc EKS]$ sh 4_push_service.sh
>>>>>   Deploy eks-sample-service.yaml
>>>>>     kubectl apply -f eks-sample-service.yaml
service/eks-sample-linux-service created
```

## Verify
```
[nick@nuc EKS]$ sh 5_verify.sh
>>>>> kubectl get all -n eks-sample-app
NAME                                               READY   STATUS    RESTARTS   AGE
pod/eks-sample-linux-deployment-7f646d456c-9mj2b   1/1     Running   0          27s
pod/eks-sample-linux-deployment-7f646d456c-ftbll   1/1     Running   0          27s
pod/eks-sample-linux-deployment-7f646d456c-hp7vj   1/1     Running   0          27s

NAME                               TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE
service/eks-sample-linux-service   ClusterIP   10.100.117.168   <none>        80/TCP    21s

NAME                                          READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/eks-sample-linux-deployment   3/3     3            3           28s

NAME                                                     DESIRED   CURRENT   READY   AGE
replicaset.apps/eks-sample-linux-deployment-7f646d456c   3         3         3       28s

>>>>> kubectl -n eks-sample-app describe service eks-sample-linux-service
Name:              eks-sample-linux-service
Namespace:         eks-sample-app
Labels:            app=eks-sample-linux-app
Annotations:       <none>
Selector:          app=eks-sample-linux-app
Type:              ClusterIP
IP Family Policy:  SingleStack
IP Families:       IPv4
IP:                10.100.117.168
IPs:               10.100.117.168
Port:              <unset>  80/TCP
TargetPort:        80/TCP
Endpoints:         192.168.34.124:80,192.168.59.140:80,192.168.85.15:80
Session Affinity:  None
Events:            <none>

>>>>> Run the following, replace 65betcetc
kubectl -n eks-sample-app describe pod eks-sample-linux-deployment-65b7669776-m6qxz

[nick@nuc EKS]$ kubectl -n eks-sample-app describe pod eks-sample-linux-deployment-7f646d456c-9mj2b
Name:             eks-sample-linux-deployment-7f646d456c-9mj2b
Namespace:        eks-sample-app
Priority:         0
Service Account:  default
Node:             ip-192-168-66-208.us-east-2.compute.internal/192.168.66.208
Start Time:       Fri, 09 Jun 2023 16:03:42 -0700
Labels:           app=eks-sample-linux-app
                  pod-template-hash=7f646d456c
Annotations:      <none>
Status:           Running
IP:               192.168.85.15
IPs:
  IP:           192.168.85.15
Controlled By:  ReplicaSet/eks-sample-linux-deployment-7f646d456c
Containers:
  nginx:
    Container ID:   containerd://0079843912a166ef86bafd075f364fe18b74615f71118d2c6e8bd75ebe0a6a2f
    Image:          public.ecr.aws/nginx/nginx:1.21
    Image ID:       public.ecr.aws/nginx/nginx@sha256:3aac7c736093ce043a17d6e83ef5addb8be321b5b6b93879141e51474448ca65
    Port:           80/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Fri, 09 Jun 2023 16:03:45 -0700
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-zpmxr (ro)
Conditions:
  Type              Status
  Initialized       True
  Ready             True
  ContainersReady   True
  PodScheduled      True
Volumes:
  kube-api-access-zpmxr:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              kubernetes.io/os=linux
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age        From               Message
  ----    ------     ----       ----               -------
  Normal  Scheduled  <invalid>  default-scheduler  Successfully assigned eks-sample-app/eks-sample-linux-deployment-7f646d456c-9mj2b to ip-192-168-66-208.us-east-2.compute.internal
  Normal  Pulling    <invalid>  kubelet            Pulling image "public.ecr.aws/nginx/nginx:1.21"
  Normal  Pulled     <invalid>  kubelet            Successfully pulled image "public.ecr.aws/nginx/nginx:1.21" in 2.541252589s (2.541272193s including waiting)
  Normal  Created    <invalid>  kubelet            Created container nginx
  Normal  Started    <invalid>  kubelet            Started container nginx
```

## Verify via shell
```
[nick@nuc EKS]$ sh 6_shell.sh
>>>>> kubectl get pods -n eks-sample-app
NAME                                           READY   STATUS    RESTARTS   AGE
eks-sample-linux-deployment-7f646d456c-9mj2b   1/1     Running   0          105s
eks-sample-linux-deployment-7f646d456c-ftbll   1/1     Running   0          105s
eks-sample-linux-deployment-7f646d456c-hp7vj   1/1     Running   0          105s

>>>>>   Which pod?
eks-sample-linux-deployment-7f646d456c-9mj2b
>>>>>   Will now attempt to connect the shell on pod: eks-sample-linux-deployment-7f646d456c-9mj2b
>>>>>     Once connected, run 'curl eks-sample-linux-service'
>>>>>     CoreDNS will resolve the service name
>>>>> kubectl exec -it eks-sample-linux-deployment-7f646d456c-9mj2b -n eks-sample-app -- /bin/bash
root@eks-sample-linux-deployment-7f646d456c-9mj2b:/# curl eks-sample-linux-service
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
root@eks-sample-linux-deployment-7f646d456c-9mj2b:/#
```

## Delete namespace
```
[nick@nuc EKS]$ sh 7_delete_namespace.sh
>>>>>   kubectl delete namespace eks-sample-app
namespace "eks-sample-app" deleted
```

## Delete cluster
```
p[nick@nuc EKS]$ sh 8_delete_cluster.sh 
>>>>>   eksctl get clusters
NAME			REGION		EKSCTL CREATED
DeleteMeEKSCluster2	us-east-2	True

>>>>> Delete which cluster?
DeleteMeEKSCluster2

>>>>>   eksctl delete cluster --name DeleteMeEKSCluster2
2023-06-09 16:05:27 [ℹ]  deleting EKS cluster "DeleteMeEKSCluster2"
2023-06-09 16:05:28 [ℹ]  will drain 0 unmanaged nodegroup(s) in cluster "DeleteMeEKSCluster2"
2023-06-09 16:05:28 [ℹ]  starting parallel draining, max in-flight of 1
2023-06-09 16:05:28 [ℹ]  deleted 0 Fargate profile(s)
2023-06-09 16:05:29 [✔]  kubeconfig has been updated
2023-06-09 16:05:29 [ℹ]  cleaning up AWS load balancers created by Kubernetes objects of Kind Service or Ingress
2023-06-09 16:05:31 [ℹ]  
2 sequential tasks: { delete nodegroup "ng-42e7aa11", delete cluster control plane "DeleteMeEKSCluster2" [async] 
}
2023-06-09 16:05:31 [ℹ]  will delete stack "eksctl-DeleteMeEKSCluster2-nodegroup-ng-42e7aa11"
2023-06-09 16:05:31 [ℹ]  waiting for stack "eksctl-DeleteMeEKSCluster2-nodegroup-ng-42e7aa11" to get deleted
2023-06-09 16:05:31 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster2-nodegroup-ng-42e7aa11"
2023-06-09 16:06:02 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster2-nodegroup-ng-42e7aa11"
2023-06-09 16:06:33 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster2-nodegroup-ng-42e7aa11"
2023-06-09 16:08:27 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster2-nodegroup-ng-42e7aa11"
2023-06-09 16:10:19 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster2-nodegroup-ng-42e7aa11"
2023-06-09 16:12:00 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster2-nodegroup-ng-42e7aa11"
2023-06-09 16:12:33 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster2-nodegroup-ng-42e7aa11"
2023-06-09 16:14:02 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster2-nodegroup-ng-42e7aa11"
2023-06-09 16:15:20 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster2-nodegroup-ng-42e7aa11"
2023-06-09 16:15:53 [ℹ]  waiting for CloudFormation stack "eksctl-DeleteMeEKSCluster2-nodegroup-ng-42e7aa11"
2023-06-09 16:15:53 [ℹ]  will delete stack "eksctl-DeleteMeEKSCluster2-cluster"
2023-06-09 16:15:53 [✔]  all cluster resources were deleted

>>>>>   Please check the CloudFormation console -> stack -> resources to ensure everything was deleted.

```

