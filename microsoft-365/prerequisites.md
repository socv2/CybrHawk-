# Prerequisites

The CybrHawk platform integrates with **Microsoft 365 (MS365)** to provide visibility into user activity, audit logs, and advanced security events.

We support monitoring through:

* **Microsoft Office 365 Management API** – used for standard audit log ingestion.
* **Microsoft Graph API** – used for additional data sources, including advanced security telemetry, configuration auditing, and Defender modules.

***

## Prerequisites

Before setting up MS365 integrations, ensure the following requirements are met:

### General Access

* Access to **Microsoft 365 services and features**, such as:
  * Microsoft 365 Purview (Compliance Center)
  * Microsoft Entra ID (formerly Azure Active Directory)
* **Licensing:** Any Microsoft 365 licensing tier is supported.\
  CybrHawk does **not** require E5 or P1/P2 licenses — the platform automatically adjusts based on the features available in your subscription.

### Audit Log Permissions (Office 365 Management API)

* Permissions to access and manage **audit logs**.
* Requires administrative rights in the **Microsoft 365 Admin Center**.
* Provides baseline activity data: logins, mailbox actions, Teams activity, etc.

### Microsoft Entra ID Permissions (Graph API)

* **Application Registration:** Ability to register applications in Entra ID (Global Administrator or Application Administrator role).
* **API Permissions:** Ability to grant **Microsoft Graph API** access for extended data, including:
  * Security detections and audit results (Purview, Compliance)
  * Defender XDR Endpoint and Identity telemetry
  * Cloud Apps, XDR, and DLP events

***

## Integration Modules

The following modules are available for Microsoft 365 integration with CybrHawk:

### Core Audit and Security

* [**Register CybrHawk Application**](microsoft-365.md) - Use Office 365 Management API for baseline audit log ingestion (Entra ID and Microsoft 365 application activity logs).
* [**Microsoft Graph API**](ms-graph.md) - Collect events from Purview (Compliance Center) for Microsoft detections and configuration audits, and enable user account isolation during incident response.

### Microsoft Defender Integrations via Graph API

* [**Microsoft Defender for Endpoint**](microsoft-defender-for-endpoint.md) – Endpoint detection and response telemetry.
* [**Microsoft Defender XDR**](microsoft-defender-xdr.md) – Cross-domain extended detection and response, including:
  * [**Microsoft Defender for Office 365**](microsoft-defender-xdr.md) – Email and collaboration threat protection.
  * [**Microsoft Defender for Cloud Apps**](microsoft-defender-xdr.md) – Cloud application visibility and control.
  * [**Microsoft Defender for Identity**](microsoft-defender-xdr.md) – Identity-based attack detection.
  * [**Microsoft Defender for Cloud**](microsoft-defender-xdr.md) – Cloud workload protection.
  * [**Microsoft Defender for DLP**](microsoft-defender-xdr.md) – Data loss prevention monitoring.
