# Cisco AMP for Endpoints

CybrHawk integrates with **Cisco AMP for Endpoints (Secure Endpoint)** to ingest security telemetry and alerts into the SIEM platform.\
This integration provides visibility into malware detections, quarantines, endpoint activity, and threat intelligence data from Cisco Secure Endpoint.

***

## Prerequisites

Before you begin, ensure the following:

* An active **Cisco AMP for Endpoints (Secure Endpoint)** subscription.
* **Console access** to Cisco Secure Endpoint (cloud-based management portal).
* **API Client Credentials** (Client ID and Client Secret) created in the Secure Endpoint console.
* A working **CybrHawk Syslog Forwarder** or API ingestion configured.

***

## Integration Steps

### Step 1 — Generate Cisco AMP API Credentials

1. Log in to the **Cisco Secure Endpoint Console**.
2. Navigate to **Management → API Credentials**.
3. Click **Create New API Credential**.
4. Select **Read & Write permissions** for:
   * **Events**
   * **Computers**
   * **Groups**
   * **Policies**
5. Save and copy the generated **Client ID** and **Client Secret** securely.

***

### Step 2 — Obtain API Endpoints

1. Go to **Management → API Credentials**.
2. Identify the **Regional API URL** assigned to your AMP tenant. Examples:
   * North America: `https://api.amp.cisco.com`
   * EU: `https://api.eu.amp.cisco.com`
   * APJC: `https://api.apjc.amp.cisco.com`
3. Copy the **Base URL** and confirm it with your CybrHawk representative.

***

### Step 3 — Provide Credentials to CybrHawk

Open a support request via the **CybrHawk Service Desk** and include:

* **Client ID**
* **Client Secret**
* **Region/Base URL**

***

## Supported Event Types

CybrHawk ingests the following Cisco AMP telemetry:

* Malware and file reputation events
* Quarantine actions
* Endpoint activity (status, agent health)
* Policy assignment and enforcement logs
* Threat intelligence correlations

***
