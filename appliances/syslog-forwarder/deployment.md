# Deployment

The **CybrHawk-SYSLOG-VM** is a virtual collector appliance provided by CybrHawk. It securely forwards system logs to the CybrHawk platform over TLS.

***

## VMware / OVF Deployment

1. **Obtain OVF**\
   Request the OVF package from CybrHawk Technical Support.
2. **Initial Login**\
   Log in to the VM console using the **provided credentials**.
3. **Configure Networking**\
   Follow the prompts to choose **static IP** or **DHCP**.
4. **Access Web Interface**\
   After reboot, open the web interface at:\
   `https://<VM_IP>:5000`
5. **Upload Configuration File**\
   Upload the configuration file provided by CybrHawk Support.
6. **Confirm Onboarding**\
   Notify CybrHawk once the VM is operational to begin log onboarding.

***

## Hyper-V Deployment

1. **Obtain VHD**\
   Request the VHD image from CybrHawk Technical Support.
2. **Create VM**
   * Set up as a **Generation 1 VM** in Hyper-V.
   * Assign **4 vCPUs** and **4 GB RAM**.
   * Attach the provided VHDX file as the existing disk.
3. **Initial Login**\
   Log in to the VM console using the **provided credentials**.
4. **Configure Networking**\
   Follow the prompts to choose **static IP** or **DHCP**.
5. **Access Web Interface**\
   After reboot, open the web interface at:\
   `https://<VM_IP>:5000`
6. **Upload Configuration File**\
   Upload the configuration file provided by CybrHawk Support.
7. **Confirm Onboarding**\
   Notify CybrHawk once the VM is operational to begin log onboarding.

***
