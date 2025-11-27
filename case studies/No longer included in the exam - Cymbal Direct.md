
## Technical and Business process

![[Screenshot 2025-07-30 at 11.27.09 AM.png]]

1. Scale to handle additional demand
2. They need CI/CD
3. New features implemented as microservices in Docker Containers
4. Code Check in triggers CI/CD pipeline with auomatic etst and release
5. Code deployed by Cloud Run 

## CI/CD pipeline technologies

![[Screenshot 2025-07-30 at 11.31.36 AM.png]]
![[Screenshot 2025-07-30 at 11.32.18 AM.png]]

| Usecase                                                                        | GCP                           |
| ------------------------------------------------------------------------------ | ----------------------------- |
| Code storage and collaboration                                                 | [[G Cloud source repository]] |
| Build Docker Image                                                             | [[G Cloud Build]]             |
| Store artifacts                                                                | [[G Artifact Registry]]       |
| Trigger to start building a Docker image from PR                               |                               |
| Vulnerability Scanning                                                         |                               |
| Decide with binary authorization to figure out what secured artifact to deploy |                               |

## Reliability

1. Chaos Engineering 

2. Penetration testing 



Drones being used for delivery. 

- Global HTTP load balancing
- How to set org policies

![[Screenshot 2025-07-09 at 11.48.04 AM.png]]

## Questions

![[Screenshot 2025-07-30 at 12.29.24 PM.png]]


![[Screenshot 2025-07-30 at 12.30.59 PM.png]]

