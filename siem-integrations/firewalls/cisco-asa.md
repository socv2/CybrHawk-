# Cisco ASA

You can configure a **Cisco ASA firewall** to forward logs to the **ThreatDefence Syslog Forwarder** for security monitoring.

***

## Requirements

* A deployed and activated **ThreatDefence Syslog Forwarder VM**
* Administrator access to the Cisco ASA (CLI or ASDM)

***

## Steps

### Step 1. Configure Syslog Settings (CLI)

1. Connect to the Cisco ASA using SSH or console.
2. Enter global configuration mode:

```
configure terminal
```

3. Configure the syslog server:

```
logging host <interface_name> <TD_SYSLOG_FORWARDER_IP> <port>
logging trap informational
logging enable
```

Replace:

* `<interface_name>` with the ASA interface used to reach the Syslog Forwarder (e.g., inside, outside, mgmt).
* `<TD_SYSLOG_FORWARDER_IP>` with the IP of your **ThreatDefence Syslog Forwarder**.
* `<port>` with the appropriate port (as per the [Syslog Onboarding Guide](../../appliances/syslog-forwarder/onboarding-syslog-data.md)).

***

### Step 2. Verify Syslog Output

1. Generate test traffic (e.g., VPN login, denied connection).
2. Verify logs are reaching the **ThreatDefence Syslog Forwarder**.

***

### Step 3. Provide Details to ThreatDefence

Once configuration is complete, provide the following details to **ThreatDefence Support** at 📧 [**support@threatdefence.com**](mailto:support@threatdefence.com):

* Firewall make/model and ASA version
* Source IP address and used port number.
