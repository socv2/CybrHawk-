# Palo Alto Networks

You can configure a **Palo Alto Firewall** to forward logs to the **ThreatDefence Syslog Forwarder** for security monitoring.

***

## Requirements

* A deployed and activated **ThreatDefence Syslog Forwarder VM**
* Administrator access to the Palo Alto Firewall

***

## Steps

### Step 1. Configure a Syslog Server Profile

1. In the Palo Alto Console, go to **Device > Server Profiles > Syslog**.
2. Click **Add** and enter a name for the profile (e.g., `ThreatDefence-SIEM`).

***

### Step 2. Add a Syslog Server to the Profile

1. In the Syslog Server Profile, click **Add**.
2. Configure the following settings:
   * **Name** — Enter a descriptive name
   * **Syslog Server** — Enter the IP or FQDN of the **ThreatDefence Syslog Forwarder**
   * **Transport** — UDP
   * **Port** (as per the [Syslog Onboarding Guide](../../appliances/syslog-forwarder/onboarding-syslog-data.md))
   * **Format** — IETF
   * **Facility** — LOG\_USER (default)
3. Click **OK** to save the server profile.

***

### Step 3. Configure Syslog Forwarding (Traffic, Threat, Wildfire, URL, Data, Tunnel, Authentication Logs)

1. From the Palo Alto Console, go to **Objects > Log Forwarding**.
2. Click **Add** and enter a name for the Log Forwarding Profile.
   * Use `default` if you want this profile applied to all new rules/zones.
3. For each Severity and Wildfire Verdict, select the **Syslog Server Profile** created above in the **Syslog** column.
4. Click **OK** to save.

***

### Step 4. Assign Syslog Forwarding Profile to Security Policy

1. Go to **Policies > Security**.
2. For each rule:
   * Click the rule name.
   * Go to the **Actions** tab.
   * Enable **Log at Session End**.
   * Under **Log Setting > Log Forwarding**, choose the Syslog Forwarding Profile created earlier.

***

### Step 5. Configure Syslog Forwarding for System, Config, Correlation, GlobalProtect, HIP Match, and User-ID Logs

1. From the Palo Alto Console, go to **Device > Log Settings**.
2. For **System** and **Correlation** logs:
   * Select each Severity level → Syslog Server Profile created earlier → **OK**.
3. For **Config, HIP Match, and Correlation logs**:
   * Edit each section → Select the Syslog Server Profile → **OK**.

***

### Step 6. Commit Changes

1. Click **Commit** to push configuration changes.

***

### Step 7. Provide Details to ThreatDefence

Once configuration is complete, provide the following details to **ThreatDefence Support** at 📧 [**support@threatdefence.com**](mailto:support@threatdefence.com):

* Firewall make/model and OS version
* Source IP address and used port number
