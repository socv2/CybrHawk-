# Virtual Sensor

The CybrHawk NDR Sensor can be deployed as a **virtual sensor** on VMware or Hyper-V environments. This guide outlines the steps to configure and integrate the sensor into your environment.

***

## VMware Deployment

1. **Download the Open Virtualization Format (OVF)**
   * Obtain the VHD file from the link provided by CybrHawk Technical Support.
   * Download the configuration file attached to the support email.
2.  **VMware Virtual Machine Setup**

    * Create a **Generation 1 VM** in VMware.
    * Allocate **8 GB RAM** and **4 CPU cores**.
    * Configure the VM to use the downloaded OVF as its existing disk.

    **Network Interface Configuration**

    * Add **two NICs** to the VM:
      * **Management NIC**: Requires internet access (ports UDP/53 DNS, TCP/80 HTTP, TCP/443 HTTPS).
      * **Data NIC**: For mirrored traffic from your network.
3. **Mirror/SPAN Port Setup**
   * On your switch, configure a **mirror (SPAN) port** targeting the internal firewall port.
   * Connect this SPAN port to the data NIC of the virtual sensor.
4. **VMware Virtual Switch for Mirrored Traffic**
   * Create a new VMware virtual switch that includes the physical mirror port.
   * Enable **promiscuous mode**:
     * `Properties -> Security -> Promiscuous Mode -> Accept`.
5. **Virtual NICs Connection**
   * Attach the second NIC (data NIC) to the mirrored traffic switch.
   * Attach the management NIC to your standard VLAN.
6. **Initial Configuration and Access**
   * Access the VM console with the credentials provided by CybrHawk.
   * Choose DHCP or static IP configuration as required.
7. **Web Interface Configuration**
   * After reboot, open the web interface at:\
     `https://<VM_IP>:5000`
   * Upload the configuration file from step 1.
8. **Finalize Installation**
   * Notify CybrHawk Technical Support once the sensor is operational.
9. **Outbound Connectivity**

* Ensure that your virtual sensor can reach TD servers on **port 443 (HTTPS)** at the following domains:
  * `tele.threatdefence.io`
  * `vle.threatdefence.io`

***

## Hyper-V Deployment

1. **Download the Virtual Hard Disk (VHD)**
   * Obtain the VHD file and configuration file from CybrHawk Technical Support.
2.  **Create Two Hyper-V Virtual Switches**

    * Open **Virtual Switch Manager** in Hyper-V.
    * Create two **external virtual switches**, each mapped to a physical NIC:
      * One for **Management traffic**.
      * One for **SPAN/Mirror traffic**.
    * Apply changes (note: may temporarily interrupt connectivity).

    ![Create new virtual switch](<../../.gitbook/assets/1 (1).png>)

    ![External network](<../../.gitbook/assets/2 (1).png>)

    ![External network](<../../.gitbook/assets/3 (1).png>)
3.  **Hyper-V Virtual Machine Setup**

    * Create a **Generation 1 VM** in Hyper-V.
    * Allocate **8 GB RAM** and **4 CPU cores**.
    * Use the downloaded **VHD** as its disk.
    * Attach one NIC to the **Management switch** and a second NIC to the **SPAN switch**.

    ![Attach NICs](<../../.gitbook/assets/6 (1).png>)

    ![Attach NICs](<../../.gitbook/assets/7 (1).png>)
4. **Mirror/SPAN Port Setup on Switch**
   * Configure a **mirror (SPAN) port** on your switch targeting the internal firewall port.
   * Connect this to the Hyper-V host NIC used for mirrored traffic.
5.  **Enable Monitoring Mode with PowerShell**\
    Run the following commands (as admin):

    ```powershell
    $a = Get-VMSystemSwitchExtensionPortFeature -FeatureId 776e0ba7-94a1-41c8-8f28-951f524251b5
    $a.SettingData.MonitorMode = 2
    add-VMSwitchExtensionPortFeature -ExternalPort -SwitchName <Name_of_Virtual_Switch> -VMSwitchExtensionFeature $a
    ```
6. **Initial Configuration and Access**

* Log in via the console with the credentials provided.
* Configure **DHCP** or **static IP** as required.

7. **Web Interface Configuration**

* After reboot, open the web interface at:\
  `https://<VM_IP>:5000`
* Upload the configuration file from step 1.

8. **Finalize Installation**

* Notify **CybrHawk Technical Support** once operational.

***

### **With Host-Level Port Mirroring (Hyper-V Advanced Features)**

9. **Access VM Settings**

* In **Hyper-V Manager**, right-click the VM → **Settings** → **Network Adapter** → **Advanced Features**.

10. **Configure Port Mirroring**

Choose one of the following under **Port Mirroring**:

* **None**: Disabled
* **Source**: NIC acts as mirror source
* **Destination**: NIC acts as mirror destination

11. **Save and Apply**

* Click **Apply** then **OK**.
* Repeat for all NICs/VMs involved in mirroring.

12. **Outbound Connectivity**

* Ensure that your virtual sensor can reach TD servers on **port 443 (HTTPS)** at the following domains, and that SSL/TLS inspection is also disabled for them:
  * `tele.threatdefence.io`
  * `vle.threatdefence.io`

{% hint style="danger" %}
For customers using our **US** infrastructure please allow the below domain in place of vle.threatdefence.io.
{% endhint %}

* `vle.us.threatdefence.io`
