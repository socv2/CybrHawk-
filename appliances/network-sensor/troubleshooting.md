# Troubleshooting

### During deployment

Use these checks if the sensor does not report to the console during deployment.

#### If the sensor only reports DHCP logs

The mirror on the switch is not set up correctly.

Check that the monitoring interface, or second NIC, is connected to a core switch port that mirrors the uplink port.

#### If the sensor only shows ARP traffic on `eth1`

The port mirroring or ERSPAN is not set up correctly to send unicast traffic.

Log in to the sensor with SSH and run:

```bash
tcpdump -i eth1
```

### After deployment

Use these steps if the sensor stops reporting to the console.

{% stepper %}
{% step %}
### Reboot the sensor

Reboot the sensor first.

If the sensor still does not report, continue with the checks below.
{% endstep %}

{% step %}
### Verify outbound connectivity

Confirm the sensor can reach these domains on `TCP/443`:

* `tele.cybrhawk.io`
* `vle.us.secops-apps.io`

Make sure SSL/TLS inspection is disabled or bypassed for both domains.

Run these commands and capture the output:

```bash
nc -vz tele.cybrhawk.io 443
nc -vz vle.us.secops-apps.io 443
```
{% endstep %}

{% step %}
### Restart the sensor services

Run:

```bash
systemctl restart siemlink.service
systemctl restart teleport
```
{% endstep %}

{% step %}
### Confirm mirrored traffic is present

Run:

```bash
sudo tcpdump -i eth1
```

If you only see ARP traffic, the mirror or SPAN port is not configured correctly.

Check that the mirror points to the internal firewall port.
{% endstep %}

{% step %}
### Check storage capacity

High packet volume can fill storage and cause packet drops.

If storage is low, increase disk space on the sensor.
{% endstep %}

{% step %}
### Contact support

If the issue persists, contact [socv2@cybrhawk.com](mailto:socv2@cybrhawk.com).

Include screenshots or command output for:

* `systemctl restart siemlink.service`
* `systemctl restart teleport`
* `ip a`
* `ip -br a`
* `ping 1.1.1.1`
{% endstep %}
{% endstepper %}
