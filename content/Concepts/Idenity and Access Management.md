There are three types of roles in IAM:

- Basic roles, which include the Owner, Editor, and Viewer roles that existed prior to the introduction of IAM.
    
- Predefined roles, which provide granular access for a specific service and are managed by Google Cloud.
    
- Custom roles, which provide granular access according to a user-specified list of permissions.

- Apply the principle of least privilege.
    
- Quiz [link](https://www.coursera.org/learn/gcp-fundamentals/quiz/xFLj4/resources-and-iam/attempt)
    

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfm2f7NnCdcvzvlg1h-2225uitQzpZZ8y2QLk4NABTNXwhMCFWaUmTR507y_qKjDgCLNXzATES5-I6uisvtRg2L_LYIMZKmQg6GysizLuRlvKu82C7Y8Se0GPWYMeF6dTC6RIz_Ioa7jInWGZEAaxlfY60?key=uQNqTlKuawktw3rK2EaKBA)

### Primitive roles

- Owner
    
- Editor
    
- Viewer
    
- Billing Administrator
    

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXc8dmFkKO9phoXGaeJsAfr0Ahhwf9LEQ-5lUwoAjYAWGLUAmxsuJyL1kTJ1ACuJuGWdOJhP588ZFwyIBG_2GTDw4f5KI8eNCC4EsW0pzmPfQzFvvmcTQMNE4MrT2aWA089JsGwkv-Jivpop4Ij5LV0UdkcY?key=uQNqTlKuawktw3rK2EaKBA)

### Predefined roles (more fine grained)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXdMoyS313gZ8sbCWhthYs2luZM7xLrdAUjZqA8W33Heu5VwFpbxGJnJJtdVh_BP8kIjtFhQJCRyJSJylhTS4NWvgh7EEh6dCcLCR597gxKhDQGlffggm8e6xdpRSyhdf9nkOqT5qtRqNVfxV_eg92Av07zv?key=uQNqTlKuawktw3rK2EaKBA)

  

### Custom roles (even more fine grained)

- Can only be used at the project or organization level.
    
- Can’t be used at the folder level.
    

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeNhEc3907dGgoWeQ587UFL36m1IGjaYSxV2FuPQ2oK7XYjjMMGetjt0D6nBFyHYJ1gHB0KpsimWiRYMhuQ6yHQBYtz4I78-Osrsn0lzqeg0bbT2hu1fGSLILK_5tmqCr2yPH0Pgc6Sa_1Lpn6jucqIDgfk?key=uQNqTlKuawktw3rK2EaKBA)

  

### Service accounts
A service account is a headless user used to authenticate and task permissions to facilliate operations. 

Like, passing data from compute engine to cloud storage 
A service account does that. 

- Use this to give permissions to VM rather than a person.
    


![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXe22_MhV2s5FTwuebBWKB_Z9LlcuB-J5vvjyvLIxRij7Vd2Qp2591U8FtajUexhsA7vJd8IKdW9n_R3PN5H_CbHOfsJXMF5bI7HHqpPdJgIuC0xexGb-8s3kg2l1w9ZkI-0iVvbLZ1SM8fLIG835lOuJLfW?key=uQNqTlKuawktw3rK2EaKBA)

  
  
**

![[iam.pdf]]


IAM scripts policies 

Basic IAM role: Owner, editor, viewer, billing admin![[Screenshot 2025-07-15 at 2.22.28 PM.png]]

Predefinied IAM role: 

Custom: More specific permissions, like a least privellege model.



### Cloud Identity
Define policies and manage users and groups using G admin console. 

![[Screenshot 2025-07-15 at 2.29.04 PM.png]]

## G Cloud Org Policy

[Introduction to the Organization Policy Service \| Resource Manager Documentation \| Google Cloud](https://cloud.google.com/resource-manager/docs/organization-policy/overview)

**Google Cloud Organization Policy Service** enables organizations to centrally manage constraints and enforce compliance across all Google Cloud resources. 

Most important, `constraints/iam.allowedPolicyMemberDomains`. 

By setting this constraint at the organization level, the policy ensures that only identities from approved domains, such as the company’s Cloud Identity, can be granted IAM roles across any project, folder, or resource within the organization. This prevents accidental exposure of data to personal accounts or unknown third parties. When properly configured, it enforces identity boundaries that align with corporate security policies and minimizes the risk of data exfiltration caused by misconfigured IAM permissions.


## Access Control Lists 

An access control list (ACL) is a mechanism you can use to define who has access to your buckets and objects, as well as what level of access they have. In Cloud Storage, you apply ACLs to individual buckets and objects. Each ACL consists of one or more _entries_. An entry gives a specific user (or group) the ability to perform specific actions. Each entry consists of two pieces of information:

- A **permission**, which defines _what_ actions can be performed (for example, read or write).
    
- A **scope** (sometimes referred to as a _grantee_), which defines _who_ can perform the specified actions (for example, a specific user or group of users).
    

As an example, suppose you have a bucket that you want anyone to be able to access objects from, but you also want your collaborator to be able to add or remove objects from the bucket. In this case, your ACL would consist of two entries:

- In one entry, you would give `READER` permission to a scope of `allUsers`.
    
- In the other entry, you would give `WRITER` permission to the scope of your collaborator (there are several ways to specify this person, such as by their email).
    

The maximum number of ACL entries you can create for a bucket or object is 100. When the entry scope is a group or domain, it counts as one ACL entry regardless of how many users are in the group or domain.


> [!NOTE] Make your object publicly accessible through ACL
Use the `gsutil acl ch` command to grant all users read permission for the object stored in your bucket:
`gsutil acl ch -u AllUsers:R gs://YOUR-BUCKET-NAME/ada.jpg`



## Active Directory, A Windows thing can be synced to Google

Active Directory (AD) is a Microsoft directory service that provides centralized management and organization of network resources, including users, computers, printers, and security policies, within a Windows network environment. It functions as a hierarchical database for storing information about these network objects and enables network administrators to control access, manage accounts, and enforce security settings across the network.  

Google Cloud Directory Sync enables administrators to synchronize users, groups and other data from an Active Directory/LDAP service to their Google Cloud domain directory.

## G Cloud Armour

Google Cloud Armor is a network security tool designed primarily to protect HTTP(S) applications from DDoS attacks and control traffic using IP-based rules, not identity-based access controls. Cloud Armor is only effective for public-facing endpoints,.

![](https://www.whizlabs.com/blog/wp-content/uploads/2021/11/Cloud-Armor.jpg)

