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
**Lab:**https://github.com/lzmkhan/kubernetes/blob/main/sessions/session5/code/clusterip-service.yaml
## NodePort Service:
Exposes application outside the cluster network.
Used to serve application outside of network like Web application.
**Lab:**https://github.com/lzmkhan/kubernetes/blob/main/sessions/session5/code/nodeport-service.yaml
## Loadbalancer Service:
Exposes application to outer world. Uses Cloud service's Load balancers.
Ex: ALB from AWS may connect to loadbalancer service to send request to cluster.

## ExternalName Service:
Uses Loadbalancer Service with CNAME that is your website url.

## kubectl port-forward:
Purpose:
Used to forward one or more local ports to ports on a pod, enabling access to applications running inside the pod.
Usage:
Useful for testing and debugging purposes, especially for accessing applications without exposing them via external IPs or services.
Example Command:
 `kubectl port-forward <pod-name> <local-port>:<pod-port>`
  
<pod-name>: The name of the pod you want to forward to.
<local-port>: The port on your local machine you want to use to access the application.
<pod-port>: The port inside the pod that your application is listening on.

Considerations:
The command runs in the foreground, and terminating it stops the port forwarding.
Useful for accessing applications directly from your local machine without additional network configurations.
Requires connectivity to the Kubernetes API server.
In summary, kubectl exec is about interacting with the running processes inside the container, whereas kubectl port-forward bridges your local machine with the application running inside a pod, allowing HTTP/S or TCP traffic to reach the pod from your local workstation. 
Both commands are vital tools for development, debugging, and management of applications in a Kubernetes environment.
