# Platform Navigation

## Dashboards

The **Security Detections** dashboard is the main triage hub, consolidating alerts from all data sources. Analysts use it to review, prioritize, and manage detections across the environment.

Other dashboards provide **forensic visibility into specific data sources**. These are useful not only for detecting breaches but also for validating security controls, proving systems are uncompromised, and supporting incident response.

### Dashboards Menu

* **Customer Portal** – High-level reporting and summaries.
* **My SOC** – Preconfigured views for common SOC needs, such as tracking emerging threats and SOC statistics.
* **Endpoint** – Data from DFIR endpoint agents (Windows/Mac/Linux), including system event logs, network connections, logons, and benchmarks (e.g., CIS checks).
* **Cloud** – Audit and assessment events from cloud environments like O365, AWS, and GCP.
* **Network** – Data from CybrHawk NDR sensors, including flow visibility and network intrusion detections.

<figure><img src="../.gitbook/assets/Screenshot 2026-05-13 150017.png" alt=""><figcaption></figcaption></figure>

***

## Navigation & Filtering

Dashboards include filters and search controls to refine alerts and focus investigations.

### Dashboard Filters and Views

*   **Time Range** – Defaults to _Last 24 hours_. Adjust via **Show dates** for custom ranges (e.g., last 30 days).

    ![](https://4191868192-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FOlFHF8fl339QOw3Og8L7%2Fuploads%2FKZJIqcZUD9nXxwokV5ms%2Fimage.png?alt=media\&token=3c942aa6-53a0-438c-82b0-15103ec69cc8)
*   **Menu Filters** – Predefined options for narrowing down alerts, including:

    * Alert Status (Open, Closed, In Progress)
    * Tenant (e.g., cybrhawk, chsoc, acme)
    * Data Source (e.g., Keycloak, O365, NDR, Dark Web, Mailgun, google\_workspace.drive)
    * Technique (e.g., Indicator, Exploit Public-Facing, Valid Accounts)
    * AI Outcome, MSP, Severity, Tags

    ![](https://4191868192-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FOlFHF8fl339QOw3Og8L7%2Fuploads%2FEZ0y1y0HQcXUo9NjJaSN%2Fimage.png?alt=media\&token=82d15649-4468-48d1-9b73-164d1de9c16f)
*   **Manual Filters** – Click on visualizations to filter interactively. For complex queries or automation, use text-based Lucene queries.

    ![](https://4191868192-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FOlFHF8fl339QOw3Og8L7%2Fuploads%2F8wAW0NP0iqR4pSnG8cSo%2Fimage.png?alt=media\&token=90884a45-7f34-435d-afde-b0b69f3d8411)

***

## Key Sections

*   **Security Detections Table** – Lists alerts by name and severity. Analysts can sort, filter, and drill into specific alerts.

    ![](https://4191868192-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FOlFHF8fl339QOw3Og8L7%2Fuploads%2FTDJoih4HF4xpOCSp5DDW%2Fimage.png?alt=media\&token=02a09555-d42b-48c0-a310-b90093fbd0a0)
* **Charts & Aggregations** – Visual breakdowns including:
  * Anomalies (e.g., open high-risk alerts)
  * Detection Types (spikes, informational, indicators)
  * Techniques (e.g., LOGIN\_ERROR, persistence)
  * Impacted Sites/Tenants
  * Indicators (IPs, domains, geo locations)
  * Detection Sources by Severity
  * **Top 5 Entities** – Most frequent hosts or users
* **Detections Feed** – A paginated log of all alerts, expandable for full context, interactions, and investigation options.

***

This structured navigation lets analysts move quickly from **high-level monitoring** to **detailed investigations**, reducing response times and improving situational awareness.
