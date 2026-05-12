# ESET EDR

The CybrHawk platform supports integration with **ESET PROTECT** and **ESET Inspect Cloud** to ingest endpoint detection and response telemetry.\
Logs collected from ESET provide visibility into malware detections, suspicious activities, and endpoint risk events.

The platform supports integration using a syslog interface or with **ESET Connect,** an API gateway between a client and a collection of ESET backend services of the following modules: ESET PROTECT (Cloud), ESET Inspect, and ESET Cloud Office Security.

***

## Syslog Setup

***

## Prerequisites

* Access to the **ESET PROTECT Hub** with **Superuser** permissions.
* A CybrHawk syslog appliance or VM.

***

## Steps

### Step 1. Syslog Configuration

* Format of Payload: CEF
* Format of envelope-BSD (Syslog)
* Event types to log—Select the type of logs you want to include (Antivirus, HIPS, Firewall, Web protection, Audit Log, Blocked files, ESET Inspect alerts, Incidents).
* Destination IP (this should be the IP address of your CybrHawk appliance).

***

### Step 2. Reach out to CybrHawk support

Once configuration is complete, provide the following details to **CybrHawk Support** at 📧 [**socv2@cybrhawk.com**](mailto:socv2@cybrhawk.com):

* Request to enable ESET EDR syslog listener on your CybrHawk appliance
* Source IP address

***

## API Setup with ESET Connect

***

## Prerequisites

* Access to the **ESET PROTECT Hub** with **Superuser** permissions.

***

## Requirements and limitations <a href="#s-requirements-and-limitations" id="s-requirements-and-limitations"></a>

* Only the Root or Superuser can create a user with access to API endpoints.
* API access rights cannot be granted to the ESET Business Account Superuser, ESET MSP Administrator 2 Root user, and ESET PROTECT Hub Superuser accounts.

***

## Steps

### Step 1. Create an API User Account

* We recommend creating a dedicated API user to separate your regular account from API activities.
* Follow this [guide](https://help.eset.com/eset_connect/en-US/create_api_user_account.html) and create the API user account.
* Visit ESET online help [page](https://help.eset.com/eset_connect/en-US/index.html) for more information.

***

### Step 2. Reach out to CybrHawk support

Once configuration is complete, provide the following details to **CybrHawk Support** at 📧 [**socv2@cybrhawk.com**](mailto:socv2@cybrhawk.com):

* Your ESET account **Username** and **Password**

***
