# Barracuda

You can configure a **Barracuda Firewall** to forward logs to the **CybrHawk Syslog Forwarder** for security monitoring.

***

## Requirements

* A deployed and activated **CybrHawk Syslog Forwarder VM**
* Administrator access to the Barracuda Firewall (Full Configuration mode)

***

## Steps

### Step 1. Enable Syslog Service

1. Navigate to **CONFIGURATION > Full Configuration > Box > Infrastructure Services > Syslog Streaming**.
2. Click **Lock**.
3. Set **Enable Syslog Streaming** to **Yes**.
4. Click **Send Changes and Activate**.

***

### Step 2. Configure Logdata Filters

1. Go to **Syslog Streaming > Logdata Filters**.
2. Switch to **Advanced View** (Configuration Mode).
3. Click **Lock**.
4. Add a new filter entry (**+**).
5. Enter a descriptive name and click **OK**.
6. Under **Affected Box Logdata**, configure **Data Selection**:
   * Add a new group with a descriptive name.
   * Select the following items:
     * **Auth-All, Config-All, Control-All, Event-All, Firewall-Activity-Only, Firewall-Threat-Only, Network-All, Settings-All, SSH-All, System-All, Watchdog-All**
   * Under **Message Types**, select:
     * **Panic, Security, Fatal, Error, Warning, Notice**
7. Click **OK**, then **Send Changes and Activate**.

***

### Step 3. Configure Logstream Destination

1. Go to **Syslog Streaming > Logstream Destinations**.
2. Switch to **Advanced View**.
3. Click **Lock**.
4. Add a new destination entry (**+**).
5. Enter a descriptive name (e.g., `CybrHawk Syslog`).
6. In the destination settings:
   * Select **Explicit IP**.
   * Set **Destination IP Address** to your **CybrHawk Syslog Forwarder IP**.
   * Set **Port** to **60,000+** (as per the [Syslog Onboarding Guide](../../appliances/syslog-forwarder/onboarding-syslog-data.md)).
   * Set **Transmission Mode** to **UDP**.
7. Click **OK**, then **Send Changes and Activate**.

***

### Step 4. Configure Logdata Streams

1. Go to **Syslog Streaming > Logdata Streams**.
2. Switch to **Advanced View**.
3. Click **Lock**.
4. Add a new stream entry (**+**).
5. Enter a descriptive name (e.g., `CybrHawk Log Stream`).
6. Configure the stream:
   * **Active Streams** → Yes
   * **Log Destinations** → Select the destination created earlier
   * **Log Filters** → Select the filter created earlier
7. Click **Send Changes and Activate**.

***

### Step 5. Provide Details to CybrHawk

Once configuration is complete, provide the following details to **CybrHawk Support** at 📧 [**socv2@cybrhawk.com**](mailto:socv2@cybrhawk.com):

* Firewall make/model and OS version
* Source IP address and used port number
