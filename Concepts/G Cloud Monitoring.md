
Monitoring done through open-source tools. 

Google Cloud Operations Suite (formerly Stackdriver) is a comprehensive suite of tools for monitoring, logging, debugging, and tracing cloud infrastructure and applications. It provides real-time insights into performance, availability, and error tracking across Google Cloud environments.

- Monitoring:
    - Monitors system performance and resource utilization.
    - Automatically detects when infrastructure should scale up or down based on usage patterns.
- Logging:
    - Aggregates logs from multiple sources and provides powerful filtering and querying capabilities.
    - Ideal for debugging specific components across multiple hosts.
- Alerts:
    - Automatically sends notifications when errors or predefined conditions are encountered.
    - Helps ensure system reliability by proactively addressing issues.
- Error Reporting:
    - Collects and displays errors produced by applications running in Google Cloud.
    - Automatically groups similar errors and provides insights for faster resolution.
- **Trace** is designed to analyze the latency and performance of applications, but does not offer alerting or error grouping functionalities. 
- **Debug** assists in examining application behavior but does not provide automated error notifications or grouping.
- **Uptime Checks** only monitor the availability of services but do not provide error grouping or detailed error analysis
- **Metrics Explorer** is primarily a tool for visualizing and exploring metrics data


## Aggregated sinks

Aggregated sinks in Google Cloud allow logs from multiple resources—such as folders or an organization—to be centrally routed for storage and analysis.

There are two types of aggregated sinks:

- **Non-intercepting sinks** forward logs to child resources while maintaining visibility within their original locations. This ensures that logs remain accessible both at their source and in a central destination.
- **Intercepting sinks** prevent logs from being forwarded through child resources, except for _Required sinks. This reduces redundant storage and is particularly useful for high-volume logs, such as Data Access audit logs. When enabled at the folder level, an intercepting sink ensures that logs are routed to a central project for analysis while blocking unnecessary duplication. Additionally, logs intercepted at this level do not contribute to log-based metrics or alerting policies within child resources but remain visible in the Log Router page of those resources.

Non-intercepting aggregated sinks allow log entries to be routed within or across organizations and folders to various destinations for storage and analysis.

These destinations include:

- **Cloud Logging bucket** – Stores logs centrally, supporting multiple Google Cloud projects. Upgrading to **Log Analytics** enables integration with **BigQuery Studio** and **Looker Studio** for queries.
- **BigQuery dataset** – Provides structured storage for big data analysis. However, linked BigQuery datasets are **read-only** and cannot serve as sink destinations.
- **Cloud Storage bucket** – Stores logs as JSON files, offering long-term retention across projects.
- **Pub/Sub topic** – Supports third-party integrations (e.g., Splunk, Datadog) by formatting logs as JSON for real-time processing.
- **Google Cloud project** – Routes logs to another project, where sinks in the destination project manage them.


> [!NOTE] Title
> the correct answer is: **Create an aggregated log sink at the folder level in Cloud Logging. Configure the sink to route the logs to a Cloud Storage bucket in the dedicated monitoring project.** It allows logs from multiple critical services to be centralized in one location, meeting the organization’s compliance and monitoring standards. Cloud Storage is a suitable destination for log storage and compliance monitoring, and setting up the log sink at the folder level ensures only relevant logs are captured from the critical services.
