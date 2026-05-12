# External ASM

## Overview

CybrHawk External Attack Surface Management (ASM) provides continuous discovery and monitoring of your organization’s internet-facing domains, subdomains and servcies. ASM identifies exposed services, certificates, and web applications that may be vulnerable to exploitation. Results are ingested into the platform and correlated with SOC workflows to reduce blind spots, highlight risks, and support proactive remediation.

***

## How It Works

* **Domain & Subdomain Discovery**\
  CybrHawk continuously scans root domains and enumerates associated subdomains.\
  Detects shadow IT, forgotten assets, and newly registered lookalike domains.
* **Exposure Detection**\
  Identifies active services, SSL/TLS certificates, application fingerprints, and misconfigurations.\
  Flags expired certificates, deprecated protocols, and exposed admin panels.
* **Continuous Monitoring**\
  Monitoring runs on a scheduled basis (daily) to track changes to the organization’s external footprint.\
  Newly discovered or modified subdomains are automatically flagged.
* **Risk Context**\
  Findings are enriched with vulnerability intelligence and threat data.\
  High-risk exposures (e.g., open databases, misconfigured login portals) are prioritized in SOC workflows.
* **Correlation with SOC Events**\
  If a monitored domain or subdomain generates security alerts, correlation rules link it to ASM findings for immediate visibility and faster response.

***

## How to Activate ASM

To enable ASM, contact your CybrHawk representative with:

* A list of domains to be monitored.

CybrHawk will configure monitoring and begin continuous discovery.

***

## ASM Reports

All ASM findings are available in the **Analyst Console**, including:

* Current domain and subdomain inventory.
* Newly discovered or modified subdomains.
* Risk classification and exposure details.
* Historical trends and footprint growth.
