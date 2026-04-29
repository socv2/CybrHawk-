# Analyze Entra ID Logons

## Overview

The **Microsoft Entra ID Logon Events** dashboard provides visibility into authentication activity across your environment. It helps security teams track successful and failed logins, analyze user behavior, and spot anomalies such as unusual geographic locations or unfamiliar devices. By monitoring these events, analysts can quickly identify high-risk activities like brute force attempts, impossible travel, or unauthorized access.

***

## Event Coverage

The dashboard highlights the following key metrics:

* **Users** – Count of unique users who successfully authenticated.
* **Failed Logins** – Number of failed attempts due to invalid credentials or access restrictions.
* **Logon Status** – Categorization of authentication outcomes (success vs. failure).
* **Users Connecting From** – Geographic distribution of login attempts (cities, countries).
* **Device Type** – Types of devices used for logins (Windows, macOS, iOS, etc.).
* **User Agents** – Browsers and clients used for access (Edge, Chrome, Safari).
* **Source IPs** – Unique IP addresses associated with login attempts.
* **Logon Timeline** – Trend graph showing login activity and failures over time.

***

## Key Fields for Analysis

When investigating individual logon events, the following fields are most useful:

* **`user.name`** – User performing the login.\
  \&#xNAN;_Example_: `user.name: acme.demo`
* **`source.ip`** – IP address where the login originated.\
  \&#xNAN;_Example_: `source.ip: 1.1.1.1`
* **`event.action`** – The action performed.\
  \&#xNAN;_Example_: `event.action: UserLoginFailed`
* **`event.category`** – Event category.\
  \&#xNAN;_Example_: `event.category: authentication`
* **`event.type`** – Type of authentication event.\
  \&#xNAN;_Example_: `event.type: authentication_failure`
* **`user_agent.original`** – Full browser/client details.\
  \&#xNAN;_Example_: `Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/131.0.0.0`
* **`source.geo.organization`** – ISP or organization associated with the IP.\
  \&#xNAN;_Example_: `Telstra Internet`
* **`o365.audit.ResultStatus`** – Outcome status of the login.\
  \&#xNAN;_Example_: `Failed`
* **`tenant`** – Tenant/organization identifier.\
  \&#xNAN;_Example_: `acme`.

***

## Dashboard Access

The **Microsoft Entra ID Dashboard** consolidates logon events for review. It includes charts, tables, and geographic views to simplify monitoring.

* **From the Menu**:
  1. In the Analyst Console, go to the **Dashboards** section.
  2. Expand the **CLOUD** menu.
  3. Select **Microsoft Entra ID**.
  4. Open the page to review authentication trends and detailed visualizations.

***

## Use Case Examples

* Detecting repeated failed login attempts from the same IP (possible brute force).
* Identifying logins from unexpected geographies (impossible travel).
* Reviewing user agent strings for suspicious clients or outdated browsers.
* Correlating failed logins with later successful access for the same account.
