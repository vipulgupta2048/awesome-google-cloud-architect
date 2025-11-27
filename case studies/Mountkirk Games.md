

| Usecase                                                         | GCP                                                                                                     |
| --------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| Geo specifc digital arena from multiple platforms and locations | CDN, multicluster ingress, and Load Balancers                                                           |
| real-time global leader board                                   | they want to use Multi-region spanner cluster                                                           |
| BUT can we use CloudSQL for that                                | No, Cloud SQL is a zonal entity and it isn't useful.                                                    |
| Game backend                                                    | [[G Kubernetes Engine]]                                                                                 |
| Rapid iteration                                                 | CI/CD                                                                                                   |
| Minimize latency                                                | Memorystore, Cloud Storage, CDN                                                                         |
| Dyanmic Scaling                                                 | GKE, Cloud Spanner,                                                                                     |
| Minimize Costs                                                  | Lifecycle policies, bigquery expiration, dynamic scaling, spot instances for nodes in GKE Standard mode |
| Support legacy games to new platform                            | Anthos                                                                                                  |
|                                                                 |                                                                                                         |

## Analytics Usecase

![[Screenshot 2025-07-30 at 12.21.26 PM.png]]

## Full Solution

![[Screenshot 2025-07-30 at 12.22.10 PM.png]]


## Questions from MountKirk Games

![[Screenshot 2025-07-30 at 12.26.05 PM.png]]

![[Screenshot 2025-07-30 at 12.27.38 PM.png]]

