# WatchGuard

You can configure a **WatchGuard Firebox (Fireware OS)** to forward logs to the **CybrHawk Syslog Forwarder** for security monitoring.

***

## Requirements

* A deployed and activated **CybrHawk Syslog Forwarder VM**
* Administrator access to the WatchGuard Firebox (Fireware Web UI)

***

## Steps

### Step 1. Access Logging Settings

1. Log in to the **Fireware Web UI** with an administrator account.
2. Navigate to: **System → Logging**
3. Select the **Syslog Server** tab.
4. Check **Send log messages to these syslog servers**.

***

### Step 2. Add Syslog Server

1. Click **Add**. The _Syslog Server_ dialog opens.
2. Configure the following:
   * **IP Address** — Enter the IP address of your **CybrHawk Syslog Forwarder**
   * **Port** — Use the appropriate port (as per the [Syslog Onboarding Guide](../../appliances/syslog-forwarder/onboarding-syslog-data.md))
   * **Log Format** — Select **IBM LEEF**
   * Options — Check both boxes:
     * _Include the serial number of the device_
     * _Include the syslog header_
3. For each type of log message, set the output to the **Syslog facility**.
4. Click **OK**. The Syslog server is added to the list.
5. Click **Save**.

***

### Step 3. Verify Logging

1. Generate test traffic (e.g., VPN connect, firewall policy hit).
2. Verify events are visible in the **CybrHawk Syslog Forwarder logs**.

***

### Step 4. Provide Details to CybrHawk

Send the following details to **CybrHawk Support** at 📧 [**CybrHawk Support**](mailto:support@threatdefence.com):

* Firewall make/model and firmware version
* Source IP address and used port number.
