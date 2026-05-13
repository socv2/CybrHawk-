# Monitor Privileged Users

## Overview

Monitoring privileged user activity helps SecOps teams detect unauthorized or suspicious behavior involving accounts with administrative rights. This includes privilege escalations, malicious insider actions, and misuse of system-level permissions on Windows endpoints. By tracking these events, analysts gain visibility into when and how special privileges are assigned, allowing for quicker investigations and proactive security controls.

***

## Data Source

Privileged activity data is collected via the **Cybrhawk Endpoint Agent**:

* **EventCode**: `4672` – _Special privileges assigned to new logon_

**Privileges Tracked** include:

* SeAssignPrimaryTokenPrivilege
* SeTcbPrivilege
* SeSecurityPrivilege
* SeTakeOwnershipPrivilege
* SeLoadDriverPrivilege
* SeBackupPrivilege
* SeRestorePrivilege
* SeDebugPrivilege
* SeAuditPrivilege
* SeSystemEnvironmentPrivilege
* SeImpersonatePrivilege
* SeDelegateSessionUserImpersonatePrivilege.

***

## Events Captured

The **Users With Admin Rights** dashboard highlights the following information:

* **Users With Admin Rights** – Count of accounts assigned special privileges.
* **User Breakdown** – Distribution of SYSTEM, Administrator, and service accounts.
* **Event Feed** – Real-time activity log with timestamps, IP addresses, and privilege assignments.

***

## Key Fields

When investigating privileged activity, the following fields provide context:

* **`agent.name`** – Endpoint hostname with TD agent installed.\
  \&#xNAN;_Example_: `agent.name: "TD-CCC-SENSOR-01"`
* **`data.win.eventdata.privilegeList`** – List of privileges assigned during logon.\
  \&#xNAN;_Example_: `data.win.eventdata.privilegeList: (SeBackupPrivilege OR SeRestorePrivilege)`
* **`source.ip`** – IP address of the system initiating the logon.\
  \&#xNAN;_Example_: `source.ip: 143.110.182.33`
* **`event.action`** – Action description from the Windows Event Log.\
  \&#xNAN;_Example_: `event.action: "Special privileges assigned to new logon"`
* **`destination.ip`** – Destination IP accessed during the privileged session.\
  \&#xNAN;_Example_: `destination.ip: 192.168.210.40`
* **`source.geo.organization`** – ISP or organization linked to the source IP.\
  \&#xNAN;_Example_: `source.geo.organization: "Digital Ocean"`
* **`tenant`** – Organization or tenant identifier.\
  \&#xNAN;_Example_: `tenant: acme`
* **`msp`** – MSP name or ID (if managed under an MSP).\
  \&#xNAN;_Example_: `msp: acme`

***

## Dashboard Access

Privileged activity is monitored in the **Users With Admin Rights** dashboard within the Cybrhawk Analyst Console.

* **From the Menu**:
  1. Open the **Dashboards** section in the left-hand navigation panel.
  2. Expand the **ENDPOINT** menu.
  3. Under **Windows**, select **Users With Admin Rights**.

This dashboard provides a comprehensive view of privileged accounts, their assigned rights, and related activity logs.
