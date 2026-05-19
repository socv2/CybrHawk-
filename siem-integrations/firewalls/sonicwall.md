# SonicWall

You can configure a \*\*SonicWall® firewall to forward syslog logs to the **CybrHawk Syslog Forwarder** for security monitoring.

***

## Requirements

* A deployed and activated **CybrHawk Syslog Forwarder VM**
* Administrator access to the SonicWall firewall

***

## Step 1. Configure an Address Object for the CybrHawk Syslog Forwarder

1. Sign in to your SonicWall device with administrator permissions.
2. Navigate to:\
   **Object → Match Objects → Addresses → Address Objects**
3. Click **Add Address Object** and configure:
   * **Name** — Enter a descriptive name (e.g., CybrHawk Syslog Forwarder)
   * **Zone Assignment** — Select the appropriate zone
   * **Type** — Select **Host**
   * **IP Address** — Enter the IP address of your CybrHawk Syslog Forwarder
4. Click **Save**.

***

## Step 2. Configure Syslog Forwarding

1. In the SonicWall menu, go to:\
   **Device → Log → Syslog**
2. Open the **Syslog Servers** tab.
3. Click **+ Add** and configure:
   * **Name or IP Address** — Select the address object created in Step 1
   * **Syslog Format** — Select **Enhanced**
   * **Port** — Use the appropriate port (as per the [Syslog Onboarding Guide](../../appliances/syslog-forwarder/onboarding-syslog-data.md))
4. Click **Add**.

***

## Step 3. Enable Firewall Rule Change Logging

1. Go to:\
   **Device → Log → Settings**
2. Under the **Firewall** section, click **Security Policy**
3. Enable **GUI, Alert, Syslog, and Email** logging for:
   * **Rule Deleted**
   * **Rule Modified**
   * **Rule Added**
4. Click **Accept**

***

## Step 4. Enable SSL VPN Logging

1. Go to:\
   **Device → Log → Settings**
2. Under the **Users** category, click **Authentication Access**
3. Ensure **Syslog** is enabled for all entries
   * **Important**: Confirm that the **Successful SSL VPN User Login** (ID: 1080) has Syslog enabled
4. Click **Save**.

***

## Step 5. (Optional) Enable Configuration Auditing

1. Go to:\
   **Device → Log → Settings → Configuration Auditing**
2. For each entry, set the **Priority** column to **Warning** for:
   * **Configuration Change Succeeded**
   * **Configuration Change Failed**
   * **Chassis Settings Change**.

***

## Step 6. Provide Details to CybrHawk

Once configuration is complete, provide the following details to **CybrHawk Support** at 📧 [**CybrHawk Support**](mailto:socv2@cybrhawk.com):

* Firewall make/model and OS version
* Source IP address and used port number.
