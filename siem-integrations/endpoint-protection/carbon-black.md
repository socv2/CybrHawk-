# VMware Carbon Black

CybrHawk integrates with **VMware Carbon Black Cloud** to collect alerts and endpoint telemetry for continuous monitoring and threat detection.

***

## Integration Steps

### Step 1 — Create a Custom Access Level

1. Sign in to the **VMware Carbon Black Cloud Console**.
2. Navigate to **Settings → API Access**.
3. On the **Access Levels** tab, click **Add Access Level**.
4. Configure:
   * **Name**: e.g., `CybrHawk Carbon Black`
   * **Description**: e.g., `Access level for CybrHawk SIEM integration`
   * **Permissions**:
     * In the **Alerts** row → **General Information** → set **READ**

> Note: Selecting this automatically sets the "Copy permissions from" field to **Custom**.

5. Click **Save**.

***

### Step 2 — Create an API Key

1. Go to **Settings → API Access → API Keys tab**.
2. Click **Add API Key**.
3. Configure:
   * **Name**: e.g., `CybrHawk API`
   * **Access Level type**: `Custom`
   * **Custom Access Level**: select the one created in **Step 1**
4. Save the key and record the following securely:
   * **API ID**
   * **API Secret Key**
   * **ORG Key**
   * **ORG ID**
   * **Hostname / Base API URL**

> These credentials will be used by CybrHawk to establish secure API-based collection.

***

### Step 3 — Provide Credentials to CybrHawk

Open a support request via the **CybrHawk Service Desk** and include:

* API ID
* API Secret Key
* ORG Key
* ORG ID
* Hostname (API URL)

Once provided, CybrHawk will:

* Validate API connectivity.
* Onboard Carbon Black telemetry into your SIEM view.
* Confirm ingestion of alerts and endpoint activity logs.

***
