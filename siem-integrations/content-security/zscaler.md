# Zscaler

ThreatDefence integrates with **Zscaler Internet Access (ZIA)** and **Zscaler Private Access (ZPA)** platforms to ingest logs related to web traffic, application access, and content security enforcement.

Logs provide visibility into user activity, blocked traffic, policy enforcement, and threat prevention events.

***

## Integration Method

Zscaler logs are forwarded to ThreatDefence via **Syslog**.\
For configuration, please follow the [Onboarding Syslog Data Guide](../../appliances/syslog-forwarder/onboarding-syslog-data.md).

***

## Prerequisites

* Administrative access to the Zscaler portal.
* TD Syslog forwarder deployed in your environment.
* Outbound connectivity from the forwarder to ThreatDefence platform.

***

## Next Steps

1. Configure Zscaler to forward logs via syslog to your ThreatDefence Syslog Forwarder VM.
2. Ensure correct port mapping (60000+ per source).
3. Submit a request to [**support@threatdefence.com**](mailto:support@threatdefence.com) with:
   * Log source IP(s)
   * Device type (ZIA or ZPA)

ThreatDefence will validate parsing and enable dashboards for Zscaler logs.

***
