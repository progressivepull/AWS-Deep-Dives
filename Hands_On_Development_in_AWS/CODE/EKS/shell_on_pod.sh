#!/bin/sh
echo -n "Pod name?: "
read pod

echo ">>>>>   kubectl exec -it $pod -n eks-sample-app -- /bin/bash"
kubectl exec -it $pod -n eks-sample-app -- /bin/bash
echo

