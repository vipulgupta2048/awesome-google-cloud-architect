```table-of-contents
title: 
style: nestedList # TOC style (nestedList|nestedOrderedList|inlineFirstLevel)
minLevel: 0 # Include headings from the specified level
maxLevel: 3 # Include headings up to the specified level
include: 
exclude: 
includeLinks: true # Make headings clickable
hideWhenEmpty: false # Hide TOC if no headings are found
debugInConsole: false # Print debug info in Obsidian console
```


![[Screenshot 2025-07-16 at 11.28.04 AM.png]]
## What Storage Solution to use?

![[Screenshot 2025-07-16 at 3.20.20 AM.png]]

## Replacements

| Source                               | Replacement                                                                                                                        |
| ------------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------- |
| MySQL, SQL Server, OLTP              | [Cloud SQL](https://www.youtube.com/watch?v=nGwOPAqgX7U&list=PLTWE_lmu2InBzuPmOcgAYP7U80a87cpJd) , 64 TB max or Spanner, petabytes |
| MongoDB, data driven apps            | Mongo Atlas on Marketplace / [[#Firestore - NoSQL]]                                                                                |
| Redis, Memcached                     | [[GCS Cloud Storage#Managed Redis - Memory Store]]                                                                                 |
| Anything                             | GCS Buckets > 10 MB, capacity in PB, 5 Tb per object                                                                               |
| analytics structured data, Cassandra | [[#BigTable - NoSQL]], petabytes,heavy rw, real time                                                                               |
| NFS                                  | [[GCS Cloud Storage#FileStore - NoSQL]]                                                                                            |
| Datastore                            | Highly available structured data at scale. Need ACID                                                                               |
| Analytics, SQL queries, OLAP         | [[GCS Cloud Storage#BigQuery - does both storage + analysis]]                                                                      |


## Comparing Storage Solutions 

![[compare-storage.pdf]]


## Price comparisons

Cheapest per byte storage in GCP is Google Cloud Storage.
GCS pay for only what's used. No pre-provisoning needed.

1. Multi petabyte SQL database only for analysts, available 24x7 - BigQuery.
	1. Cheapest, SQL, high storage, high available database in GCP always for analysis


> [!NOTE] GCS Price comparisons
> Cloud Storage > Big Query 

 

## Google Cloud Storage, GCS - For Unstructured data

> GCS is used for durable object storage. 

Object storage is neither file storage or block storage. It's rather stores files as blobs as they are uploaded with their metadata. Often with a globally unique identifier. often pictures, videos, recordings. 

**Google Cloud Storage** Cloud Storage is a managed service for **storing unstructured data. Store any amount of data and retrieve it as often as you like.

1. Automatically transition to lower-cost storage classes
2. Standard, nearline, coldline, and archive storage options
3. Fast, low-cost, highly durable archive and backup storage
4. Objects are immutable. Any changes are made as versions.

GCS files are organized into buckets. Buckets are regional and need a unique identifier.

Docs: [Storage classes \| Google Cloud](https://cloud.google.com/storage/docs/storage-classes)

![[Screenshot 2025-07-09 at 11.49.45 AM.png]]

### Features

![[Screenshot 2025-07-09 at 11.51.42 AM.png]]


## Factors to decide Storage Option


Applies to all objects in your bucket unless you manually modify the class per object or set object lifecycle rules. Best when your usage is highly predictable.

1. Access Frequency 
2. Retention Period - min storage duration
3. Pay for use pricing for storage and access

### 4 Storage classes

1. Standard: Best for short-term storage and frequently accessed data, Hot data.
2. Nearline: Data accessed less than once a month. 
3. Coldline: Best for disaster recovery and data accessed less than once a quarter. Data backups or data infrequently accessed. 
4. Archive: Best for long-term digital preservation of data accessed less than once a year
5. Additional classes

Create nearline class, define lifecycle policy of 5 years age to delete the data
Can we edit the storage class later in the bucket lifecycle? 

![[Screenshot 2025-07-09 at 11.55.35 AM.png]]
![[Screenshot 2025-07-09 at 11.58.20 AM.png]]
### Autoclass: Auto recommend a class 

GCP decides the Storage Class for GCS based on object level activity in the bucket to optimize for cost and latency

![[Pasted image 20250716112852.png]]



## Encyptions 

Any storage class in GCP where you are storing data at rest. You have to encrypt it.
GCP encrypts data when being stored. There is no opt out with GCP. Always encrypted.

Transition and processing of the data, there is opt out and we can define how encyrption is done. 

Use HTTPS/TLS for data transfer to customers from GCS


### GMEK - CMEK - CSEK
Base64-encoded AES 256 key is best
We need this for encryption or decryption. 

![[Screenshot 2025-07-09 at 12.01.54 PM.png]]
![[Screenshot 2025-07-16 at 11.31.09 AM.png]]
## Access to Buckets

Use gsutil to manage access control list policies

- Commonly thorugh IAMs
- Or, through access control lists (ACLs)  [[Idenity and Access Management#Access Control Lists]]


## Life Cycle Management Policies Retention Policy

#### Bucket retention policy

Cloud Storage has buckets. Buckets contain [objects](https://cloud.google.com/storage/docs/json_api/v1/objects) which can be accessed by their own methods. In addition to the `acl` property, buckets contain [bucketAccessControls](https://cloud.google.com/storage/docs/json_api/v1/bucketAccessControls), for use in fine-grained manipulation of an existing bucket's access controls. 

Set retention policy in terms of days. The bucket would become immutable for that duration and prevents deletion or modification of objects in this bucket. 

One you lock the policy in place, the policy can't be changed even by admins. We can't do anything until they fulfil the expiration policy when locked. 

Often used for compliance requirements where you are required to not change the data. 

#### Object Retention policy

Individual objects in the bucket can be set for retention policy for compliance requirements. 

### Object Versioning 

Create new versions of the object in the bucket. Can work even when the bucket retention policy is locked. 

![[Screenshot 2025-07-16 at 11.30.46 AM.png]]


If no versioning, new versions will override older versions. 

## Modes to transfer data to GCP Storage

**Online:** TB/Petabytes of data, batch transfers from different providers, HTTP endpoints - Used majority of usecases, we use Storage Transfer Service. Cheap, Low-Cost, but bandwidth heavy

**Offline:** Only if there is low bandwidth, security concerns or there is urgent data to be transferred use Transfer Applicance. You get a storage medium from Google, you load the data, and ship to the data center. A petabyte at a time with Transfer appliance

![[Screenshot 2025-07-09 at 11.59.42 AM.png]]


![[Screenshot 2025-07-16 at 11.30.04 AM.png]]



## Managed Database - Cloud SQL

Zonal entity, can't be used for multi-region

Don't need to patch, resize, scale databases. GCP manages it all for us. Manages backup. Configuring replications. Lets us focus on the usecase needs. 

- Encrypts customer data on Google's internal networks. 
- Cost includes 7 backups.m
- Includes network firewalls. 

![[GCloudSQL.pdf]]


## Spanner - DB used by Google

Fully managed relational database service that speaks SQL
Scales horizontally.
Relational Sematics (Follow ACID, Schemas, Transactions, SQL)
Horizonatal 

![[Screenshot 2025-07-16 at 3.14.40 AM.png]]

### Cloud Spanner fits

![[Screenshot 2025-07-30 at 11.45.01 AM.png]]

### Cloud Spanner less well

![[Screenshot 2025-07-30 at 11.47.49 AM.png]]

## FileStore - managed NFS

Contains FileStore, FireStore DataStore Mode vs Firestore (Native) mode, Firebase, Memorystore, CLoud Spanner, Big QUery, Big Table

![[storage.pdf]]


## FireStore - NoSQL document DB

Replacement for MongoDB, Cassandra

NoSQL database, horizontally scalable for mobile, web, server development. 
Data is stored as individual documents. The DB stores them as collections of documents. 

Has automatic multi-region data replication
NoSQL feature has flexible schemas.

![[Screenshot 2025-07-30 at 11.40.00 AM.png]]

### Datastore vs Firestore

![[Screenshot 2025-07-30 at 11.41.34 AM.png]]


## Firestore vs FILESTORE vs Firebase

Firebase is a mobile application development base; not part of GCP

![[Screenshot 2025-07-30 at 11.41.50 AM.png]]

## Managed Redis - MemoryStore

![[Screenshot 2025-07-30 at 11.43.47 AM.png]]


## Both BigTable & BigQuery

Exam Tip: types of apps where you’d consider using Bigtable:
recommendation engines, personalizing user experience,
Internet of Things, real-time analytics, fraud detection,
migrating from HBase or Cassandra, Fintech, gaming,
high-throughput data streaming for creating / improving ML
models.

![[bigquery.pdf]]

## BigTable - NoSQL
Latency intensive, spark replacement

NoSQL big data DB service that is used by Google Maps and Search.
For massive workloads, low latency, high throughput work. 

Great for operational big applications and analysis applications.

![[Screenshot 2025-07-16 at 3.18.39 AM.png]]

BigTable is for machine learning applications.

## BigQuery - does both storage + analysis

Why not pure storage? This is because it sits on the edge between data storage and data processing. The usual reason to store data in BigQuery is so you can use its big data analysis and interactive querying capabilities, but it’s not purely a data storage product.

[BigQuery](https://cloud.google.com/bigquery/) is a fully-managed petabyte-scale data warehouse that runs on the Google Cloud. Data analysts and data scientists can quickly query and filter large datasets, aggregate results, and perform complex operations without having to worry about setting up and managing servers. It comes in the form of a command line tool (pre installed in cloudshell) or a web console—both ready for managing and querying data housed in Google Cloud projects.n


![[Screenshot 2025-07-30 at 11.49.27 AM.png]]

![[Screenshot 2025-07-30 at 11.49.41 AM.png]]


## Cloud DataPrep

 Cloud Dataprep is a service for data transformation and preparation, primarily used for cleaning and structuring data for analytics. It is not intended for decrypting and transferring data from a Transfer Appliance to Cloud Storage.


Cloud Storage FUSE allows mounting Cloud Storage as a file system,


## DataProc

### HDFS to GCS

![[Screenshot 2025-07-09 at 12.02.56 PM.png]]







## DataFlow - Real Time Data Processing, 

Dataflow is a Google Cloud service that provides unified stream and batch data processing at scale. Use Dataflow to create data pipelines that read from one or more sources, transform the data, and write the data to a destination

![](https://cloud.google.com/static/dataflow/images/dataflow-pipeline-example.png)

Typical use cases for Dataflow include the following:

- Data movement: Ingesting data or replicating data across subsystems.
- [ETL](https://cloud.google.com/learn/what-is-etl) (extract-transform-load) workflows that ingest data into a data warehouse such as BigQuery.
- Applying ML in real time to streaming data.
- Processing sensor data or log data at scale.
- Dataflow manages streaming data pipelines but cannot derive metadata from binary data, unless you use customized code.

Stages can include reading data from a source, transforming and aggregating the data, and writing the results to a destination. Stages being

- Move data as-is to a destination.
- Transform data to be more useable by the target system.
- Aggregate, process, and enrich data for analysis.
- Join data with other data.