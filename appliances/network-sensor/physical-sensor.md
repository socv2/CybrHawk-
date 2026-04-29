# Physical Sensor

Physical NDR sensors are designed for **plug-and-play functionality** straight out of the box. They only need to be connected to your network via the **management port** and assigned an IP address by your **DHCP server**. Once the sensor establishes an internet connection, it begins to inspect traffic through the data ports and sends aggregated security events to the ThreatDefence SaaS platform.

***

#### **TD NETWORK TDSP-10**

Ideal for smaller network segments with a limited number of devices. It is a **small form-factor (NUC)** sensor that is **DIN-rail mountable** and can be deployed in small enterprise networks as well as in ICS/OT environments.

**Ports:**

* 1 × Out-of-band port
* 1 × Management RJ45 port
* 3 × 1Gbe RJ45 Data ports

***

#### **TD NETWORK TDSP-1000**

A **rack-mountable (1 RU)** sensor suited for larger deployments, capable of processing large volumes of data in real time.

**Ports:**

* 1 × Out-of-band port
* 1 × Management port
* 7 × 1Gbe RJ45 Data ports
* 4 × SFP Data ports

***

### Installation Instructions

1. **Physical Setup**
   * Place the sensor securely and ensure proper ventilation.
   *   Connect the sensor to power and network.

       > **Note:** The **first port (from the left)** is designated for **management**. The remaining ports are configured for **mirroring network traffic**.
2. **Integration with ThreatDefence Platform**
   * Sensors are shipped **pre-configured**.
   * Once powered and connected, the sensor will automatically integrate with the **ThreatDefence platform**.
3. **Additional Setup**
   *   Create a **mirror/SPAN port** on your switch’s inside firewall port and connect it to a free network port.

       **Example (Cisco switch):**

       ```
       monitor session 12 source interface 1/0/1
       monitor session 12 destination interface 1/0/2
       ```
   * Ensure that your sensor can reach TD servers on **port 443 (HTTPS)** at the following domains:
     * `tele.threatdefence.io`
     * `vle.threatdefence.io`

{% hint style="danger" %}
For customers using our **US** infrastructure please allow the below domain in place of vle.threatdefence.io.
{% endhint %}

* `vle.us.threatdefence.io`
