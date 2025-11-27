Resources that live in a zone are referred to as _zonal_ resources. 

Virtual machine instances and persistent disks live in a zone. 

If you want to attach a persistent disk to a virtual machine instance, both resources must be in the same zone. Similarly, if you want to assign a static IP address to an instance, the instance must be in the same region as the static IP address.

Regions are independent geographic locations in that location. 

Zones are facilities in that region and can be used to deploy resources and can attain multiple redundancy.

## Regions and zones

- Static external IP addresses, are regional
- GCE and their storage disks are zonal. 
- Spanner multi-region configuration can be in many region, zones. 

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfXQ2jk9JykYi97xr-pMV2Lka5cBCoKDDgehIOwxKjJVbyOdu03X1zCqPQUGr1qZ9ZKPDhDayU5xgUda7YxCbsKcdeGtDOdpoADE9aWxOp1pbslutlyKeSi_cxWH9QXBY7PHiV0ARC25ib-x9Z4PgLFqUM?key=uQNqTlKuawktw3rK2EaKBA)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeCkkIVI3jzpxaInoW-aleBfkw77xXUSLGFIutJYzfYToLxyZfpDs9S6X0DmtE-FE59MWDb-0Kycogkb7-T4D3-P205eXzjPEGvfVVRxxXCPiC9-8eagoi8FNNJJPOZZE2mySpwR_oSFS50NKmyv6wiR-8Q?key=uQNqTlKuawktw3rK2EaKBA)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeRSLtKjBiqcqhLXCbVC8IHxh01NO3UYCgCyT0TrWNoq4AYsL1B7kcTir5logIX44G6PJ6sFncXqqkw0nRFjA6JqNVG2-C-skgXtksQrN3jG_mcw84CBShs_P2zkRB9ExFjRase723153I3AtGy1vNj1p4?key=uQNqTlKuawktw3rK2EaKBA)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXexf5GPy82ZUQrqoGMP-sDmEsGpl4sjZH7U_FHferDC6AF_3wN88YLuEk3bXtkWaLg5aYEFLwCYxpspDMGpnJrStykEJdKG50j5bF7hGga7kZgz51Rav00ZesRepRRqvJLtC-W1Fvj8qWUsfg0ufODmcuA?key=uQNqTlKuawktw3rK2EaKBA)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXchYzr-cgX-mIQFCpyRHrEf71YHwvK3NVSH96UupeP7bx0gPdCWCnwXpNxUjW-aAOs4ECyV6TTDIz7PpvNn_B5y49kcXOQbR8VqC8n6RQaNSrTsKdDXgrpsOMLqaYOVH1xMj_tJJURvcRB9E4T_bZ8U3PvY?key=uQNqTlKuawktw3rK2EaKBA)

  
## 7 regions 

NA, SA, Africa, Europe, Asia, Australia, Middle East

|Regions|Zones|
|---|---|
|Western US|us-west1-a, us-west1-b|
|Central US|us-central1-a, us-central1-b, us-central1-d, us-central1-f|
|Eastern US|us-east1-b, us-east1-c, us-east1-d|
|Western Europe|europe-west1-b, europe-west1-c, europe-west1-d|
|Eastern Asia|asia-east1-a, asia-east1-b, asia-east1-c|

## App Regions affect 

Latency, availability, durability.

## Who's Who?

| Resource Type      | Resources                                                                                                                                                                                                                                                                                                                                                                          | Example GCP Resource Names/Services                                                                                                                                                                                                        | Notes                                                                                                                                                                                                                                                                                |
| ------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Global**         | **Compute & Networking:** Images, Snapshots, Global Instance Templates, Cloud Interconnects, VPC Network, Firewall Rules, Routes, Global Operations, Cloud DNS, Cloud CDN, Global External HTTPS Load Balancer **Security & Identity:** IAM Policies (at organization/folder/project level), Cloud KMS (Key Rings), Secret Manager (Secrets) **Management:** Cloud Asset Inventory | **VPC Network:** `my-global-vpc` **Cloud DNS Zone:** `my-company-zone` **IAM Role:** `roles/compute.admin` **KMS Key Ring:** `my-global-keyring`                                                                                           | Global resources are accessible from any region or zone within the same project. While a VPC network is global, its subnets are regional. IAM policies can be applied at different levels of the resource hierarchy, making them inherently global in scope.                         |
| **Multi-Regional** | **Storage & Databases:** Cloud Storage (Multi-Region buckets), Cloud Spanner (Multi-Region instances), Firestore/Datastore (Multi-Region mode), Artifact Registry (Multi-Region repositories)                                                                                                                                                                                      | **Cloud Storage Bucket:** `my-app-assets-eu` (EU multi-region) **Spanner Instance:** `my-global-db-nam4` (North America multi-region) **Firestore Database:** `(default)` in multi-region mode                                             | Multi-regional resources are replicated across multiple regions within a continent (e.g., US, EU, Asia) for high availability and low latency. This is different from "global" as they are not available in _every_ region worldwide.                                                |
| **Regional**       | **Compute & Serverless:** Addresses (Regional External IP), Regional Instance Templates, Regional Managed Instance Groups, Regional Persistent Disks, <br><br>Subnets, Cloud Run, Cloud Functions, App Engine, Cloud SQL, Filestore, Memorystore for Redis/Memcached, BigQuery (Datasets), Vertex AI (Datasets, Models, Endpoints), Cloud Composer, Pub/Sub (Topics)               | **Region:** `us-east1` **Cloud Run Service:** `my-api-service` in `europe-west2` **Cloud SQL Instance:** `my-postgres-db` in `asia-northeast1` **BigQuery Dataset:** `my_analytics_dataset` in `US` (multi-region, but billed as regional) | This is the most common resource scope. These resources are available across all zones within a specific region. Services like App Engine and BigQuery are regional, though you select a "location" (like `us-central` or `EU`) which can be a single region or a multi-region area. |
| **Zonal**          | **Compute:** Instances (Virtual Machines), Disks (Persistent Disk, Hyperdisk), GPUs & TPUs, <br><br>Zonal Managed Instance Groups                                                                                                                                                                                                                                                  | **Instance:** `my-web-server-1` in `us-central1-a` **Disk:** `data-disk-prod` in `europe-west4-b` **Zone:** `asia-south1-c`                                                                                                                | Zonal resources are confined to a single availability zone. If a zone experiences an outage, all zonal resources within it become unavailable. This offers the lowest latency for resources that need to communicate with each other.                                                |
|                    |                                                                                                                                                                                                                                                                                                                                                                                    |                                                                                                                                                                                                                                            |                                                                                                                                                                                                                                                                                      |