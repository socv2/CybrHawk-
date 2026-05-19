# Abnormal Security

Integrating **Abnormal Security** with **CybrHawk** allows you to ingest advanced email security telemetry—including phishing detections, business email compromise (BEC) alerts, and behavioral anomaly signals—directly into CybrHawk. This ensures that identity and email-based threats are correlated with other security data for end-to-end monitoring and incident response.

***

## Step 1. Obtain API Credentials and Configure IP Safelist

1. Sign in to the **Abnormal Portal**.
2. Navigate to **Settings → Integrations**.
3. Locate the **Abnormal REST API integration** and click **+ Connect**.
4. Copy and save the **Access Token** securely (e.g., in a password vault). You will provide this to CybrHawk later.
5. In the **IP Safelist** field, add the CybrHawk SOC collector IP address ranges.

> **Note:** Your CybrHawk representative will provide the correct IP addresses to safelist.

***

## Step 2. Provide Credentials to CybrHawk

Send the following details to your CybrHawk representative at [**socv2@cybrhawk.com**](mailto:socv2@cybrhawk.com):

* **Access Token** (from Step 1)
* **Host** — based on your region:
  * **US:** `api.abnormalplatform.com`
  * **EU:** `eu.rest.abnormalsecurity.com`
* **Credential Expiry** — (optional) if your token has an expiration date.

CybrHawk will configure ingestion so that Abnormal Security event data is collected and correlated within the CybrHawk SecOps platform.

***
