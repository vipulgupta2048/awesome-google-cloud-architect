
A pub/sub is a messaging service where the senders of messages are decoupled from the receivers of messages. When a message is sent or posted, a subscription is required for a receiver to be alerted and receive the message. To learn more about pub/subs, in Pub/Sub Guides, see [Pub/Sub: A Google-Scale Messaging Service](https://cloud.google.com/pubsub/architecture)

![](https://www.whizlabs.com/blog/wp-content/uploads/2021/11/Pub-Sub.png)

Pub/Sub is a messaging service for exchanging event data among applications and services. A producer of data publishes messages to a Pub/Sub topic. A consumer creates a subscription to that topic. Subscribers either pull messages from a subscription or are configured as webhooks for push subscriptions. Every subscriber must acknowledge each message within a configurable window of time.

There are three terms in Pub/Sub that appear often: `topics`, `publishing`, and `subscribing`.

- A `topic` is a shared string that allows applications to connect with one another through a common thread.
    
- Publishers push (or `publish`) a message to a Cloud Pub/Sub topic.
    
- Subscribers make a "`subscription`" to a topic where they will either pull messages from the subscription or configure webhooks for push subscriptions. Every subscriber must acknowledge each message within a configurable window of time.
    

To sum it up, a producer publishes messages to a topic and a consumer creates a subscription to a topic to receive messages from it.

## Topics 
gcloud pubsub topics create Test2
gcloud pubsub topics delete Test2
gcloud pubsub topics list

## Subscription

gcloud  pubsub subscriptions create --topic myTopic mySubscription
gcloud pubsub subscriptions delete Test2
gcloud pubsub topics list-subscriptions myTopic

![[Screenshot 2025-08-30 at 7.56.00 PM.png]]


## Commands

Publish messages

gcloud pubsub topics publish cf-demo --message="Cloud Function Gen2"


View messages from subscriptions 

gcloud pubsub subscriptions pull --auto-ack MySub