![[ehr.pdf]]

Saas, leading provider of electronic health record software to the medical industry.
### Focus Area

Healthcare industry: heavily regulated for privacy / protection os sensitive personal data (PII = Personal Identifiable Information). Software is currently hosted in multiple colocation facilities, the lease on one of the data centers is about to expire (we'll migrate this one first): step by step migration.

[![Screenshot 2022-01-25 at 18 13 10](https://user-images.githubusercontent.com/39993930/151025508-fa94f9d5-e0eb-420b-8d7c-9c6e636fe994.png)](https://user-images.githubusercontent.com/39993930/151025508-fa94f9d5-e0eb-420b-8d7c-9c6e636fe994.png)
Healthcare system on GKE, lot of patient data, security focused, need to move to Public Cloud from their own hosting. 

| Usecase                                                                                       | Solution                                                                                                          |
| --------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| Onboard new insurance providers ASAP                                                          | APIgee                                                                                                            |
| Microsoft Active Directory                                                                    | Cloud Identity                                                                                                    |
| Min 99.99% SLA                                                                                | Google already does                                                                                               |
| MySQL                                                                                         | G Cloud SQL                                                                                                       |
| MongoDB, unstructured data                                                                    | G Firestore                                                                                                       |
| Provide insights into healthcare trends                                                       | BigQuery                                                                                                          |
| Make predictions and generate reports                                                         | Machine learning model                                                                                            |
| Maintain regulatory compliance                                                                | [DLP (Data Loss Protection)](https://www.youtube.com/watch?v=ab_Dctdu2G8&list=PLTWE_lmu2InBzuPmOcgAYP7U80a87cpJd) |
| Provide a secure and high-performance connection between on-premises systems and Google Cloud | [[Virtual Private Cloud Networking#Dedicated interconnect]] > 10 GB/s otherwise partner interconnect              |

![[Screenshot 2025-07-16 at 12.22.20 PM.png]]


Questions, 
1. Dedicated Intercow latency. 
2. Org Policy for making sure people don't make changes and IP address can only be applied to G frontend
3. 