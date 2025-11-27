Multi region competitions 
AI/ML services to do race prediction 
Content is both real time and recorded closer to their users

![[Helicopter-racing-league.pdf]]

| Requirement                                                                                          | Better alternative                                                                                                                                                   |
| ---------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Video encoding and transcoding is performed on VMs for each job                                      | [[Managed Instance Groups - MIGs]] or GKE is more optimized                                                                                                          |
| Existing content in object storage device in existing storage service                                | Needs STS - storage transfer service                                                                                                                                 |
| Support ability to expose predictive model to partners                                               | needs an API management then APIGee                                                                                                                                  |
| Video recordings storage                                                                             | Since unstructured, then GCS                                                                                                                                         |
| Minimize operational complexity                                                                      | Use managed services                                                                                                                                                 |
| Ensure compliance with regulations                                                                   | Use org policy                                                                                                                                                       |
| Store analytical Data, keep all historical data, cost effective, partition race data based on season | BigQuery and then for ML work, use BigQuery ML                                                                                                                       |
| How to check VMs are sitting idle or not in G Compute instance                                       | [Idle VM recommendations](https://cloud.google.com/compute/docs/instances/viewing-and-applying-idle-vm-recommendations),<br> Google recommender command can be used. |
| Customer wants to delete the account whenever but keep the data for 60 days for business usecase     | Disable the account for 30 days<br>Export to GCS<br>Retention policy for 60 days                                                                                     |
|                                                                                                      |                                                                                                                                                                      |


For their machine learning work, 

![[Screenshot 2025-07-09 at 12.21.38 PM.png]]

