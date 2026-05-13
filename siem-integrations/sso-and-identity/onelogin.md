# OneLogin

Cybrhawk integrates with **OneLogin** to collect authentication and identity activity logs for monitoring, threat detection, and incident response.

***

## Requirements

* Administrator access to the **OneLogin Admin Portal** (`<your_instance>.onelogin.com`)
* API credentials with read access

***

## Step 1. Create New API Credentials

1. Sign in to the **OneLogin Admin Portal**.
2. In the navigation menu, go to **Developers > API Credentials**.
3. Click **New Credential**.
4. In the _Create new API credential_ dialog, configure the following:
   * **Name** — Enter a unique, descriptive name (e.g., _Cybrhawk Integration_).
   * **Read all** — Select the checkbox.
5. Click **Done**.
6. Copy the **Client ID** and **Client Secret** values and store them securely.

***

## Step 2. Provide Credentials to Cybrhawk

Send the following details to 📧 **socv2@cybrhawk.com**:

* **Account Name** (unique, descriptive identifier for this integration)
* **Region** (your OneLogin region)
* **Client ID** (from Step 1)
* **Client Secret** (from Step 1)
* **Credential Expiry** (optional, if applicable)
