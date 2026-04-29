# Analyze Network Intrusions

**Dashboard Location:**\
Main Menu → **Network → Network Intrusions**

The **Network Intrusions** dashboard provides visibility into inbound and internal traffic patterns, helping analysts identify suspicious behavior, intrusion attempts, and plain-text credential exposures. It allows security teams to pivot quickly between external attacks, internal traffic anomalies, and targeted investigations, giving complete visibility into attacker behaviors across the perimeter and inside the network.

***

### Identifying Attackers Targeting the Internet Perimeter

1. Open the **Network Intrusions** dashboard.
2. In the **Network Direction** pie chart, select **External Traffic**.
3. Review the **Destination Port Table** to see the number of unique attackers per port.
4. Click on a specific port to drill down into:
   * Attack origins
   * Top attacking hosts
   * Techniques used

> **Tip:** Pay close attention to privileged ports (e.g., SSH, RDP). If the traffic is expected, consider whitelisting to reduce false positives.

***

### Detecting Plain-Text Credentials on Internal Traffic

1. Open the **Network Intrusions** dashboard.
2. In the **Network Direction** pie chart, select **Inside Traffic**.
3. Use the **Destination Port Table** to identify protocols transmitting credentials in plain text.
4. Drill into a port to analyze:
   * Attack origin
   * Top attacking sources
   * Associated techniques

> **Note:** Protocols like FTP and Telnet are especially prone to transmitting credentials without encryption.

***

### Tracing Intrusions from a Specific Source IP

1. Open the **Network Intrusions** dashboard.
2. Enter a search query in the search bar, for example:

```
source.ip:192.168.10.10
```

This will filter the dashboard to display all intrusion attempts originating from that IP.
