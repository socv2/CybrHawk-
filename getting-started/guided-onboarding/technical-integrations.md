# Technical Integrations

Following the Discovery Meeting, the next step in onboarding is the technical enablement of log and telemetry sources. This phase ensures ThreatDefence has the visibility required to deliver effective monitoring, detection, and response.

The shared objective is to achieve at least 80% coverage across your environment, focusing on critical assets, identity systems, cloud platforms, and endpoints.

Why Coverage Matters:

* Reduce blind spots – attackers thrive where monitoring is weak; coverage closes those gaps.
* Improve detection accuracy – more context allows AI models and analysts to separate true threats from noise.
* Accelerate investigations – correlated data enables rapid reconstruction of attack chains and timelines.

***

## 1. Data Source Inventory

We work with your team to identify and prioritize sources across:

* Cloud and SaaS – Microsoft 365, Salesforce, AWS CloudTrail, Azure Activity Logs, Google Workspace
* Network Infrastructure – firewalls, VPNs, proxies, routers, and switches
* Endpoints and Servers – Windows Event Logs, Linux/Mac logs, EDR/AV telemetry
* Identity and Access – Active Directory, Azure AD, MFA, SSO/IAM platforms
* Applications and Databases – web servers, databases, and custom application logs

## 2. Integration Methods

ThreatDefence supports multiple integration approaches to suit your environment:

* Syslog (TCP/UDP, TLS)
* API-based ingestion (RESTful APIs, cloud connectors)
* Agent-based collection (lightweight endpoint agents)
* Native cloud integrations (AWS S3, Azure Event Hubs)

## 3. Validation and Confirmation

Once sources are integrated, ThreatDefence engineers:

* Verify data fidelity, timeliness, and volume
* Confirm parsing, normalization, and enrichment
* Validate dashboards, detections, and alert routing
