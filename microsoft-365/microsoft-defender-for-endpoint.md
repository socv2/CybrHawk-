# Microsoft Defender for Endpoint

This guide walks you through enabling Microsoft Defender API access in CybrHawk SIEM.

> **Requirements:**
>
> * Access to Microsoft 365 services (Microsoft 365 Compliance Center, Azure Active Directory)
> * **Premium P1/P2 Licensing** (CybrHawk will automatically extract available security events based on your license tier)

***

## Step 1: Grant API Permissions in Azure

### 1. Register an Application

* Create an Application ID and secret as described in the [Microsoft 365 Guide](microsoft-365.md).

![Create Application](<../.gitbook/assets/Screenshot 2026-05-13 111952 (1).png>)

### 2. Assign Windows Defender ATP Permissions

* In your application page for CybrHawk, go to **API Permissions** > **Add permission** > **APIs my organization uses**.
* Search for **WindowsDefenderATP** and select it.

![Windows Defender ATP Permissions](<../.gitbook/assets/Screenshot 2026-05-13 115657.png>)

* Select **Application Permissions** and add the following:

#### Standard Permissions

```
Alert.ReadWrite.All
Software.Read.All
Vulnerability.Read.All
SecurityRecommendation.Read.All
BrowserExtensionsInventoryByMachine
Machine.Read.All
runAntiVirusScan
```

#### Host Isolation Permissions (Optional, for host isolation via MS Defender endpoint agents)

To enable Host Isolation features, also add:

```
Machine.Isolate
```

* Click **Add Permissions**.

### 3. Grant Admin Consent

* Click **Grant admin consent for \[Your Organization]** to grant the permissions you just added.

![Grant Admin Consent](<../.gitbook/assets/Screenshot 2026-05-13 120910.png>)

***

## Step 2: Configure CybrHawk SIEM

1. Log in to your [CybrHawk SIEM Portal](https://portal.cybrhawk.com).
2. Navigate to **Deployments** > **Integrations**.
3. Click **Add** and select **Microsoft Defender API**.

***

## Need Help?

If you have any questions or need further assistance, please contact [**CybrHawk Support**](mailto:socv2@cybrhawk.com).

***
