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

In Kubernetes, the concept of volumes is used to manage filesystems available to containers. Volumes provide an abstraction for data storage that containers can use during their lifecycle. Here’s a breakdown of the different types, how they differ from Persistent Volumes (PVs) and Persistent Volume Claims (PVCs), and their specific use cases:

## Kubernetes Volumes:
### EmptyDir:
Created when a pod is assigned to a node and exists as long as the pod runs. It's temporary storage, useful for sharing data between containers in a pod.

### HostPath:
Mounts a file or directory from the host node’s filesystem to your pod. It's useful for applications requiring access to the host's data.

### NFS, Glusterfs, CIFS:
Mounts network filesystems such as NFS, GlusterFS, or CIFS. These allow multiple pods to access the same data across different nodes.

### ConfigMap and Secret:
Used for injecting configuration data and sensitive information (like passwords) into pods, respectively, as files or environment variables.

### DownwardAPI:
Allows pods to access metadata about themselves, from information such as their labels and annotations.

### PersistentVolumeClaim:
Represents a claim for a Persistent Volume. Although PVCs are typically discussed in the context of persistent storage, it can also be used within the pod's volumes section to declare usage of persistent storage.
Azure Disk, AWS EBS, GCE Persistent Disk:
These are cloud-specific volume types that allow pods to mount cloud provider disks.

### Projected Volumes:
Combine multiple volume sources (like ConfigMaps and Secrets) and inject them as a single volume into a pod.

### Ephemeral Volumes:
Volumes like emptyDir or local that do not persist data beyond the lifecycle of a pod.

## Differences from Persistent Volumes and Claims:
### Scope and Lifecycle:
Kubernetes Volumes: Typically scoped to the lifecycle of a pod. They might be ephemeral and are meant for short-term needs or data sharing between containers in a pod.
Persistent Volumes (PVs): Cluster-wide resources, independent of any specific pod's lifecycle, used for persistent data storage needs that retain data beyond a pod’s existence.

### Provisioning and Persistence:
Kubernetes Volumes: Often manually specified and ephemeral unless using network file systems or secrets/configurations that persist through abstraction.
PVs and PVCs: Involves potentially dynamic provisioning of storage resources, designed to persist beyond individual pod lifecycles to maintain data integrity.
Usage:

**Kubernetes Volumes:** Directly used within a pod's volume specification to mount filesystems.
**PVs and PVCs:** PVCs make requests for specific storage needs, which are then fulfilled by binding to PVs either manually or through Kubernetes dynamic provisioning.
In summary, Kubernetes volumes are more transient and pod-specific compared to PVs and PVCs, which are geared towards the persistent storage needs of applications running on the cluster.

When dealing with Kubernetes, both Persistent Volumes (PVs) and Persistent Volume Claims (PVCs) are central components used for managing storage resources. Here is the difference between them:

## Persistent Volume (PV):

A **Persistent Volume** is a piece of storage in the cluster that has been provisioned by an administrator or through dynamic provisioning.
It is a cluster-wide resource and is independent of the lifecycle of a pod.
PVs can be backed by a variety of storage types, such as local storage, NFS, or cloud storage solutions like AWS EBS, GCE Persistent Disk, and others.
It defines the details of the storage itself, including but not limited to its size, access modes (such as ReadWriteOnce, ReadOnlyMany, etc.), and storage class.
Persistent Volume Claim (PVC):

A **Persistent Volume Claim** is a request for storage by a user. It is similar to a pod in some ways as it consumes resources rather than providing them.
Users declare their storage requirements in a PVC, and Kubernetes then binds the claim to an available PV that matches the criteria specified in the claim (such as the requested size and access modes).
A PVC abstracts the underlying storage provisioned in a PV, providing a simpler interface for developers when deploying applications.
Workflow:

The typical workflow begins with creating a PVC where you specify the amount of storage required and any other access parameters.
Kubernetes, through the control plane, will search for a suitable PV that matches the claim's request.
Once a suitable PV is found, the PVC is bound to that PV, and the storage can be mounted to a pod for use.
Static vs. Dynamic Provisioning:

**Static Provisioning:** A cluster administrator manually creates PVs which are matched with PVCs.
**Dynamic Provisioning:** Kubernetes automatically provisions a PV when a PVC is created, based on the specified storage class.
Overall, PVs are the actual storage volumes, whereas PVCs act as an abstraction layer for requesting, claiming, and using that storage in a more user-friendly manner within Kubernetes environments.

| Volume Type       | Purpose / Use Case                                     | ReadWriteMany (RWX) | Scope        | Managed by Cloud | Persistent |
|-------------------|--------------------------------------------------------|----------------------|---------------|------------------|------------|
| `hostPath`        | Testing, single-node volumes, development              | ❌                   | Node-local    | ❌                | ✅         |
| `emptyDir`        | Scratch space, temporary data for a pod                | ❌                   | Pod-local     | ❌                | ❌         |
| `nfs`             | Shared network storage via NFS                         | ✅                   | Cluster-wide  | ❌                | ✅         |
| `awsElasticBlockStore` | Block storage for a pod on AWS                     | ❌ (RWO only)        | Node-specific | ✅ (AWS)          | ✅         |
| `gcePersistentDisk`   | Persistent disk for GKE                            | ❌ (RWO only)        | Node-specific | ✅ (GCP)          | ✅         |
| `azureDisk`       | Persistent disk for Azure                              | ❌ (RWO only)        | Node-specific | ✅ (Azure)        | ✅         |
| `awsEFS` (via CSI) | Shared file system on AWS (like NFS)                  | ✅                   | Cluster-wide  | ✅ (AWS)          | ✅         |
| `cephfs`          | Distributed file system with high availability         | ✅                   | Cluster-wide  | ❌ / Optional     | ✅         |
| `glusterfs`       | Distributed storage with replication                   | ✅                   | Cluster-wide  | ❌ / Optional     | ✅         |
| `local`           | High-performance, node-pinned persistent volumes       | ❌                   | Node-local    | ❌                | ✅         |
| `configMap`       | Injecting configuration data into pods                 | ❌                   | Pod-local     | N/A               | ❌         |
| `secret`          | Storing sensitive data like passwords, keys, tokens    | ❌                   | Pod-local     | N/A               | ❌         |
| `persistentVolumeClaim` | Abstraction layer for using PersistentVolumes    | Depends on PV        | Depends       | Depends           | ✅         |

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

