# Volumes
Since containers have ephimeral storage i.e the data in writable layer only persists until
a container is deleted or recreated.
There are two types of volumes:
1. volume - simple storage, ex: local
2. persistent volume - abstract storage, can be anything the kubernetes does not care about underlying volume type.
In each volume, there are multiple volume types:
NFS - network file system
Cloud storage - aws,gcp, azure
ConfigMaps and Secrets
File system on K8s Node

Volume:
described in pod spec =>creates volume
Volume Mount:
described in container spec => mounts the above created volume in container

emptyDir Volume:
exists only during pod lifecycle. used to share data between multiple containers running inside same pod.
## Lab:
Open session 3 sample app and create mongo deployment with persistent volume and claim


# NameSpaces:
Are virtual cluster backed by the same physical cluster.
K8s objects such as pods, containers, services etc live in Namespace.
We can create multiple namespaces inside a single cluster
Namespaces are ways to **seperate** and **organise** objects in Kubernetes
All clusters have **default** namespaces

# Lab:
To list existing namespaces:
`kubectl get namespaces`

To fetch objects from a specific namespace:
`kubectl get pods --namespace <namespace>`
`kubectl get services --namespace <namespace>`

To create a new namespace:
`kubectl create namespace <namespace>`

To get cluster information:
`kubectl config view`

# Management tools

## Kubectl
It allows us to communicate with kubernetes cluster

## Kubeadm
It is a cluster setup tool, It is used to create kubernetes cluster.

## Helm
Tool for kubernetes template and package management.
Allows us to convert k8s objects in to reusable templates. Provides complex multi config templates with
cross connectivity.

## Kompose
Similar to docker compose but for kubernetes objects.
Translates docker compose files in to k8s objects. provides way to ship containers from compose to K8s.
Navigate to directory with docker-compose.yaml
Install kompose:
`curl -L https://github.com/kubernetes/kompose/releases/download/v1.34.0/kompose-linux-amd64 -o kompose`
```
chmod +x kompose
sudo mv ./kompose /usr/local/bin/kompose
```
`kompose convert`


## Kustomise
Configuration management tool for k8s objects configuration. similar to helm.

