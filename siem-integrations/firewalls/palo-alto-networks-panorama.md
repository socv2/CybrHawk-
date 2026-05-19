# Palo Alto Networks Panorama

You can configure a Palo Alto Networks Panorama platform to forward security logs to the CybrHawk platform for centralized monitoring, detection, and response.

***

#### Requirements

* Access to Panorama with administrator permissions
* A reachable CybrHawk Syslog Collector
* Network access from Panorama to the collector

***

#### Step 1: Create a Syslog Server Profile

1. Sign in to Panorama with administrative credentials.
2. Navigate to Panorama → Server Profiles → Syslog.
3. Click Add and provide the following details:
   1. Name: td-syslog (or another meaningful identifier)
   2. Under the Servers tab, click Add and configure:
   3. Name: CybrHawk Collector
   4. Syslog Server: IP address or FQDN of your CybrHawk collector
   5. Transport: UDP\
      Port: 60000+ (as support to allocate a port number)
   6. Format: BSD (default)\
      Facility: LOG\_USER (default)
4. Click OK to save the configuration.\
   <br>

***

#### Step 2: Configure Log Forwarding via Collector Group

1. In Panorama, go to Panorama → Collector Groups.\
   Open the collector group that receives logs from your managed firewalls.
2. Select the Collector Log Forwarding tab.
   1. Add a new log forwarding configuration for each relevant log type:
3. System, Configuration, HIP Match, Correlation, Data, Threat, Auth, URL, and GlobalProtect (if applicable).
4. For each log type:
   1. Click Add.
   2. Provide a Name and set the filter to All Logs.\
      Under the Forward Method, select Syslog and choose the server profile created in Step 1.
   3. Save the configuration.
5. Confirm that forwarding is enabled for all required log types.
6. Commit the changes in Panorama to apply the configuration to the managed firewalls.\
   <br>

***

#### Step 3: Provide Details to CybrHawk

Once configuration is complete, provide the following details to CybrHawk Support at 📧 [CybrHawk Support](mailto:support@threatdefence.com):

* Source IP address and used port number.

<br>
