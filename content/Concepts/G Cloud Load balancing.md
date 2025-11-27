
Fully distributed, software defined mnaaged services to do load balancing

![[Screenshot 2025-09-22 at 1.58.39 AM.png]]
Two types, application 

![[Screenshot 2025-07-15 at 2.46.22 PM.png]]

And, Network passthrough and proxy

![[Screenshot 2025-07-15 at 3.51.15 PM.png]]

![[Screenshot 2025-07-15 at 3.51.07 PM.png]]



**

# Load Balancers & Auto scaling

- IPv6 termination only supported by
    

- HTTP(s) Load Balancer
    
- SSL Proxy Load Balancer
    
- TCP Proxy
    

## Which one to choose?

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXelznevLW2tigvv7NZm0oI8Lat1d3Y0_B4eXu05pO5lQ6VCf5ND2MUznoDsbiBG4_JFuWc8STQ84c86uTmOq6l--7zpV4t_A4YOkx-Ca2PT1Ih5w03SMHV8Z08B2Ez_stsvJ_lLEgiAvE0yHgVYF4y7h8Jc?key=uQNqTlKuawktw3rK2EaKBA)

  

### Application load balancer

- You need HTTPS traffic
    

### Network Load Balancer

- To implement TLS offload, TCP proxy, or support for external load balancing to backends in multiple regions.
    
- Passthrough Network Load Balancer to preserve client source IP addresses, avoid the overhead of proxies, and to support additional protocols like UDP, ESP, and ICMP.
    

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXe4FGG-tmAB0sGo89aPkbGWJqRMrncu0gRTRqrdKbnebl9jacWcy6sUbhKK5tMjbWP2cwn9-4vslmxq3Cuhgoqp_tajXwVTn9iJG0hFC3CrTJeABIYU3kRAZfbtLzB149KHbnBjeDQOvmWdkYYazGGhjZ4?key=uQNqTlKuawktw3rK2EaKBA)

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXexfXxBZ92oBG8PANNxF_Pz8lskaU24nM3CYC7cRLI6IEMPw_HTAHs3VBNBFg8g58nf-aqqqRZZnLHV3t2Oy0Lri30I2VYn8IUM2rR4utaUVXXYDK8jnrdbIalinfYCom2YvAxzk5QZZS1t6AlxcNyooKe8?key=uQNqTlKuawktw3rK2EaKBA)

## SSL Proxy Load Balancing

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfOZhshwpokd6oBc1ujEgtyQ8OPZyjYdkp34ftTbZboQJgnilWHt7ae8CwCeyHE7MmRZdl0UmGgtTONV7KEWfWmyS3BmpsDktHBvk43imbPtFxDNUAc8g2mAFtT4WZ5a4dIKwuDSVxa4lN6gh5Fv01m6das?key=uQNqTlKuawktw3rK2EaKBA)

## TCP proxy load balancing

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfTJZtSUnlOdWsTUYPqE6638stRXBn0LD7tcIMnc_HIfMJhKaixuTDuhe0_0bvhxhnZrAg3bVGOl77Dejf_SkaB-i7QpaYEfBJZ0ZaNujoLNqhBsSbuTBI_3vfYY-89KvScrPtt2sKUXfYFUg-qnVwX-9mF?key=uQNqTlKuawktw3rK2EaKBA)

## Network load balancing

- ## Use it to load balance UDP traffic and to load balance TCP and SSL
    

- ![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXf0H0Aa4DXqHYnIqTX_MLqmzbtVg6GVTwGQlWbW5Y_7oS7ScvBqPb976HUT_zJMVGX8KQB0F6DNWF0_huGdfJjIHop_cvPlNFN8nf8C6RpqAoy6xWKaI5nY0xkXY0LHPyrf8bDcw2_azzJ_HmkX1N2eyaYz?key=uQNqTlKuawktw3rK2EaKBA)
    
- ![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeqfAEfHEXfjV0kr0aErq0lo0bX4gsQK1OakaSLqVeNZ0stYZVTNSNyDlotiphrAR1hbPJnaQ24rEbIpObeZhJ1O42AXaUDgjLmZIAKOJhIzTAXyNUyqTtNvejk7pf2b6i5a6RZIlnxhhIWC8SndprTko0?key=uQNqTlKuawktw3rK2EaKBA)
    

## Internal Load Balancer

- TCP/UDP traffic
    
- Use cases
    

- Traditional three-tier web services
    
- Benefit of this three-tier model is that neither the data-based tier nor the application tier is exposed externally
    

- ![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfDI008Pg1EX86h2qluEkxG_fkdBu-CDEqHISg4vvmUduqkGAorhqAdwAMRIcnX0W7Bm2oMbnwsUBeltf4ZIXkfnlbwC_bTgeFlH_em7STqXA8ZEZTkejHXzxdt_uz-ynEQiF5mF-pqXc0aarWO-QRsowmk?key=uQNqTlKuawktw3rK2EaKBA)![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXcwi2zlf_NfpOChrn5vkSDnG7letM7vODjFCCl7WlfaIRP_0Ze5lbzfOILq09JFgoJaFvjhsH0zjUwFriCv4wenpmyAEZJd3qH_ALQU1HLsfBhAlihc15eU1SHDVJEmTqKBsgNJ6TyzFiM2ovCtXOJgYhDR?key=uQNqTlKuawktw3rK2EaKBA)
    

