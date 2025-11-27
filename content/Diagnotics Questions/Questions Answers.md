![[Questions-week3.pdf]]

![[diagnosticweek4.pdf]]

**

EHR Case Study

They want to connect more than one facility to google cloud

- Use Dedicated interconnect for two metro cities
    
- Use VPN with two tunnels?
    

✅ What would you do to stay compliant:

Multiple choice (Choose 2):

- ✅ Check GCP products to verify the products being used are compliant
    
- Use prometheus to check audit logs
    
- Use Firebase Authentication
    
- ✅ Establish Business Associate Agreements (BAAs)
    

Need to move more than 10TB data from third party storage service

- Use Storage service solution?
    
- Use Google appliance?
    
- Use gcloud copy command?
    
- Download to on-prem then upload
    

  

✅ How to ensure compute resources can only be created in few selected regions?

- Answer lies in [Restricting Resource Locations | Resource Manager Documentation | Google Cloud](https://cloud.google.com/resource-manager/docs/organization-policy/defining-locations)
    
- You can limit the physical location of a new resource with the Organization Policy Service resource locations constraint. You can use the location property of a resource to identify where it is deployed and maintained by the service.
    

How to ensure public IP can not be allocated to non-prod resources and what IAM policies to apply?

Have a GKE cluster with 200 nodes doing batch, stateless and stateful processing, how to reduce cost and optimize?

An application in GKE needs to talk to a non-GCP network application. How to set it up?

- Serverless VPC Access
    

Dev and approval stage applications to be available on weekends only, save cost?

Wanna architect an application with multiple

BYOL windows, how to set it up, use a command, must know practical usage with commands, Sole tenancy?

Security team needs access to logs based on certain events, how to set it up, I chose to 

  

Is log aggregation possible at folder level then trigger cloud function to put these to a folder? How would you design a system giving access to logs for a team also how to unify logging?

  

Firewall logs not appearing for certain rules you have configured, will you

- Enable firewall logging?
    
- Enable VPC flow logs?
    

  

You have an application that needs extensive set up, would you? Also doesn’t scale horizontally

- Set up a managed group of instances?
    
- Set up an unmanaged group of instances?
    
- Use startup script for your instances?
    

When to use unmanaged groups for apps needing detailed customizations.

  

Montrick games

New game needs access to Firestore database from a legacy game project, give minimum required access

- Create two SAs and give Firebase admin access to both?
    
- Create two SAs and give org admin access to one/both of them?
    

  
  

Loan processing application needs to manage the documents for 5 years while maintaining an audit trail of who did what, whenever a document is modified an approval workflow should trigger, how to design this?

- Create a service account and use it to upload/modify files?
    
- Set up a retention policy and lock it
    

  

Sole tenancy, learn about groups and how to scale and configure deployment so only the correct nodes get deployed, use node name or node group name? Read more about sole tenancy.

Why would you recommend a monolithic 3-tier architecture to be migrated into microservices and justify the worthiness of the move?

- Low cost
    
- Easier to manage infra / CI/CD more efficient for developers
    

  
  

Security team needs access to logs, what would you do to ensure this is done, logs already pushed to cloud logging, should be able to get notified and act on it (maybe need access to logs?)

- Enable triggers from logging and use Cloud functions to push specific events to storage bucket.
    
- Push data to BigQuery and set up query alerts?
    

  

How to push minor updates without impacting live servers?

- Use optimistic roll out?
    
- Use proactive roll out?
    
- Use rolling update with restart?
    
- Use rolling update with cancel?
    

  

Data science and compliance teams need access to same data, data science team should’t be able to see PII data?

- Create materialized views and give IAM access?
    
- Create views and give access?
    
- Create separate data set and give access?
    

  

Need to move Hadoop cluster to cloud with cost optimization and less infrastructure to manage

- Use GKE cluster?
    
- Use Dataproc? >>> read more
    

  

An application was working fine then started giving issues, pub/sub was introduced recently but messages are not getting published, application load has increased

- Increase timeout for pub/sub
    
- Use the pull instead of push
    
- Set up auto scale for flag NumberOfFailedMessages > x
    
- Set up auto scale for PushedMessagesLatency
    

  

For an image upload application (multi regional) how would you design a reliable system

  

For a music streaming application some users complain that they are not able to play the popular songs and it takes few times before it plays, how to optimize the solution?

- Set up a CDN solution
    
- Let VM serve the songs
    
- Download the songs to Firestore
    

  

A mobile application needs to be rolled out with some configuration changes, what would you use?

- Firebase Beta test lab?
    
- VM hosting?
    

  

Learn more about VPC peering

Dedicated interconnect

  

When to use cloud storage appliance? 10 TB data

  

Have an application that serves TCP traffic how would you help scale it up without exposing it to public

- Read more about ingress traffic
    

  

Read more about Binary authorization

  

You want to ensure only verified images are deployed securely

- Use Binary authorization?
    
- Use Container registry vulnerability scanner before deploying?
    

  

You have compliance requirement for all the documents uploaded to the storage, you also need to be able to rotate the keys

- Use AES 256 encryption using the CSEK feature to encrypt
    
- Use Google secret manager to create keys and encrypt
    

  

Cloud operations and logging

- Logs aggregation
    
- Taking logs backup for access to different teams
    

  

When to use cloud scheduler

- What options are available
    
- Get best use cases
    

**


## 4.1 

