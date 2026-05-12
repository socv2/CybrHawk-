# Threat Containment

Containment (Isolation) actions are performed to limit the spread of an incident and reduce potential impact while investigation and remediation are underway. It can also be applied where controls are ineffective, such as internet-exposed SSH, where failed attempts will be blacklisted. CybrHawk supports multiple forms of isolation depending on the nature of the threat.

***

> **Note:** Isolation actions are applied by CybrHawk SOC personnel as part of the Incident Response process. While every effort is made to validate malicious activity before initiating isolation, false positives are possible. Customers may **opt out** of automatic isolation by completing the opt-out section provided in their onboarding documentation.

***

## Endpoint Isolation

**Purpose**\
Remotely isolate an affected endpoint (workstation, server, or virtual machine) from the network while maintaining secure management access for forensic investigation.

This prevents lateral movement and data exfiltration, while still allowing the CybrHawk team to carry out analysis and remediation tasks.

**Pre-requisites**

* TD Agent installed (latest version).

**How It Works**

* A SOC analyst or automation enforces network isolation via the TD Agent.
* The endpoint is restricted to communicate only with the CybrHawk SOC.
* All other network connections are blocked until the endpoint is cleared and released from isolation.

***

## Account Isolation (Microsoft 365)

**Purpose**\
Disable or restrict compromised or suspicious Microsoft 365 accounts to prevent misuse.

This stops further logins and blocks access to collaboration tools (e.g., Exchange, Teams, SharePoint, OneDrive) until the account is secured.

**Pre-requisites**

* Active Microsoft Graph API integration between CybrHawk and Microsoft 365.

**How It Works**

* A SOC analyst or automation disables the affected account via Microsoft Graph.
* The account is immediately restricted from logging in or accessing Microsoft 365 services.
* Once remediation is complete, the account can be safely re-enabled under customer approval.

***

Here is a polished and professional version of your text.

***

## **Other Isolation Types**

**Purpose**\
To remotely isolate any asset within the environment. Our isolation workflow integrates with existing security and infrastructure systems, such as firewalls, content filters, SaaS, and PaaS platforms, to enforce isolation, provided the necessary permissions and access are in place. Custom isolation workflows can be developed on demand to meet specific requirements.

**Prerequisites**\
Connectivity to the target system through a supported management interface (e.g., EDR console, firewall, network switch, or cloud control plane).

**How It Works**\
Isolation can be initiated manually by a SOC analyst or triggered automatically by the platform. The system sends the appropriate isolation commands, such as blocking network traffic, revoking access, or disabling user sessions, through integrated tools to contain the threat.

***
