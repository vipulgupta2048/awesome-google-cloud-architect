
## Setup & Authentication Flow

### 1. Initial Setup

```bash
# Activate Cloud Shell (already has gcloud, kubectl, docker pre-installed)
# Set project context automatically or use:
gcloud config set project [PROJECT_ID]
```

### 2. Create GKE Autopilot Cluster

```bash
gcloud container clusters create-auto [CLUSTER_NAME] --region=[REGION]
```

**What it does:** Creates a new GKE Autopilot cluster with default settings. Autopilot mode provides a managed Kubernetes experience with automatic node provisioning, scaling, and security hardening.

### 3. Get Cluster Credentials

```bash
gcloud container clusters get-credentials [CLUSTER_NAME] --region=[REGION]
```

**What it does:**

- Authenticates to the cluster using OAuth2 tokens
- Populates the `~/.kube/config` file with cluster authentication and configuration
- Sets the current context to the specified cluster
- Required to connect kubectl to the cluster

## Cluster Management & Inspection

### 4. Verify Cluster Connection

```bash
kubectl config current-context
```

**What it does:** Shows which cluster kubectl is currently connected to

### 5. View Cluster Information

```bash
kubectl cluster-info
```

**What it does:** Displays cluster endpoint URLs and basic cluster information

### 6. List All Clusters

```bash
gcloud container clusters list
```

**What it does:** Shows all GKE clusters in the project with their status, location, and version

### 7. Get Cluster Details

```bash
kubectl config view
```

**What it does:** Shows the complete kubeconfig file contents (certificates are masked as DATA+OMITTED)

## Pod Deployment & Management

### 8. Deploy Pod from Command Line

```bash
kubectl create deployment [POD_NAME] --image=[IMAGE_NAME]
# Example: kubectl create deployment nginx --image=nginx
```

**What it does:** Creates a new pod running the specified container image

### 9. Deploy Pod from YAML File

```bash
kubectl apply -f [YAML_FILE]
# Example: kubectl apply -f new-nginx-pod.yaml
```

**What it does:** Creates resources defined in the YAML manifest file (preferred method for complex configurations)

### 10. List Pods

```bash
kubectl get pods
```

**What it does:** Shows all pods in the current namespace with their status

### 11. Get Detailed Pod Information

```bash
kubectl describe pod [POD_NAME]
```

**What it does:** Shows comprehensive pod details including events, conditions, and configuration

### 12. View Pod Logs

```bash
kubectl logs [POD_NAME]
```

**What it does:** Displays the container logs from the specified pod

### 13. Monitor Pod Resource Usage

```bash
kubectl top pods
```

**What it does:** Shows CPU and memory usage for all pods (requires metrics server)

## Service Exposure & Networking

### 14. Expose Pod as LoadBalancer Service

```bash
kubectl expose pod [POD_NAME] --port=80 --type=LoadBalancer
```

**What it does:** Creates a LoadBalancer service to expose the pod to external internet traffic

### 15. List Services

```bash
kubectl get services
```

**What it does:** Shows all services with their cluster IP, external IP, and ports

### 16. Port Forward to Pod

```bash
kubectl port-forward [POD_NAME] [LOCAL_PORT]:[POD_PORT]
# Example: kubectl port-forward nginx-pod 8080:80
```

**What it does:** Creates a direct tunnel from your local machine to the pod (useful for testing)

## Interactive Pod Access

### 17. Execute Commands in Pod

```bash
kubectl exec [POD_NAME] -- [COMMAND]
# Example: kubectl exec nginx-pod -- ls /usr/share/nginx/html
```

**What it does:** Runs a single command inside the pod's container

### 18. Interactive Shell Access

```bash
kubectl exec -it [POD_NAME] -- /bin/bash
```

**What it does:** Opens an interactive shell session inside the pod's container

### 19. Copy Files to/from Pod

```bash
kubectl cp [LOCAL_FILE] [POD_NAME]:[CONTAINER_PATH]
# Example: kubectl cp test.html nginx-pod:/usr/share/nginx/html/
```

**What it does:** Copies files between your local machine and the pod's filesystem

## Cleanup Commands

### 20. Delete Pod

```bash
kubectl delete pod [POD_NAME]
```

**What it does:** Removes the specified pod from the cluster

### 21. Delete Service

```bash
kubectl delete service [SERVICE_NAME]
```

**What it does:** Removes the specified service

### 22. Delete Cluster

```bash
gcloud container clusters delete [CLUSTER_NAME] --region=[REGION]
```

**What it does:** Completely removes the GKE cluster and all its resources

## Complete Deployment Flow

1. **Setup**: Ensure Cloud Shell/gcloud is configured
2. **Create**: `gcloud container clusters create-auto` → Deploy cluster
3. **Connect**: `gcloud container clusters get-credentials` → Authenticate kubectl
4. **Deploy**: `kubectl apply -f` or `kubectl create deployment` → Deploy applications
5. **Expose**: `kubectl expose` → Make services accessible
6. **Monitor**: `kubectl get pods/services` → Check status
7. **Debug**: `kubectl describe/logs/exec` → Troubleshoot issues
8. **Scale/Update**: Modify deployments as needed
9. **Cleanup**: `kubectl delete` and `gcloud container clusters delete` → Remove resources

## Key Differences: Autopilot vs Standard GKE

- **Autopilot**: Google manages nodes, networking, and security automatically
- **Standard**: You manage node pools, scaling, and maintenance manually
- **Autopilot**: Pay per pod resource requests only
- **Standard**: Pay for provisioned node capacity