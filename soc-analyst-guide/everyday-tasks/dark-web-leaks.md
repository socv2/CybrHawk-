# Check Dark Web Leaks

## Overview

The **Dark Web Leaks and Public Data Monitoring** dashboard provides visibility into breaches, compromised credentials, and exposed organizational data. It enables analysts to review severity levels, identify users at risk, and investigate malware-infected paths to proactively manage threats before they escalate into major incidents. This data comes from monitoring dark web forums, paste sites, credential dumps, and malware logs.

***

## Event Coverage

The dashboard provides insights across multiple dimensions of leaked data:

* **Breaches by Severity** – Breach titles, severity ratings, and affected user counts.
* **Dark Web Leaks Over Time** – Timeline of leaks detected for trend analysis.
* **Passwords** – Total number of compromised passwords identified.
* **Accounts** – Total compromised accounts linked to monitored domains.
* **Users At Risk** – List of users with leaked credentials and associated risk severity.
* **Impacted Domains** – Domains affected by breaches, with the number of leaks per domain.
* **Logons From** – Geographic origin of compromised login attempts.
* **Compromised Browsers** – Browser families and versions associated with breaches.
* **Malware Missed By** – Instances where malware bypassed endpoint or security systems.
* **Leaked Data Type** – Types of data exposed (e.g., plaintext, hashed passwords).
* **Malware Infected Locations** – Paths on infected devices tied to breach data.
* **Impacted URLs** – URLs where leaked credentials were observed, including plaintext password counts.
* **Dark Web Search** – Searchable view of leaked records, showing user details, breach name, and timestamps.

***

## Key Fields

When analyzing Dark Web events, the following fields provide the most context:

* **`user.name`** – Username linked to leaked data.\
  \&#xNAN;_Example_: `user.name: Charlie.Cassette`
* **`breach.title`** – Title or name of the breach incident.\
  \&#xNAN;_Example_: `breach.title: acme.corp`
* **`td.darkweb.domain`** – Domain of the leaked email or credential.\
  \&#xNAN;_Example_: `td.darkweb.domain: gmail.com`
* **`td.darkweb.target.domain`** – Targeted domain or login portal related to the credential.\
  \&#xNAN;_Example_: `td.darkweb.target.domain: https://ExampleDomain.com/signin`
* **`password.type`** – Format of the leaked password (plaintext, hashed, salted).\
  \&#xNAN;_Example_: `password.type: plaintext`
* **`password.text`** – Exposed password in plaintext (if available).\
  \&#xNAN;_Example_: `password.text: 123456`
* **`tenant`** – Tenant/organization identifier.\
  \&#xNAN;_Example_: `tenant: acme`.

***

## Dashboard Access

The **Dark Web, Public Leaks** dashboard consolidates all detected breaches, exposed credentials, and impacted domains into a single view for investigation.

* **From the Menu**:
  1. Open the **Dashboards** section in the Analyst Console.
  2. Expand the **INTEL** category.
  3. Select **Dark Web Leaks From the Third Party**.
  4. Review leaks, breach trends, and impacted users.

***
