🔧 1. Core Kubernetes Resources
🧱 Pods

    Smallest deployable unit.

    Used for running containers.

📦 Deployments

    Automates pod management, scaling, and rolling updates.

    Most common method for running applications.

📘 ReplicaSets

    Ensures a specified number of pod replicas are running.

    Used internally by Deployments.

🌐 Services

    Exposes a set of pods as a network service.

    Types: ClusterIP, NodePort, LoadBalancer.

🔁 StatefulSets

    Used for stateful applications (e.g., databases).

    Maintains pod identity across rescheduling.

📦 2. Storage and Configuration
📁 PersistentVolumes (PVs) & PersistentVolumeClaims (PVCs)

    Provide persistent storage for stateful workloads.

⚙️ ConfigMaps

    Store non-sensitive configuration as key-value pairs.

🔐 Secrets

    Store sensitive data like passwords or API keys.

🔄 3. Networking & Routing
📡 Ingress

    HTTP routing into the cluster.

    Allows host/path-based routing and TLS termination.

🔗 Network Policies

    Control traffic between pods.

    Useful for security and isolation.

🚀 4. Application Lifecycle & Management
📤 Helm

    Kubernetes package manager.

    Used to deploy and manage complex applications with charts.

🔁 Rolling Updates / Rollbacks

    Handled via Deployments to ensure zero-downtime updates.

📋 Jobs / CronJobs

    Run one-off tasks or recurring jobs.

🔍 5. Monitoring, Logging & Debugging
📊 Metrics Server / Prometheus / Grafana

    Monitor cluster and application metrics.

📄 Logs (kubectl logs)

    View container logs.

🧪 kubectl exec / port-forward

    Debug containers or forward ports for local testing.

🧠 6. Security & Access Control
👤 RBAC (Role-Based Access Control)

    Define who can do what on the cluster.

🛡️ Pod Security Standards (PSS)

    Enforce best practices like running as non-root.

🏗️ 7. Infrastructure Management
⚙️ Namespaces

    Logical partitions of the cluster to isolate environments (dev, staging, prod).

📋 Resource Requests & Limits

    Define CPU/memory allocation for containers.

🏷️ Labels & Selectors

    Used for grouping, querying, and managing Kubernetes objects.

🧰 8. CI/CD Integration

    Kubernetes is commonly integrated into CI/CD pipelines (e.g., GitHub Actions, GitLab CI, Jenkins).

    Helm + GitOps tools like ArgoCD or FluxCD are often used.


https://kubernetes.io/docs/tutorials/