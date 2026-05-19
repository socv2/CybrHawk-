# Cato Networks

Integrating **Cato SSE 360** with **CybrHawk** allows security events from the Cato platform to be streamed directly into CybrHawk for centralized monitoring, enrichment, and incident response. This ensures that DNS, IPS, firewall, and access activity from your Cato-managed network is correlated with other telemetry across your environment.

***

## Prerequisites

* A **Cato Management Application** account with **Administrator** role and **Editor** permissions.
* Access to create and manage API keys.

***

## Step 1. Enable the Events Feed

1. Sign in to the **Cato Management Application**.
2.  Depending on your navigation mode:

    * **Classic navigation**: go to **Administration → Event Integrations**.
    * **New navigation**: go to **Resources → Event Integrations**.

    > Tip: If the **Try New Navigation** toggle is switched on, you are using the new navigation.
3. On the **Event Integrations** page, toggle **Enable integration with Cato events** to **On**.

***

## Step 2. Disable Allowlist Event Tracking

Cato’s allowlist tracking can create a very large volume of low-value events, which are not security-relevant and can cause performance issues when queried via API.

To reduce noise:

1. In the Cato Management Application, go to **Security → IPS**.
2. Select the **Allow List** tab.
3. For each entry:
   * Open the item, clear the **Event Tracking** checkbox, and click **Apply**.
4. Save changes.

***

## Step 3. Create an API Key

1. Sign in to the **Cato Management Application**.
2. Navigate to:
   * **Classic navigation**: **Administration → API Keys**.
   * **New navigation**: **Resources → API Keys**.
3. Click **New** to generate an API key and configure:
   * **Key Name** — descriptive name (e.g., “CybrHawk Integration”).
   * **Permission** — select **View**.
   * **Allow Access From IPs** — choose **Any IP** (unless restricted by your policy).
   * **Expiry** — choose an expiry date that complies with your internal governance.
4. Save the API key and store it securely (e.g., in a password vault).

***

## Step 4. Find Your Account ID

1. While logged into the **Cato Management Application**, look at the URL in your browser.
2. Copy the **four-digit account ID** and save it with your API key.

***

## Step 5. Configure CybrHawk Integration

Provide the following details to your CybrHawk representative at [**socv2@cybrhawk.com**](mailto:socv2@cybrhawk.com):

* **Account ID**
* **API Key**

CybrHawk will configure ingestion so your Cato SSE 360 event data is automatically collected, correlated, and available for alerting and incident response.

***

## Notes

* If your API key expires or is revoked, a new one must be issued. Data collected during the downtime may be incomplete. To avoid gaps, we recommend refreshing API keys before expiry.