**















## Setup a Load Balancer


gcloud compute instance-templates create nginx-challenge \
   --region=europe-west4-a \
   --network=default \
   --subnet=default \
   --tags=allow-health-check \
   --machine-type=e2-medium \
   --image-family=debian-11 \
   --image-project=debian-cloud \
   --metadata=startup-script='#! /bin/bash
apt-get update
apt-get install -y nginx
service nginx start
sed -i -- 's/nginx/Google Cloud Platform - '"\$HOSTNAME"'/' /var/www/html/index.nginx-debian.html'


gcloud compute instance-groups managed create nginx-group \
   --template=nginx-challenge --size=2 --zone=europe-west4-a


gcloud compute firewall-rules create grant-tcp-rule-403 \
  --network=default \
  --action=allow \
  --direction=ingress \
  --source-ranges=130.211.0.0/22,35.191.0.0/16 \
  --target-tags=allow-health-check \
  --rules=tcp:80



gcloud compute backend-services create nginx-service \
  --protocol=HTTP \
  --port-name=http \
  --health-checks=http-basic-check \
  --global


gcloud compute backend-services add-backend nginx-service \
  --instance-group=nginx-group \
  --instance-group-zone=europe-west4-a \
  --global

gcloud compute url-maps create nginx-map \
    --default-service nginx-service

gcloud compute target-http-proxies create http-lb-proxy \
    --url-map nginx-map

gcloud compute addresses create lb-ipv4-1 \
  --ip-version=IPV4 \
  --global

gcloud compute forwarding-rules create nginx-challenge-rule \
   --address=lb-ipv4-1\
   --global \
   --target-http-proxy=http-lb-proxy \
   --ports=80


## Claude 

I'll provide you with the complete gcloud commands for setting up an HTTP load balancer with a managed instance group running nginx web servers. Here are the commands for each step:

## 1. Create an Instance Template

```bash
gcloud compute instance-templates create nginx-template \
    --machine-type=e2-medium \
    --image-family=debian-11 \
    --image-project=debian-cloud \
    --boot-disk-size=10GB \
    --boot-disk-type=pd-standard \
    --tags=http-server \
    --metadata=startup-script='#!/bin/bash
apt-get update
apt-get install -y nginx
systemctl start nginx
systemctl enable nginx
echo "<h1>Hello from $(hostname)</h1>" > /var/www/html/index.html'
```

## 2. Create a Managed Instance Group

```bash
gcloud compute instance-groups managed create nginx-group \
    --template=nginx-template \
    --size=2 \
    --zone=us-central1-a
```

## 3. Create a Firewall Rule

```bash
gcloud compute firewall-rules create grant-tcp-rule-403 \
    --allow=tcp:80 \
    --source-ranges=0.0.0.0/0 \
    --target-tags=http-server
```

## 4. Create a Health Check

```bash
gcloud compute health-checks create http nginx-health-check \
    --port=80 \
    --request-path=/
```

## 5. Create Named Port for Instance Group

```bash
gcloud compute instance-groups managed set-named-ports nginx-group \
    --named-ports=http:80 \
    --zone=us-central1-a
```

## 6. Create a Backend Service

```bash
gcloud compute backend-services create nginx-backend-service \
    --protocol=HTTP \
    --health-checks=nginx-health-check \
    --global
```

## 7. Add Instance Group to Backend Service

```bash
gcloud compute backend-services add-backend nginx-backend-service \
    --instance-group=nginx-group \
    --instance-group-zone=us-central1-a \
    --global
```

## 8. Create a URL Map

```bash
gcloud compute url-maps create nginx-url-map \
    --default-service=nginx-backend-service
```

## 9. Create a Target HTTP Proxy

```bash
gcloud compute target-http-proxies create nginx-http-proxy \
    --url-map=nginx-url-map
```

## 10. Create a Global Forwarding Rule

```bash
gcloud compute forwarding-rules create nginx-forwarding-rule \
    --global \
    --target-http-proxy=nginx-http-proxy \
    --ports=80
```

## Verification Commands

After waiting 5-7 minutes for the setup to complete, you can verify the setup with:

```bash
# Get the external IP address
gcloud compute forwarding-rules describe nginx-forwarding-rule --global

# Check instance group status
gcloud compute instance-groups managed describe nginx-group --zone=us-central1-a

# List instances in the group
gcloud compute instance-groups managed list-instances nginx-group --zone=us-central1-a
```

## Notes:

- The instance template creates a **global** template with **e2-medium** machine type as specified
- The managed instance group is created with **2 instances** running nginx web servers
- The firewall rule is named exactly as requested: `grant-tcp-rule-403`
- The setup includes all components needed for HTTP load balancing
- The startup script installs nginx and creates a simple HTML page showing the hostname
- Wait 5-7 minutes after running all commands before checking progress

You can test the load balancer by accessing the external IP address obtained from the forwarding rule description command.
