---
description: Troubleshooting steps for a sensor that stops reporting to the console
hidden: true
---

# Troubleshooting

Use these steps if the sensor stops reporting to the console.

***

### 1. Reboot the sensor

Reboot the sensor first.

If the sensor still does not report, continue with the checks below.

***

### 2. Verify outbound connectivity

Confirm the sensor can reach these domains on `TCP/443`:

* `tele.threatdefence.io`
* `vle.us.secops-apps.io`

Make sure SSL/TLS inspection is disabled or bypassed for both domains.

Run these commands on the sensor and capture the output:

```bash
nc -vz tele.threatdefence.io 443
nc -vz vle.us.secops-apps.io 443
```

***

### 3. Restart the sensor services

Run these commands:

```bash
systemctl restart siemlink.service
systemctl restart teleport
```

***

### 4. Confirm mirrored traffic is present

Run this command:

```bash
sudo tcpdump -i eth1
```

If you only see ARP traffic, the mirror or SPAN port is not configured correctly.

Check that the mirror points to the internal firewall port.

***

### 5. Check storage capacity

High packet volume can fill storage and cause packet drops.

If storage is low, increase disk space on the sensor.

***

### 6. Contact support

If the issue persists, contact [socv2@cybrhawk.com](mailto:socv2@cybrhawk.com).

Include screenshots or command output for:

```bash
systemctl restart siemlink.service
systemctl restart teleport
ip a
ip -br a
ping 1.1.1.1
```
