
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

## Networks in General

**_Networks_** directly connect your resources to each other and to the outside world. Networks, using firewalls, also house the access policies for incoming and outgoing connections. Networks can be global (offering horizontal scalability across multiple Regions) or regional (offering low-latency within a single region).


## Virtual Private Cloud Networking

A _VPC network_ is a virtual network inside of Google Cloud. A VPC network is a global resource that consists of a list of regional virtual subnetworks (subnets) in data centers, all connected by a global wide area network. VPC networks are logically isolated from each other in Google Cloud.

A secure indivudal private cloud computing model hosted in public cloud, by a public cloud provider used to run code, store data, host websites.

```
gcloud compute networks create taw-custom-network --subnet-mode custom
```

When a new project is created, a default network configuration provides each region with an auto subnet network. You can create up to four additional networks in a project. Additional networks can be auto subnet networks, custom subnet networks, or legacy networks.


![[Screenshot 2025-07-15 at 2.35.23 PM.png]]

## SubNetworks 

**_Subnetworks_** allow you to group related resources (Compute Engine instances) into RFC1918 private address spaces. Subnetworks can only be regional. A subnetwork can be in auto mode or custom mode.

- An auto mode network has one subnet per region, each with a predetermined IP range and gateway. These subnets are created automatically when you create the auto mode network, and each subnet has the same name as the overall network.
- A custom mode network has no subnets at creation. To create an instance in a custom mode network, you must first create a subnetwork in that region and specify its IP range. A custom mode network can have zero, one, or many subnets per region.

## Subnets

Subnets are regional in nature.  VPC subnets can span the zones that make up a region. This is beneficial because your solutions can incorporate fault tolerance without complicating your network topology.

Auto mode networks create subnets in each region automatically, while custom mode networks start with no subnets, giving you full control over subnet creation

Through them, resources can be made available in different regions globally but still be part of the same subnet to access them anywhere to easy network topology

```
gcloud compute networks subnets create subnet-us-east1 \
   --network taw-custom-network \
   --region us-east1 \
   --range 10.2.0.0/16

Created [https://www.googleapis.com/compute/v1/projects/cloud-network-module-101/regions/us-east1/subnetworks/subnet-us-east1].
NAME                REGION        NETWORK             RANGE
subnet-us-east4    us-east4  taw-custom-network  10.2.0.0/16



gcloud compute networks subnets list \
   --network taw-custom-network

NAME                REGION        NETWORK             RANGE
subnet-us-east1    us-east1    taw-custom-network  10.1.0.0/16
subnet-us-east4  us-east4  taw-custom-network  10.2.0.0/16
subnet-us-west1  us-west1   taw-custom-network  10.0.0.0/16
```

Example, 

![[Screenshot 2025-07-15 at 2.36.45 PM.png]]

Use to build solutions that are resilient yet easy to manage


VPC provides 
1. Routing tables: Forward instance from one instance or other
2. Firewalls: Restrict access to instances, rules can be defined through network tags. 

VPC can be used to, 
1. VPC Peering - Connect to resources in different projects 
2. Shared VPC - Connect to different resources through cloud identity, who what where can interact.

## Regions and Zones 

[[Region and Zones]]



## Firewall

