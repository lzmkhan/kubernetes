# Common Kubectl commands

Create a deployment:

`kubectl create deployment <deployment_name> --image=nginx`

Edit a deployment

`kubectl edit deployment <deployment_name>`

Delete a deployment

`kubectl delete deployment <deployment_name>`

Status of objects:

`kubectl get `[nodes|pod|services|`replicaset|deployment|all]`

Debugging of pods:

`kubectl logs <pod_name>`

Get interactive terminal of pod

`kubectl exec -it [pod_name] --bin/bash`

To stop just the application service
`kubectl scale --replicas=0 deployment/<your-deployment>`


Reference link for all available attributes for deployment:

[Deployment | Kubernetes](https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/deployment-v1/)


Lab:

Create Kubernetes manifest for sample application.
