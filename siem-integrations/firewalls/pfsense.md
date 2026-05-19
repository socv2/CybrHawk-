# pfSense

You can configure a **pfSense® firewall** to forward syslog logs to the **CybrHawk Syslog Forwarder** for security monitoring.

***

## Requirements

* A deployed and activated **CybrHawk Syslog Forwarder VM**
* Administrator access to the pfSense firewall

***

## Steps

### Step 1. Access pfSense Syslog Settings

1. Sign in to your pfSense WebGUI with administrator permissions.
2. Navigate to:\
   **Status → System Logs → Settings**

***

### Step 2. Configure Remote Syslog Server

1. In the **Remote Syslog Servers** section, add your CybrHawk Syslog Forwarder:
   * **IP Address** — Enter the IP address of your CybrHawk Syslog Forwarder
   * **Port** — Use the appropriate port (as per the [Syslog Onboarding Guide](../../appliances/syslog-forwarder/onboarding-syslog-data.md))
   * **Transport** — Select **UDP**
2. Under **System Events to Send to Syslog**, enable:
   * **Firewall Events**
   * **System Events**
   * **VPN Events** (if applicable)
   * **DHCP/DNS Events** (if applicable)
3. Click **Save**

***

***

## Step 4. Provide Details to CybrHawk

Once configuration is complete, provide the following details to **CybrHawk Support** at 📧 [**CybrHawk Support**](mailto:socv2@cybrhawk.com):

* Firewall make/model and pfSense version
* Source IP address and used port number.
