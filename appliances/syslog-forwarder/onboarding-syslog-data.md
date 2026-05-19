# Onboarding Syslog Data

Once your **Syslog Forwarder VM** is deployed and configured, it is ready to accept syslog log sources.

***

## Sending Syslog Data

* Each log source should be configured to send syslog traffic to the **forwarder’s IP address**.
* Syslog ports are allocated starting from **60,000**.

Examples:

* Log Source 1 → Port **60,000**
* Log Source 2 → Port **60,001**
* Log Source 3 → Port **60,002**

This approach ensures each onboarded device uses a unique port for separation and management.

***

## Request Activation with CybrHawk Support

After configuring your devices to send logs, raise a request with CybrHawk Support so the sources can be activated in our backend.

**Steps to Raise a Ticket**:

1. Provide the following details to socv2@cybrhawk.com:
   * **Source IP address** of the device sending logs.
   * **Make/Model** of the data source (e.g., Cisco ASA, Palo Alto firewall, Fortinet, etc.).

CybrHawk SOC will validate the request and enable the log source for ingestion into the platform.

***

Once enabled, events will be visible in the CybrHawk Analyst Console and can be correlated with existing detections and dashboards.
