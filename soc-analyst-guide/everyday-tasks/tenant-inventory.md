# Review Tenant Inventory

## Overview

Every tenant within the CybrHawk SecOps platform relies on a set of onboarded **data sources** to provide security visibility. These data sources feed logs and telemetry into the platform, enabling monitoring, detection, and incident response. They can originate from **CybrHawk native sensors**, **cloud and SaaS integrations**, or **third-party tools via API and syslog**.

The **Tenant Inventory** view offers a consolidated picture of which sources are active for a tenant (or across multiple tenants for an MSP). This helps security teams confirm coverage, validate integrations, and identify gaps before they impact detection.

***

## CybrHawk Native Data Sources

CybrHawk provides its own instrumentation for capturing critical security events:

* **Endpoint Agent**\
  The CybrHawk Agent collects operating system event logs and telemetry, runs automated hunting checks, and performs compliance scanning.\
  Supporting indices include:
  * `hids` for system and security event logs
  * `hunter` for endpoint hunting checks
  * `agentinventory` for agent deployment status
  * `sca` for security compliance assessments
* **Network Detection and Response (NDR) Sensor**\
  Deployed within the network, the NDR sensor provides visibility into traffic flows and applies intrusion detection rules.\
  Data is separated into:
  * `network-sensor` for general flow and protocol visibility
  * `network-ids` for IDS signatures and detections
* **Specialised Feeds**
  * `darkweb` — captures exposed credentials from dark web monitoring
  * `vulnerability` — records results from scheduled vulnerability scans

These native sources form the foundation of coverage, ensuring CybrHawk can monitor both endpoint and network activity directly.

***

## Cloud and SaaS Integrations

Modern enterprises rely heavily on cloud services, so the platform supports direct ingestion from major providers:

* **Microsoft 365 (o365)** — Audit logs, authentication events, Defender alerts, and app activity.
* **O365 Machine Learning (o365-ml)** — Automatically flags anomalies such as unusual geographies or first-time-seen behaviors.
* **Azure EventHub** — Broad ingestion from Azure cloud services.
* **Google Workspace (G-Suite)** — User and admin activity across Gmail, Drive, and Workspace applications.

These integrations ensure identity, collaboration, and SaaS data flows are monitored alongside on-premises events.

***

## Third-Party Security Tools

The platform also ingests events from other commercial security solutions, giving analysts a single place to work:

* **API Integrations**\
  CybrHawk connects to EDR, AV, and IAM solutions such as CrowdStrike, SentinelOne, and BitDefender, pulling telemetry and detection logs through APIs.
* **Syslog Integrations**\
  Firewalls, secure web gateways, VPN concentrators, and other infrastructure devices can forward logs via standard syslog. These feeds expand visibility across the perimeter and internal network.

***

## Data Storage and Access

All onboarded data sources are recorded as JSON documents within the **`td-inventory`** index.\
This index maintains the definitive record of active sources and can be queried directly for validation, troubleshooting, or audit purposes.

***

## Tenant Inventory Dashboard

The **Tenant Inventory** dashboard in the Analyst Console provides a graphical, real-time view of onboarded data sources.\
From this dashboard, SOC analysts can:

* Verify that log sources are flowing as expected
* Spot missing or inactive integrations before they cause blind spots
* Track coverage across multiple tenants for compliance and assurance

By maintaining an accurate view of onboarded sources, security teams can ensure CybrHawk delivers maximum visibility and reliable detections.
