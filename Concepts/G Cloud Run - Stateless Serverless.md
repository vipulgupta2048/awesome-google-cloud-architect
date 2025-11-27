
> [!NOTE] Definition
> A Cloud Run function is a piece of code that runs in response to an event, such as an HTTP request, a message from a messaging service, or a file upload. 
> Triggers can be changes to data in a database, files added to a storage system, or a new virtual machine instance being created.

Cloud Run functions are event-driven, they only run when something happens. 
This makes them a good choice for tasks that need to be done quickly or that don't need to be running all the time.

![[Screenshot 2025-07-23 at 12.30.58 PM.png]]

For example, you can use a Cloud Run function to:

- automatically generate thumbnails for images that are uploaded to Cloud Storage.
- send a notification to a user's phone when a new message is received in Pub/Sub.
- process data from a Cloud Firestore database and generate a report.

## Steps to do Cloud run

1. Write code like a server 
2. Package it into a container 
3. Deploy it on a container/artifact registry
4. Cloud run starts the container on demand (a trigger) and ensures all incoming requests are handled dynamically adding and removing container.


![[cloudrun.pdf]]



## Service Execution Environments - Where will the system begin?

### First Generations

The first generation execution environment features fast [cold start](https://cloud.google.com/run/docs/tips/general?authuser=1#using_minimum_instances_to_reduce_cold_starts) times and emulation of most, but not all operating system calls. Originally, this was the only execution environment available to services in Cloud Run.

You should use first generation if any of the following apply:

- Your Cloud Run service has bursty traffic, and needs to scale out fast to many instances, or your service is sensitive to cold start times.
- Your Cloud Run service has infrequent traffic that causes frequent scale out from zero.
- You want to use less than 512 MiB of memory.
- 
### Second Generation

The second generation execution environment provides full Linux compatibility rather than system call emulation. This execution environment provides:

- Faster CPU performance. The second generation execution environment requires at least 512 MiB of memory.
- Faster network performance, especially in the presence of packet loss
- Full Linux compatibility, including support for all system calls, namespaces, and cgroups
- Network file system support

**Important:** Cloud Run jobs automatically use the second generation execution environment, and this cannot be changed for jobs. You should use second generation if any of the following apply to your Cloud Run service:

- Your service needs to use NFS, which is only supported by second generation.
- Your service has fairly steady traffic and is tolerant of somewhat slower cold starts.
- Your service has CPU-intensive workloads.
- Your service could benefit from faster network performance.
- Your service needs to use software that has issues running in first generation due to [unimplemented system calls](https://cloud.google.com/run/docs/troubleshooting?authuser=1#openblas-warning).
- Your service needs Linux cgroup functionality.
- Your service makes use of third-party infrastructure for securing containers.

Although the second generation execution environment generally performs faster under sustained load, it has longer [cold start times](https://cloud.google.com/run/docs/tips/general?authuser=1#starting_services_quickly) than first generation for some services.


## CLI Commands 

Deploy a clodu run 

```
gcloud functions deploy nodejs-pubsub-function \
  --gen2 \
  --runtime=nodejs20 \
  --region=us-west1 \
  --source=. \
  --entry-point=helloPubSub \
  --trigger-topic cf-demo \
  --stage-bucket qwiklabs-gcp-04-c651579a9811-bucket \
  --service-account cloudfunctionsa@qwiklabs-gcp-04-c651579a9811.iam.gserviceaccount.com \
  --allow-unauthenticated
```


View the logs

gcloud functions logs read nodejs-pubsub-function \
  --region=us-west1 




