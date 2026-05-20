---
description: >-
  Following includes troubleshooting steps in case the sensor stops reporting to
  the console
hidden: true
---

# Troubleshooting



Reboot the sensor

Check to see if it still has outbound connectivity to the following domains at port 443 and TLS/SSL inspection has been whitelisted for vle.us.secops-apps.io and tele.threatdefence.io.&#x20;

Login to the sensor and run the following commands and capture the outputs:&#x20;

_To check outbound connectivity :_&#x20;

nc -vz  [tele.threatdefence.io](http://tele.threatdefence.io/) 443\
nc -vz [vle.us.secops-apps.io](http://vle.us.secops-apps.io/) 443

_This is to restart the siemlink services :_&#x20;

systemctl restart siemlink\
systemctl status siemlink\
systemctl restart teleport

_To check if expected traffic is being captured on the mirrored port or not :_&#x20;

sudo tcpdump -i eth1

_\*\*If you only see ARP traffic for this output, it means the mirror is not setup correctly and needs to be checked if it mirrored to the internal port of the firewall\*\*_

_Check for storage issues :_&#x20;

High volume of packets can cause the traffic to be dropped causing connectivity issues :&#x20;

increasing disk space is recommended

