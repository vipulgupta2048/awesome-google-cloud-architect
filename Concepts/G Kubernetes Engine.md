```table-of-contents
title: 
style: nestedList # TOC style (nestedList|nestedOrderedList|inlineFirstLevel)
minLevel: 0 # Include headings from the specified level
maxLevel: 0 # Include headings up to the specified level
include: 
exclude: 
includeLinks: true # Make headings clickable
hideWhenEmpty: false # Hide TOC if no headings are found
debugInConsole: false # Print debug info in Obsidian console
```





![[gke.pdf]]


## Kubernetes
Kubernetes is an orchestration framework for software containers. Containers are a way to package and run code that's more efficient than virtual machines. Kubernetes provides the tools you need to run containerized applications in production and at scale.

![[Screenshot 2025-07-23 at 2.03.54 AM.png]]


### Kubernetes Components

[Glossary](https://kubernetes.io/docs/reference/glossary/?all=true#term-control-plane)

> [!NOTE] The food chain
> Cluster > K8s Control Plane manages  > Physical Nodes(s) > Containing one or more Pods > Each pod running one or more Containers
> 
![[Screenshot 2025-07-28 at 12.04.50 AM.png]]


#### Cluster [](https://kubernetes.io/docs/reference/glossary/?all=true#term-cluster)

A set of worker machines, called [nodes](https://kubernetes.io/docs/concepts/architecture/nodes/), that run containerized applications. Every cluster has at least one worker node.

The worker node(s) host the [Pods](https://kubernetes.io/docs/concepts/workloads/pods/) that are the components of the application workload. The [control plane](https://kubernetes.io/docs/reference/glossary/?all=true#term-control-plane) manages the worker nodes and the Pods in the cluster. In production environments, the control plane usually runs across multiple computers and a cluster usually runs multiple nodes, providing fault-tolerance and high availability.

Create a K8s Cluster.
KubeCtl can't create a cluster in GCP

`gcloud container clusters create`




#### Control Plane[](https://kubernetes.io/docs/reference/glossary/?all=true#term-control-plane)

The container orchestration layer that exposes the API and interfaces to define, deploy, and manage the lifecycle of containers. This is one of the computer in the cluster that is running.

Control Plane Has 5 components, 
1. Kube-APIserver: We only interact with this directly. Accept commands that view or change the state of the cluster. We interact with it using Kubectl which connects to the server. Launches pods, kills nodes, scales things. All orchestration can only happen from here.
    
2. Etcd - Cluster Database. Stores all configuration data - what nodes, where pods running, what pods should be running. All of it is known by etcd. 
   
3. Kube-scheduler: Schedules pods onto nodes by choosing a node and writing the name of that node into the pod object. Can evaluate req. for each invidual pod and select a suitable one. Knows all states of nodes, Obey constraints we established. Doesn't actual launch the pods on nodes. Example: I want to run X on 3 gig nodes only, or affinity parameters like pods must run on the same node.
    
4. Kube-controller-manager: Continously monitors the state of the cluster. Handles remediation process to get back to the desired state by snitching to the Kube-APIserver.

5. Kube-cloud-manager: Interacts with underlying cloud providers

![[Screenshot 2025-07-28 at 12.17.56 AM.png]]

Control Plane interacts with 2 components on each node, 
1. Kublet: K8s agent for that node. When APIServer wants to do something on a node, Kubelets are tasked to start the pod, monitor lifecycle and report back. Kubelet uses container runtime like GKE uses containerd to lauch containers on pod.
   
2. Kube-proxy maintains network connectivity in the node inside a cluster. In OSS k8s deployment, this is done through iptables, firewall features

#### Node 

Kubernetes runs your [workload](https://kubernetes.io/docs/concepts/workloads/) by placing containers into Pods to run on _Nodes_. A node may be a virtual or physical machine, depending on the cluster. Each node is managed by the [control plane](https://kubernetes.io/docs/reference/glossary/?all=true#term-control-plane) and contains the services necessary to run [Pods](https://kubernetes.io/docs/concepts/workloads/pods/).

#### Pod

![[Screenshot 2025-07-28 at 12.08.19 AM.png]]

_Pods_ are the smallest deployable units of computing that you can create and manage in Kubernetes.

A _Pod_ (as in a pod of whales or pea pod) is a group of one or more [containers](https://kubernetes.io/docs/concepts/containers/), with shared storage and network resources, and a specification for how to run the containers.


### How K8s runs

1. Main option, Declarative Configuration: We supply the configuration, K8s tries to orchestrate that into reality. This the process of going from the current state to the desired state. 
   
![[Screenshot 2025-07-28 at 12.09.23 AM.png]]

2. Imperative Configuration: Quick Debugging 




## Google Kubernetes Service

Managed Kubernetes services, gives interactive control to the control plane. Sitting between the applications layer and your hardware infra. What can it do?

- Deploy and manage application 
- perform admin tasks
- set policies
- Monitor workload health
- And, all these advanced features

![[Screenshot 2025-07-23 at 12.23.24 PM.png]]

GKE is fully managed, which means the underlying resources don’t have to be provisioned, and a container-optimized operating system is used to run workloads.

Google maintains these operating systems, which are optimized to scale quickly with a minimal resource footprint. 

### How GKE is better
GKE is responsible for provisioning and managing all the control plane infrastructure behind it.
It also eliminates the need for a separate control plane.


### Zonal/Regional

Clusters can be created across a region or in a single zone. A single zone is the default. 

Example: X is the name of our autopilot GKE cluster deployed on a region. We want 3 replicas. When you apply this, the following happens:

1. The control plane now knows you want **three identical Nginx pods**.
    
2. To provide high availability, the Kubernetes scheduler, working with Autopilot, will automatically spread these pods across different failure domains (zones).
    
3. Autopilot provisions the necessary infrastructure. It will likely create **three separate nodes, one in each zone** (`us-central1-a`, `us-central1-b`, `us-central1-c`), and place one pod on each node

**Result:** You now have **three Nginx pods** running on **three nodes**, with each pod-node pair in a different zone. This setup is resilient to a single zone failure.



### Two Modes of GKE Operation

![[Screenshot 2025-07-28 at 12.31.49 AM.png]]
#### 1. Autopilot Mode - Recommended by Google

GKE Autopilot, which is designed to manage your cluster configuration, like nodes, scaling, security, and other preconfigured settings. Default mode is autopilot mode. Optimized for production, good security posture, and operational efficiency. 

You only pay for pods, not nodes.  

#### 2. Standard Mode
You manage the configuration, management and optimization

## K8s Operator 

A **Kubernetes Operator** - a program that automatically manages Kubernetes resources based on certain rules. Think of it as a "robot assistant" that watches for specific events and takes actions automatically.

It's an application specific controller that extends the k8s API to create, configure and manage instance of complex applications. 

An operator follows a closed loop pattern with 

```
1. OBSERVE: Watch for changes in Kubernetes resources
2. ANALYZE: Determine what should happen
3. ACT: Make necessary changes
4. REPEAT: Go back to step 1
```

They manage specific applications, often introducing Custom Resource Definitions (CRDs) to define and manage application-specific configurations and settings.
    
**Purpose:** Operators automate the operational knowledge of human operators for a particular application, handling tasks like backups, upgrades, disaster recovery, and scaling for complex software like databases or monitoring systems.

## Controllers

 Controllers are fundamental to Kubernetes and implement control loops that continuously monitor the cluster's state and work to bring it closer to the desired state.

They manage built-in Kubernetes resources like Deployments, ReplicaSets, Pods, and Services. Controllers handle general tasks such as ensuring the correct number of replicas for a stateless application, managing the lifecycle of pods, or ensuring stable network IDs for stateful applications (e.g., StatefulSets).

They are typically part of the core Kubernetes distribution. All of the controllers are managed by the Kubernetes Control Manager. 


> [!NOTE] Analogy
> Think of the Kubernetes Controller Manager as a manager in an office who oversees various departments (controllers).  
Each department (controller) has its specific job, such as handling customer service (Service Controller), managing the workforce (ReplicaSet Controller), or overseeing new projects (Deployment Controller).  
The manager (Controller Manager) doesn’t do these jobs directly but ensures that each department works effectively towards the company’s goals (desired state of the cluster).

## Operators vs Controllers 

Controllers manage general Kubernetes resources, while Operators manage specific, often complex, applications.

- **Level of Specialization:** Controllers are general-purpose, while Operators are highly specialized and application-specific.

- **Complexity of Tasks:** Controllers handle relatively simpler, built-in automation, while Operators automate complex, human-like operational tasks for specific applications.
    
- **Custom Resources:** Operators often introduce and manage Custom Resources through CRDs, while Controllers primarily work with built-in resources.
    
- **Origin:** Controllers are a core part of Kubernetes, while Operators are typically third-party extensions.

## Custom Resource Definition (CRD)

 It's a mechanism that allows users to extend the Kubernetes API by defining their own custom resource types. These custom resources behave like built-in Kubernetes objects, such as Pods or Deployments, but are user-defined and specific to an application's or infrastructure's needs.




## KubeCtl
[[KubeCtl Lab to deploy GKE Clusters]]


### Commands

kubectl get all
kubectl get nodes
kubectl get statefulset
kubectl describe statefulset NAME
kubectl describe secret NAME
kubectl get deployment
kubectl describe deployment NAME
kubectl get service NAME

kubectl apply -f YAML_FILE


## Pod Disruption Budget (PDB)

TO keep your application healthy, we use PDB to limit the number of the pods of a replicated application that can be simultaneously 

A PDB (Pod Disruption Budget) limits the number of pods of a replicated application that can be taken down simultaneously from voluntary disruptions. An Application Owner can create a PodDisruptionBudget object (PDB) for each application. 

Readiness probes: designed to know when your app is ready to serve traffic. Liveness probes: designed to let Kubernetes know if your app is alive or dead.


## Namespaces 








## GKE upgrades

![[Screenshot 2025-07-16 at 11.46.13 AM.png]]
![[Screenshot 2025-07-16 at 11.51.40 AM.png]]


## Controlling Access

Best practices, 
1. IAM at the project level
2. RBAC at the cluster and namespace level

![[Screenshot 2025-07-16 at 11.47.04 AM.png]]



## GKE Sandbox

Prevents running untrusted code in the production cluster

![[Screenshot 2025-07-16 at 11.48.34 AM.png]]





## Don't make service accounts

![[Screenshot 2025-07-16 at 11.53.52 AM.png]]

The preferred way to access services in a secured and authorized way is with Kubernetes service accounts, which are not the same as GCP service accounts.

With Workload Identity, you can configure a Kubernetes service account so that workloads will automatically authenticate as the corresponding Google service account when accessing GCP APIs.

Moreover, Workload Identity is the recommended way for applications in GKE to securely access GCP APIs because it lets you manage identities and authorization in a standard, secure and easy way.

**Workload identity federation** is useful when you have an external identity provider such as Amazon Web Services (AWS), Azure Active Directory (AD), or an OIDC-compatible provider.