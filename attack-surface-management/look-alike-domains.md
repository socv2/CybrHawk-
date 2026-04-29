# Look-Alike Domains

## Overview

ThreatDefence Look-Alike Domain Monitoring detects and tracks domains that closely resemble your organization’s legitimate domains. These may be registered by threat actors to impersonate your brand, conduct phishing campaigns, or trick users into sharing sensitive information. Monitoring these registrations enables early detection and response before they are weaponized.

***

## How It Works

* **Domain Monitoring**\
  Continuously monitors domain registration feeds, WHOIS records, and DNS data for new domains similar to your protected root domains.
* **Similarity Detection**\
  Uses multiple techniques to detect variations, including:
  * Typo-squatting (e.g., `examp1e.com` vs `example.com`)
  * Homoglyph attacks (e.g., `exampIe.com` using a capital “i” instead of “l\`)
  * Additional prefixes or suffixes (e.g., `secure-example.com`)
  * Different top-level domains (e.g., `.net`, `.org`, `.co`)
* **Risk Enrichment**\
  Each look-alike domain is checked against:
  * Hosting and DNS infrastructure.
  * SSL/TLS certificates.
  * Threat intelligence feeds (malware, phishing).
* **SOC Correlation**\
  Detected look-alike domains are ingested into the ThreatDefence platform and correlated with alerts (e.g., email phishing, web traffic) for prioritization and escalation.

***

## How to Activate Look-Alike Domain Monitoring

To enable monitoring, provide your ThreatDefence representative with:

* Your official corporate domains to protect.
* Any critical brand names, trademarks, or product names.

ThreatDefence will configure continuous monitoring and alerting for suspicious registrations.

***

## Look-Alike Domain Reports

Look-alike findings are available in the **Analyst Console**, including:

* Full list of detected suspicious domains.
* Risk classification (benign, suspicious, confirmed malicious).
* Hosting and DNS details.
* Historical tracking of domain status (active, parked, redirected).
* Exportable reports for governance, legal, and brand protection teams.
