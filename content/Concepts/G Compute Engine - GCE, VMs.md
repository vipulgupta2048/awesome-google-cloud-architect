- IaaS
- Offers VMs as a service.
- No upfront investment 
- A VM can be configured for virtual CPUs, rams just like a physical server. 
- billing by the second 
- Two options, 
	- Spot instances, unlimited time, more features
	- Preemptible instances, only 24 hrs, less features
- Can use autosclaing to scale according to need, quota and machine type limits when required
- increasing the memory size requires a VM restart.
- persistent disk performance is based on the total persistent disk capacity attached to an instance and the number of vCPUs that the instance has. 
	- Incrementing the persistent disk capacity will increment its throughput and IOPS, which in turn improve the performance of MySQL


[[G Cloud Load balancing]]
[[Virtual Private Cloud Networking]]

## Cloud NAT

**Cloud NAT (Network Address Translation)** is a fully managed Google Cloud service that enables Compute Engine VM instances without external IP addresses to access the internet securely. This is particularly useful in scenarios where you want to maintain a private networking architecture for security reasons but still need outbound access. Example OTA. 

> [!NOTE] Where
> Google Cloud NAT is designed to scale automatically based on traffic volume and integrates with Cloud Router to support dynamic routing, though the router is not strictly required in all NAT use cases.


Cloud NAT solves this by translating the instances’ private IPs to a NAT gateway’s external IP address for outbound traffic. Importantly, this translation occurs only in the egress direction, ensuring that the VM instances remain inaccessible from external sources.


## Private Google Access

Private Google Access is only intended for accessing Google APIs and services, such as Cloud Storage or BigQuery, from VMs without external IPs.



## Managed Instance Groups - Migs

[Managed instance groups](https://cloud.google.com/compute/docs/instance-groups) (MIGs) let you operate apps on multiple identical VMs. You can make your workloads scalable and highly available by taking advantage of automated MIG services, including: autoscaling, autohealing, regional (multiple zone) deployment, and automatic updating.
