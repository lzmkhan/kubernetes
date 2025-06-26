# k8s Network policies
## Service types:
1. ClusterIP Service
2. NodePort Service
3. LoadBalancer Service
4. ExternalName
Service type define how and where service will expose the application.
Default service type is ClusterIP

## ClusterIP Service:
Exposes application within the Cluster Network.
Service to service communications. Pod to pod communication(ie pods residing in different nodes)
Enabled by default in single namespace. For different namespace we can use ClusterIP Service
Pod in namespace A communicate with Pod in namespace B.
Client is a pod.
Ex: backend pod is a client to use mongo db service.

## NodePort Service:
Exposes application outside the cluster network.
Used to serve application outside of network like Web application.

## Loadbalancer Service:
Exposes application to outer world. Uses Cloud service's Load balancers.
Ex: ALB from AWS may connect to loadbalancer service to send request to cluster.

## ExternalName Service:
Uses Loadbalancer Service with CNAME that is your website url.