For more information on how you can use firewall rules to isolate subnetworks, refer to [subnetworks](https://cloud.google.com/vpc/docs/vpc#vpc_networks_and_subnets) and [firewall rules](https://cloud.google.com/compute/docs/vpc/firewalls).

Each network has a default firewall that blocks all inbound traffic to instances. To allow traffic to come into an instance, you must create "allow" rules for the firewall. Additionally, the default firewall allows traffic from instances unless you configure it to block outbound connections using an "egress" firewall configuration. Therefore, by default you can create "allow" rules for traffic you wish to pass ingress, and "deny" rules for traffic you wish to restrict egress. You may also create a default-deny policy for egress and prohibit external connections entirely.


gcloud compute firewall-rules create privatenet-allow-icmp-ssh-rdp --direction=INGRESS --priority=1000 --network=privatenet --action=ALLOW --rules=icmp,tcp:22,tcp:3389 --source-ranges=0.0.0.0/0

- **ICMP**

gcloud compute firewall-rules create "nw101-allow-icmp" --allow icmp --network "taw-custom-network" --target-tags rules



- **Internal Communication**

gcloud compute firewall-rules create "nw101-allow-internal" --allow tcp:0-65535,udp:0-65535,icmp --network "taw-custom-network" --source-ranges "10.0.0.0/16","10.2.0.0/16","10.1.0.0/16"



- **SSH**

gcloud compute firewall-rules create "nw101-allow-ssh" --allow tcp:22 --network "taw-custom-network" --target-tags "ssh"



- **RDP**

gcloud compute firewall-rules create "nw101-allow-rdp" --allow tcp:3389 --network "taw-custom-network"

In general, it is recommended to configure the least permissive firewall rule that will support the kind of traffic you are trying to pass. For example, if you need to allow traffic to reach some instances, but restrict traffic from reaching others, create rules that allow traffic to the intended instances only. This more restrictive configuration is more predictable than a large firewall rule that allows traffic to all of the instances. If you want to have "deny" rules to override certain "allow" rules, you can set priority levels on each rule and the rule with the lowest numbered priority will be evaluated first. Creating large and complex sets of override rules can lead to allowing or blocking traffic that is not intended.

The default network has automatically created firewall rules, which are shown below. No manually created network of any type has automatically created firewall rules. For all networks except the default network, you must create any firewall rules you need.

The ingress firewall rules automatically created for the default network are as follows:

|                          |                                                                                           |
| ------------------------ | ----------------------------------------------------------------------------------------- |
| `default-allow-internal` | Allows network connections of any protocol and port between instances on the network.     |
| `default-allow-ssh`      | Allows SSH connections from any source to any instance on the network over TCP port 22.   |
| `default-allow-rdp`      | Allows RDP connections from any source to any instance on the network over TCP port 3389. |
| `default-allow-icmp`     | Allows ICMP traffic from any source to any instance on the network.                       |

![[Screenshot 2025-07-15 at 3.53.06 PM.png]]

Cloud DNS can be used with Cloud CDN to accelerate content delivery to be near customers 

### Network route

All networks have routes created automatically to the Internet (default route) and to the IP ranges in the network. The route names are automatically generated and will look different for each project.

- To review default routes, click **Navigation menu** > **VPC network** > **Routes** > Select **Network** and **Region** to view **Routes**.

![The Routes page displaying a list of routes and their respective description, destination IP range, priority level, and network](https://cdn.qwiklabs.com/tn5FCanVlH8H2Mk%2FKBeMbHwUFkl%2BLx4ub3bW%2Bdf0mls%3D)


## How to connect VPC to other networks, on-premises networks or the cloud. Many ways. 

![[Screenshot 2025-07-15 at 3.55.52 PM.png]]
### Cloud VPN (worst)

You can use Cloud VPN to let other networks and VPC exchange route information over teh VPN using the border grateway protocol. Only data that resides inside a Google Cloud VPC environment passes a [Cloud VPN](https://cloud.google.com/network-connectivity/docs/vpn) tunnel or a [Cloud Interconnect](https://cloud.google.com/network-connectivity/docs/interconnect) connection by default.

![[Screenshot 2025-07-15 at 3.57.17 PM.png]]

### Direct Peering

Direct Peering allows you to establish a direct connection between your business network and Google's edge network for high-throughput traffic exchange.

![[Screenshot 2025-07-15 at 3.57.37 PM.png]]


### Carrier Peering 

Carrier Peering enables you to access Google applications, such as Google Workspace, by using a [service provider](https://cloud.google.com/network-connectivity/docs/carrier-peering#service-providers) to obtain enterprise-grade network services that connect your infrastructure to Google.

When connecting to Google through a service provider, you can get connections with higher availability and lower latency, using one or more links. Work with your service provider to get the connection that you need.

Does not give private IP addressing across the connection.

![[Screenshot 2025-07-15 at 3.58.05 PM.png]]



### Dedicated interconnect
This option provides low-latency and high-bandwidth connectivity between on-premises networks and Google Cloud, but it is primarily a network optimization and private connectivity solution. 

Requires 10 gig interfaces hardware to be installed already.

![[Screenshot 2025-07-15 at 3.58.27 PM.png]]

### Partner Interconnect

Provides connectivity between your on-premises and VPC networks through a supported service provider.

Get a partner to run the interconnect, allow the use of lower bandwidth interfaces that customers have since they can't saturate 10 gigs.

![[Screenshot 2025-07-15 at 3.56.11 PM.png]]


### Cross Cloud Interconnect

Cross-Cloud Interconnect is a product that helps you establish high-bandwidth dedicated connectivity between Google Cloud and another cloud service provider.

![[Screenshot 2025-07-15 at 3.59.49 PM.png]]


## **Cloud Identity-Aware Proxy (IAP) - Tunnel to internal applications securely via HTTPS

C Identity-Aware Proxy (IAP) connector allows you to manage access to HTTP-based apps outside of Google Cloud.

You can use an application-level access control model instead of relying on network-level firewalls.

IAP- Identity-Aware Proxy is a service that lets you use SSH and RDP on your GCP VMs from the public internet, wrapping traffic in HTTPS and validating user access with IAM.

Inside GCP there is a Proxy server with a listener that translates the communication and lets you operate in a safe way without the public exposure of your GCP resources.

## VPC SERVICE CONTROLS - Security Perimeters

**VPC Service Controls** is pivotal in securing sensitive data on Google Cloud, especially for services like BigQuery,

 By establishing service perimeters, organizations can ensure that only requests originating from trusted networks, such as VPCs or on-premises environments connected via Cloud VPN or Interconnect, can access protected services.

VPC Service Controls create additional security for Cloud applications:

- Isolate services and data
- Monitor against data theft and accidental data loss
- Restrict access to authorized IPs, client context, and device parameters


## Private Google Access

 ... allows compute resources without external IP addresses, including those in your on-premises data center, to securely access Google services without exposing traffic to the public internet. When your network is connected via Cloud VPN or Interconnect, enabling Private Google Access ensures that communication remains internal to Google’s infrastructure, greatly reducing exposure to external threats.

Needed for HIPAA, GDPR, or FedRAMP.

If you want to transfer data to and from [other Google services](https://cloud.google.com/vpc/docs/private-google-access-hybrid#supported-services-onprem), you can use [Private Service Connect](https://cloud.google.com/vpc/docs/configure-private-service-connect-apis) and [Private Google Access for on-premises hosts](https://cloud.google.com/vpc/docs/private-google-access-hybrid) from the other CSP's environment.


## Gated Egress

Gated egress topology lets APIs in on-premise environments be available only to processes inside Google Cloud without direct public internet access.

Applications in Google Cloud communicate with APIs in on-premise environments only with private IP addresses and are eventually exposed to the public via an Application Load Balancer and using VPC Service Controls.

## Serverless Network Endpoint Groups - NEG

Network endpoint groups (NEG) let you design serverless backend endpoints for external HTTP(S) Load Balancing. Serverless NEGs became target proxies and the forwarding is performed with the use of URL maps. In this way, you may integrate seamlessly with the legacy application.

An alternative solution is API Management, which creates a facade and integrates different applications. GCP has 3 API Management solutions: Cloud Endpoints, Apigee, and API Gateway. API Gateway is only for serverless back ends.