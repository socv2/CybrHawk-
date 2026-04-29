# Review Vulnerabilities

## Overview

The **Vulnerability Scanning Overview** dashboard provides visibility into vulnerabilities detected across external assets. It highlights top vulnerabilities by severity, risks by business units, vulnerable hosts, CVE age, and critical remediation options.

This enables security teams to:

* Prioritize patching of high-risk vulnerabilities.
* Track remediation effectiveness over time.
* Monitor scan trends across the organization.

***

## Events Tracked

The dashboard provides the following insights:

* **Assets Scanned** – Total number of scanned external assets.
* **Unique Risks** – Count of unique vulnerabilities detected.
* **Top Vulnerabilities by Severity** – Vulnerabilities grouped into Critical, High, Medium, and Low categories, including their CVSS scores.
* **Vulnerabilities Over Time** – Trendline of vulnerabilities detected across scans.
* **CVE Insights** – Breakdown of vulnerabilities based on CVEs.
* **Most Vulnerable Hosts** – Hosts with the highest risk scores.
* **Business Units at Risk** – Risk distribution across organizational units.
* **External Hosts Scanned** – List of IPs, hostnames, and scan timestamps.
* **Vulnerability Scanner Feed** – Detailed log feed showing vulnerabilities, risk scores, remediation guidance, and scan context.

***

## Key Fields

Important fields used when investigating vulnerability events:

* **`destination.ip`** – IP address of the affected asset.\
  \&#xNAN;_Example_: `10.10.10.10`
* **`vulnerability.plugin_name`** – Name of the detected vulnerability or plugin.\
  \&#xNAN;_Example_: `"Report outdated / end-of-life Scan Engine / Environment (local)"`
* **`vulnerability.cvss.score`** – CVSS risk score assigned to the vulnerability.\
  \&#xNAN;_Example_: `10.0`
* **`vulnerability.plugin_output`** – Detailed output or version information for the vulnerability.\
  \&#xNAN;_Example_: `Version of installed component: 21.4.4`
* **`event.ingested`** – Timestamp of when the vulnerability was ingested.\
  \&#xNAN;_Example_: `2024-12-17T16:52:05.159Z`
* **`vulnerability.risk_score_name`** – Descriptive severity label.\
  \&#xNAN;_Example_: `Critical`
* **`vulnerability.task_name`** – Task under which the scan was executed.\
  \&#xNAN;_Example_: `external`
* **`vulnerability.CVEs`** – CVE identifiers linked to the issue.\
  \&#xNAN;_Example_: `CVE-2023-12345`
* **`vulnerability.risk_score`** – Numerical risk score assigned to the issue.\
  \&#xNAN;_Example_: `10.0`
* **`vulnerability.scan_name`** – Name of the vulnerability scan that detected the issue.\
  \&#xNAN;_Example_: `demo-external-scan - (2024-12-17 07:30 AM)`
* **`vulnerability.affected_software`** – List of impacted software or components.\
  \&#xNAN;_Example_: `The TCP/IP v4 stack of Microsoft Windows, Cisco, and Juniper Networks.`
* **`vulnerability.category`** – Category of the detected vulnerability.\
  \&#xNAN;_Example_: `VendorFix`

***

## Dashboard Access

* **Dashboard**: _Vulnerability Scanning Overview_
* **Description**: Provides insights into detected vulnerabilities, their severity, and critical remediation actions.

**Access from Menu**:

1. Go to the **Dashboards** section in the left-hand menu.
2. Expand the **INTEL** submenu.
3. Select **Vulnerability Scanning Overview**.

This dashboard provides centralized visibility into external vulnerabilities, enabling better prioritization and faster remediation.
