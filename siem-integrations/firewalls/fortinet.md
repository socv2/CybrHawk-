# Fortinet FortiGate

The ThreatDefence platform integrates with **Fortinet® FortiGate®** by forwarding syslog to the **ThreatDefence Syslog Forwarder VM**. This enables SOC monitoring of traffic, policy events, and threat activity.

***

## Requirements

* Deployed and reachable **ThreatDefence Syslog Forwarder VM**
* Admin access to FortiGate (CLI or Web UI)
* SSH/console access for CLI configuration (preferred)

***

## Step 1 — Configure Syslog Forwarding (CLI — Preferred)

1. Connect to the FortiGate via SSH or console and sign in as an administrator.
2. Run the following commands (replace `<syslog_forwarder_ip>` with your TD Syslog Forwarder IP):

```
    config log syslogd setting  
      set status enable  
      set server <syslog_forwarder_ip>  
      set mode udp  
      set port 60000  
      set format default  
    end
```

> **Important:** Keep the format as **default** (do **not** use CEF), otherwise parsing issues will occur.
>
> **Note:** The support person assigned will provide you with the required destination port.

***

## Step 1 (Alternative) — Configure via Web UI

1. Sign in to the FortiGate Web UI.
2. Go to **Log & Report → Log Settings** (Global Settings).
3. Set:
   * **Event Logging:** `All`
   * **Local Traffic Logging:** `All`
   * **Syslog Logging:** `Enable`
   * **IP address/FQDN:** _ThreatDefence Syslog Forwarder VM IP_
4. Click **Apply**.

> **Note:** Do not switch the logging format to CEF.

***

## Step 2 — Register the Log Source with ThreatDefence

After forwarding is enabled, raise a request with ThreatDefence Support so we can activate and normalize the Fortinet source:

* **Service Desk Ticket**
  * **Category:** `Onboarding`
  * **Sub-category:** `Syslog Log Sources`
  * **Include:**
    * FortiGate **source IP** sending syslog
    * **Model & firmware** version (e.g., FG-100F, v7.2.x)
    * Confirmation that syslog to the **forwarder IP:514/UDP** is enabled

***

## Verification

ThreatDefence SOC will confirm that Fortinet logs are:

* Ingested by the Syslog Forwarder
* Parsed and normalized correctly
* Visible in dashboards for monitoring and detections

> If needed, we’ll advise on tuning (e.g., additional event types, traffic logging scope, or multiple tenants/sources).
