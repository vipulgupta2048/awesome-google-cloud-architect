[[Core Concepts  - Tour of Google Cloud]]

1. Looking for the little details in the questions 
	1. The trick is to analyse the question as it will use certain keywords to point you to what the scenario is trying to achieve. If a question discusses analytics and storing data you wouldn't select Cloud SQL, although doable, its not the best service for analytics offered by GCP.
	2. Look out for any words that say, manually, one by one, or anything that symbolises that this option won't be scalable. That's automatically the incorrect option. Google Cloud is always looking to be scalable. 
		1. Prioritize - if they are prioritizing the wrong thing, its incorrect
		2. If they are unsure or not clear, incorrect option.
		3. if they monitor, a one time action answer is incorrect. Make sure to create a pipeline
	3. OLAP - Online analytics processing - Bigquery
	4. OTAP - Online transactions processing - Cloud SQL, Spanner
2. Don't panic if you don't know a component in an answer, watch and use every single work in each of the other options and questions to formulate the best answer. 

3. Do every practice exam you can find before the test, several questions are repeated.

4. Of all the answers, look for the two that are the most similar. There correct one is likely to be one of those two ✅
	1. Sometimes, though, you'll find two pairs of similar answers. Look closely at the question and identify the core issue and you should be able to eliminate one of the pairs and then you get back to 50/50.
    
5. Leave the questions that require you to select 2 out of 5 till the end unless you're absolutely sure. These questions take more time.
    
6. Questions that ask about the fastest way to migrate on premise to cloud with minimal rewrite are always App Engine
	1. Standard mode - Efficient, Cost Effective when high availability and elasticity concerns and teams want minimize infra mgmt. Google manages all the infrastructure, patching, load balancing, and scaling in the background. It also provides instance-level isolation, fast startup times, and built-in monitoring and logging integrations
	2. Flexible: DO IT YOURSELF. longer startup times, higher costs, and less aggressive autoscaling
    
7. Multiple interconnects > single > VPN. For more details look at the interconnects documentation on GCP. You'll get a good run down of the options and differences.
	1. [[Virtual Private Cloud Networking#Dedicated interconnect]]
    
8. Data questions usually are BigQuery for analytics, Cloud SQL for regular databases or migrations and Firebase/Cloudstore for rapid application dev.
9. ✔ In case of any IAM-related questions, you should always consider the principle of least privilege access while answering it.
10. ✔ You should always use Cloud-native services instead of the open-source or third party unless the GCP service doesn't satisfy the requirements. e.g In the case of Infrastructure as a Code service, you should select Deployment Manager instead of Terraform.
11. 

I would also recommend going through this amazing [playlist](https://www.youtube.com/watch?v=iNJe_NrbijM&list=PLQMsfKRZZviTIxEh0pkWNwnDUasGVZS4n) by [Sathish VJ](https://medium.com/u/ba857441758a?source=post_page---user_mention--eb602449a05f---------------------------------------)  in which he gave a neat explanation of questions based on these case studies and more.

4. **Sample questions**

To get a sense of the types of questions you can expect on the exam, it is advisable to review the [official sample questions](https://docs.google.com/forms/d/e/1FAIpQLSf54f7FbtSJcXUY6-DUHfBG31jZ3pujgb8-a5io_9biJsNpqg/viewform) provided by Google Cloud. This will give you an idea of the format and style of the questions and help you gauge your understanding of the material.

**5. GCP Cheatsheet:**

No GCP certification preparation is completed without the amazing cheatsheet by [Ammett W](https://medium.com/u/9e5f2fd8a569?source=post_page---user_mention--eb602449a05f---------------------------------------)

Here’s the [link](https://drive.google.com/file/d/1_UfKnzxodTTk5CuwT0ScSmXegtmgpV5v/view) to it along with [Priyanka Vergadia](https://medium.com/u/9b9e67983b04?source=post_page---user_mention--eb602449a05f---------------------------------------) ’s [Sketch Notes](https://thecloudgirl.dev/sketchnote.html) on GCP. [GitHub - priyankavergadia/GCPSketchnote: If you are looking to become a Google Cloud Engineer , then you are at the right place. GCPSketchnote is series where I share Google Cloud concepts...](https://github.com/priyankavergadia/GCPSketchnote)

![[Tips & Tricks.pdf]]


1. Uptime checks can only check external IP addressses.
2. Quotas are based on number of resource, like CPUs not budget 
3. CloudSQL backups take time and you need to account for that in your DR, if short on time, manually switch to your replica
4. Pub/Sub to trigger Cloud Functions is recommended. 
5. Calculate uptime in SLOs and read questions carefully
6. Canary deployments are phased rollouts with only a couple of users getting an update. Google recommends releases smaller changes frequently with modern CI/CD, integrated testing.
7. Cloud Profiler determins which functions in the code are taking up the most resources. 
8. 