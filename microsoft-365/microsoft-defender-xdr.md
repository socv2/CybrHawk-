# Microsoft Defender XDR

ThreatDefence supports integration with **Microsoft Defender XDR** to provide advanced incident and alert visibility across Microsoft 365 workloads.\
This integration builds on top of the standard [Microsoft 365 integration](microsoft-365.md) and requires additional API permissions.

***

## Requirements

* A Microsoft account with **administrator permissions**.
* A Microsoft licensing plan that includes **Defender XDR**.\
  See: [Microsoft Defender XDR prerequisites](https://learn.microsoft.com/en-us/defender-xdr/prerequisites).

***

## Step 1: Register Application (Microsoft 365 Integration)

Before enabling Defender XDR, ensure the standard [Microsoft 365 integration](microsoft-365.md) is completed:

* The ThreatDefence application must be registered in Microsoft Entra ID.
* Defender XDR uses the same application, with **additional permissions** configured.

***

## Step 2: Configure API Permissions

1. Sign in to the **Microsoft Entra admin center**.
2. In the navigation menu, go to **Manage > API permissions**.
3. Click **+ Add a permission**.
4. In the **Request API permissions** pane:
   * Select the **Microsoft APIs** tab.
   * Choose **Microsoft Threat Protection**.
   * Select **Application permissions**.
   * Enable the following permissions:
     * `Incidents.Read.All`
5. Click **Add permissions**.
6. Return to the **Configured permissions** section, and click:
   * **Grant admin consent for**
   * Confirm with **Yes**.

***

## Step 3: Enable App Governance (Optional)

As part of Defender XDR ingestion, ThreatDefence can also collect logs from **App Governance**, which tracks and enforces policies for OAuth-enabled applications in Entra ID.

### Prerequisites

* Microsoft Defender for Cloud Apps (standalone or bundled in your plan).
* Appropriate administrator role in Microsoft 365.
* See Microsoft docs: [Turn on app governance for Defender for Cloud Apps](https://learn.microsoft.com/en-us/defender-cloud-apps/app-governance-get-started).

### Steps

1. Sign in to the **Microsoft Defender portal**.
2. Go to **System > Settings > Cloud apps > App governance**.
3. Click **Turn on app governance**.

***
