 
 2. Case study specific teachings
3. Load balancers 
4. HLS
5. CIDR ranges
6. 3-tier web application - tier (web, API, and database)
7. service level objectives (SLOs)
8. Cloud Run, App Engine 
9. Find out who's regional or zonal

## Load balancing 

Create static addresses to route traffic to correct compute instance 
Create HTTP health checks for compute
Create a target pool in the same region as compute and add the health check which is required
Add instances to that pool

Forwarding rules for that target pool to setup an l4 network load balancer now


```
tudent_01_a7d1be117ad4@cloudshell:~ (qwiklabs-gcp-01-98dec49804a1)$ gcloud compute forwarding-rules describe www-rule --region us-east4
IPAddress: 35.188.250.153
IPProtocol: TCP
creationTimestamp: '2025-07-08T12:00:59.871-07:00'
description: ''
fingerprint: -Q5rvU0vNTQ=
id: '8031974216821691396'
kind: compute#forwardingRule
labelFingerprint: 42WmSpB8rSM=
loadBalancingScheme: EXTERNAL
name: www-rule
networkTier: PREMIUM
portRange: 80-80
region: https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-01-98dec49804a1/regions/us-east4
selfLink: https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-01-98dec49804a1/regions/us-east4/forwardingRules/www-rule
selfLinkWithId: https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-01-98dec49804a1/regions/us-east4/forwardingRules/8031974216821691396
target: https://www.googleapis.com/compute/v1/projects/qwiklabs-gcp-01-98dec49804a1/regions/us-east4/targetPools/www-pool
```

7. Google Cloud provides health checking mechanisms that determine whether backend instances respond properly to traffic. For more information, please refer to the [Creating health checks](https://cloud.google.com/load-balancing/docs/health-checks) documentation.
8. Google Front End 
9. Google backend-services 
10. A [forwarding rule](https://cloud.google.com/load-balancing/docs/using-forwarding-rules) and its corresponding IP address represent the frontend configuration of a Google Cloud load balancer. Learn more about the general understanding of forwarding rules from the [Forwarding rules overview](https://cloud.google.com/load-balancing/docs/forwarding-rule-concepts) guide.