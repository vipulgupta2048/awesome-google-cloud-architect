Managed resources + Managed services
Allows developers to concentrate code
## Infrastructure as a Service - IaaS

Raw compute
Storage 
network features 

like compute engine

Pay for what they allocate


## Platform as a service - PaaS

Bind code to libraries as infrastructure needs
Pay for what you use

Like Cloud Run to run apps.




## Google Front End 
provides a way for services to be behind a layer to protect it from attacks and intrusion. 



## Google per second pricing
Available on, 

1. Compute Engine - IaaS
2. GKE - Container Iaas
3. Dataproc, data system hadoop operating as a service
4. App Engine (Flexible VMs as PaaS)

If you run an instance more than 25% of the month then every incremental minute is discounted.

Budgets can be applied at billing account level or project level.
Rate quota and allocation quota can be applied at project level.


## Resource Hierarchy

![[Screenshot 2025-07-15 at 2.15.08 PM.png]]


Resources are VMs, Bigquery Tables, Containers. 

Projects have resources. Each resource belongs to a particular single project. 

A folder can have multiple projects. Lets us assign policies to resources at our level of granularity.

Organization can have multiple folder of projects. 

Policies can be applied to Level 4, 3, 2

Three identifiers, 
![[Screenshot 2025-07-15 at 2.32.28 PM.png]]

[[Idenity and Access Management]]