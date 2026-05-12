# Audit Logs

CybrHawk's GCP Pub/Sub integration enables you to forward GCP audit logs and other security-relevant logs to CybrHawk for monitoring, incident response, and compliance. This guide provides step-by-step instructions to configure Google Cloud Pub/Sub, set up logging sinks, and export the required credentials.

***

## Prerequisites

Before you begin, ensure you have the following:

* A Google Cloud project with **Billing enabled**
* Permissions:
  * `roles/pubsub.admin` (manage topics and subscriptions)
  * `roles/logging.admin` (manage logging sinks)
  * `roles/iam.serviceAccountAdmin` (manage service accounts)
  * `roles/iam.serviceAccountKeyAdmin` (download service account keys)
  * `roles/pubsub.subscriber` (for the CybrHawk service account on the subscription)
  * `roles/pubsub.publisher` (for the logging sink service account on the topic)
* [Google Cloud CLI](https://cloud.google.com/sdk/docs/install) (`gcloud`) installed
* The ID of the project to host the Pub/Sub topic and subscription (`LOGGING_PROJECT_ID`)
* (Optional) Organization ID for organization-level logging sinks
* You are authenticated with `gcloud auth login` and have set the correct project using `gcloud config set project LOGGING_PROJECT_ID`

{% hint style="info" %}
Keep naming consistent with your existing environment.

* Use your existing service domains.
* Enter tenant names in lowercase.
* Reuse existing URLs instead of creating new ones.
{% endhint %}

***

## Step 1: Create a GCP Pub/Sub Topic

The Pub/Sub topic will receive logs from Cloud Logging.

**In the Google Cloud Console:**

1. Open the [Pub/Sub console](https://console.cloud.google.com/cloudpubsub).
2. Click **Create Topic**.
3. Enter a **Topic ID** and **Description**.
4. Click **Create Topic**.

## Step 2: Create a Pub/Sub Subscription

CybrHawk will pull messages from a subscription. In every project from which you want to send logs, create a subscription to the topic created in Step 1.

**In the Google Cloud Console:**

1. Go to **Pub/Sub** → **Subscriptions**.
2. Click **Create Subscription**.
3. Select the topic you created (e.g., `cybrhawk-logs-topic`).
4. Set **Delivery type** to **Pull**.
5. Click **Create**.

## Step 3: Create Log Router Sinks to Forward Logs

To send logs to the Pub/Sub topic, create a logging sink. You can create sinks at the organization level (to capture logs from all projects) or at the project level (for a specific project).

**In the Google Cloud Console:**

1. Go to **Logging** → **Logs Router**.
2. Click **Create Sink**.
3. Enter a **Sink name** and **Description**.
4. Under **Sink Destination**, select **Pub/Sub topic** and choose the topic created in Step 1.
   * If configuring in a different project or organization, provide the full resource name: `projects/LOGGING_PROJECT_ID/topics/cybrhawk-logs-topic`.

## Step 4: Export Service Account Key

The service account created by the logging sink is used to publish logs to Pub/Sub. CybrHawk requires a separate service account key to authenticate and pull messages from the subscription.

> **Security Note:** Keep the downloaded JSON key file secure. Only provide it to your CybrHawk contact. If the key is ever exposed, revoke it and generate a new one.

**In the Google Cloud Console:**

1. Go to **IAM & Admin** → **Service Accounts**.
2. Create a new service account for CybrHawk, or use an existing one (e.g., `cybrhawk-pubsub@LOGGING_PROJECT_ID.iam.gserviceaccount.com`).
3. Ensure this service account has the **Pub/Sub Subscriber** role (`roles/pubsub.subscriber`) on the subscription you created earlier.
   * If not, click on the user, go to the **Permissions** tab, click **Manage access**, and add the role.
4. Click on the service account.
5. Go to the **Keys** tab.
6. Click **Add Key** → **Create new key**.
7. Select **JSON** and click **Create**.
8. A JSON file will be downloaded. This file is needed to configure the Pub/Sub integration in CybrHawk. Provide it to your CybrHawk contact.

***

## Log Filters

For each filter below, replace `ORGANIZATION_ID` with your actual organization ID.

If configuring a project-level sink, replace `organizations/ORGANIZATION_ID` with `projects/PROJECT_ID`.

Each filter can be used individually or combined using `OR` to create a comprehensive logging sink.

### Cloud Audit Logs

```
logName=(
  "organizations/ORGANIZATION_ID/logs/cloudaudit.googleapis.com%2Factivity"
  OR
  "organizations/ORGANIZATION_ID/logs/cloudaudit.googleapis.com%2Fdata_access"
  OR
  "organizations/ORGANIZATION_ID/logs/cloudaudit.googleapis.com%2Fsystem_event"
  OR
  "organizations/ORGANIZATION_ID/logs/cloudaudit.googleapis.com%2Fpolicy"
  OR
  "organizations/ORGANIZATION_ID/logs/cloudaudit.googleapis.com%2Faccess_transparency"
)
```

### Networking & Infrastructure

```
logName="organizations/ORGANIZATION_ID/logs/dns.googleapis.com%2Fdns_queries"
```

### Security Findings

```
logName="organizations/ORGANIZATION_ID/logs/securitycenter.googleapis.com%2Ffindings"
```

### VPC Flow Logs

```
logName="organizations/ORGANIZATION_ID/logs/compute.googleapis.com%2Fvpc_flows"
```

### Firewall Logs

```
logName="organizations/ORGANIZATION_ID/logs/compute.googleapis.com%2Ffirewall"
```

### Secrets Manager Access

```
logName="organizations/ORGANIZATION_ID/logs/secretmanager.googleapis.com%2Faccess"
```

### Cloud Run Logs

```
logName="organizations/ORGANIZATION_ID/logs/cloud-run.googleapis.com%2Frequest_log"
```

```
logName="organizations/ORGANIZATION_ID/logs/cloud-run.googleapis.com%2Fcontainer"
```
