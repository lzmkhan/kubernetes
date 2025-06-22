# Minikube
For local deployment. runs both master and worker nodes.
we are testing in local instead of deploying it in cloud, VMs etc.
Reference:
https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download

to install Minikube on linux:
```
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
```

To install kubectl:
`sudo snap install kubectl --classic`

## Lets look at our configuration files and go through each section
> code/webapp.yaml
> code/mongo.yaml
> code/mongo-config.yaml
> code/mongo-secrets.yaml

# Lab:  

Make docker run in usergroup

```
dockerd-rootless-setuptool.sh install -f
docker context use rootless
```

Lets start a Minikube cluster
`minikube start --driver=docker `

To delete a cluster
`minikube delete`

To stop just the application service
`kubectl scale --replicas=0 deployment/<your-deployment>`

To see if any pods are available
`kubectl get pods`

To see all resources in cluster
`kubectl get all`

Since we have nothing in our cluster, lets create the resources.
`kubectl apply -f mongo-secret.yaml`
`kubectl apply -f mongo.yaml`
`kubectl apply -f mongo-config.yaml`
`kubectl apply -f webapp.yaml`

once done, lets see what is created in the cluster.
`kubectl get all`

Use the below command to view resource information
`kubectl describe <pod/service/configmap/etc name>`  

Once everything is in ready state.
We need to validate whether our application is running and 
accessible.
for that first we need to get the IP of the cluster.
since we are using minikube 
we can use 
`minikube service webapp-service`

Next session:
Create our own images and write the kubernetes from scratch
also look at some commands in kubectl