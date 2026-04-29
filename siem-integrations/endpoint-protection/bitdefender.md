# Bitdefender

By integrating **Bitdefender GravityZone** with **CybrHawk** via Bitdefender’s APIs, you can ingest real-time threat alerts and security events into CybrHawk, enabling centralized monitoring and faster incident response.

This integration allows CybrHawk to query endpoint protection data, manage incidents, and initiate remediation actions such as isolating endpoints or triggering scans — enhancing endpoint visibility and threat mitigation across your environment.

***

## Prerequisites

Before proceeding, ensure your **Bitdefender GravityZone** account is properly configured with API access and the necessary permissions.

For setup guidance, refer to the official documentation:\
[➡ Using the API (Bitdefender Docs)](https://www.bitdefender.com/business/support/en/77209-85274-using-the-api.html)

***

## Step 1. Enable Event Push API in GravityZone Control Center

> **Note:** To interact with the Dashboard API, you must first obtain an API key.

1. Log in to the **GravityZone Control Center**.
2. Navigate to **My Account**.
3. In the **API Keys** section, click **Add**.
4. Select the checkbox for **Event Push Service API**.<br>
5. Click **Generate** to create the key and save the settings.

***

## Step 2. Obtain GravityZone API URL

1. Navigate to **My Account → Control Center API**.
2. Copy the **Access URL**.
   * Example: `https://cloudgz.gravityzone.bitdefender.com/api`

> **Important:** Bitdefender only provides a **Push API** for events.
>
> * Events are pushed over HTTPS from Bitdefender to your forwarder VM.
> * You will need to create a firewall rule or port forward to expose your on-premise Syslog Forwarder to the Internet.
> * We recommend using a **high TCP port above 60000** for this purpose.

***

## Step 3. Configure CybrHawk Integration

Provide the following information to your CybrHawk representative at\
📧 **support@threatdefence.com**:

* API Key
* Access URL

***
