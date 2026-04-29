# General Questions

## Table of Contents

* [General Questions](general-questions.md#general-questions)
  * [Table of Contents](general-questions.md#table-of-contents)
  * [What is your pricing model?](general-questions.md#what-is-your-pricing-model)
  * [What subscription tiers are available?](general-questions.md#what-subscription-tiers-are-available)
  * [Data sovereignty – where does my data go?](general-questions.md#data-sovereignty--where-does-my-data-go)
  * [What data can I onboard immediately?](general-questions.md#what-data-can-i-onboard-immediately)
  * [How long does it take to onboard my business?](general-questions.md#how-long-does-it-take-to-onboard-my-business)
  * [Can I get a trial or proof of concept?](general-questions.md#can-i-get-a-trial-or-proof-of-concept)
  * [Can the platform be white-labelled for MSPs?](general-questions.md#can-the-platform-be-white-labelled-for-msps)
  * [How do I access the platform?](general-questions.md#how-do-i-access-the-platform)
  * [What are my responsibilities as a user?](general-questions.md#what-are-my-responsibilities-as-a-user)
    * [SaaS SecOps Platform](general-questions.md#saas-secops-platform)
    * [Platform + SOC Service](general-questions.md#platform--soc-service)

***

## What is your pricing model?

Our standard pricing model for MSPs and commercial customers is **per user, per month**.\
For large Enterprise or ICS/OT deployments, please contact your account manager for a tailored model.

***

## What subscription tiers are available?

Two subscription tiers are available:

* **TD Complete Tier** – Includes full 24×7 SOC services.
* **Platform-Only Tier** – Use the platform to build and run your own SOC capability.

***

## Data sovereignty – where does my data go?

For Australian customers, all data remains **onshore in Australia** and will not leave the country.

***

## What data can I onboard immediately?

We support a wide range of log sources. Most customers begin with:

* ThreatDefence endpoint agents
* Microsoft 365 or Google Workspace logs
* AV/EDR telemetry

These sources typically provide **90–100% coverage** for small to medium organisations.

***

## How long does it take to onboard my business?

* Cloud and syslog integrations can be onboarded in **minutes**.
* The ThreatDefence endpoint agent supports automation, allowing deployment to **hundreds of endpoints almost instantly**.

***

## Can I get a trial or proof of concept?

Yes. We offer a **30-day trial** so you can experience the platform before committing.\
Please contact [sales@threatdefence.com](mailto:sales@threatdefence.com) for details.

***

## Can the platform be white-labelled for MSPs?

Yes. White-labelling is available for larger deployments.\
Please speak with your account manager to confirm if your organisation qualifies.

***

## What are my responsibilities as a user?

Active engagement with the platform increases awareness and reduces business risk. While our SOC triages alerts and performs threat hunting, tenants also have responsibilities depending on their subscription model.

### SaaS SecOps Platform

You are responsible for the **daily triage of alerts**.\
For a medium-risk organisation, we recommend at minimum:

* Reviewing the **Security Detections Dashboard** daily (0900 and 1700).
* Monitoring and actioning **email alerts**, particularly for high-severity events.

### Platform + SOC Service

Our SOC manages the full alert lifecycle. Your responsibilities are limited to:

* **Responding** to escalations sent via email from the SOC.
* Ensuring at least one representative attends the **monthly 15–30 minute review meeting**.

Here is the corrected version with improved grammar, spelling, flow, and professional tone:

## **What Integrations are Supported?**

By default, most common tools and platforms are supported, including cloud providers, SaaS, PaaS, and on-premises systems. We effectively support "everything." If a new, previously unseen data source requires a plugin, our R\&D team can develop it within one or more days, depending on complexity.

## **What Ingestion Methods are Supported?**

We support almost all common methods, such as APIs, webhooks, syslogs, agents, collectors, and sensors. If a specific method does not exist, for example, for a legacy mainframe system from the 1980s, our R\&D team can build a solution.

## **What is the Typical Onboarding Effort?**

For an organization with 500 users, achieving more than adequate coverage typically takes 1–3 hours. For example:

* Deploying endpoint agents to high-value targets or all endpoints: 1–5 hours (Windows engineer).
* Deploying an NDR sensor: 15 minutes (network engineer).
* Connecting major cloud providers: \~15 minutes.
* Adding major data sources (e.g., enabling syslog on a firewall or creating an API key): \~15 minutes each.

## **Do You Provide an Attack Storyline?**

Yes. The forensic record for timeline reconstruction is natively preserved within the platform.

## **Can We Pivot from One Signal (e.g., Email) to Other Assets (e.g., Endpoints, Firewalls)?**

Yes. Alerts perform this pivoting by default. For manual threat hunting, this capability is available via easy-to-use dashboard filtering and pinning.

## **What Detections are Included Out-of-the-Box?**

The platform includes approximately 2,000+ live use cases covering all common technologies. For example, for AWS you can onboard CloudTrail, CIS benchmarking, inventory, and services like S3 for automated detection and benchmarking. New use cases can be added at any time.

**What Response Actions are Supported?** We support isolation, ticketing, orchestration, and any other methods required for your specific environment. For example:

* For Microsoft 365: We require lock permissions to lock user accounts.
* For endpoints: Any command (e.g., route deletion, process termination) can be used to isolate a device.
* For firewalls: API or a script.

## **What Integration Capabilities with Existing Tools are Supported?**

Any tool can be integrated via our dedicated backend workflows, including custom integrations if required. The most common integrations are with EDR systems, firewalls, and content filters for automated response actions.

## **What is the Data Retention Policy?**

By default, we retain data in hot storage for 2 months for the top five largest data sources. Data can be retained indefinitely in a restorable archive if required. Assessments (dark web, scanning, etc.) and detections (alerts) are kept indefinitely.

## **How Do You Deal with Alert Noise Reduction?**

Our detection engineering team fine-tunes rules based on post-hunting reviews. We also use automated tools and an AI assistant that adjusts alerts based on historical context (e.g., "Tom from IT runs weekly scans"). End users can also create whitelists directly via the portal with just a few clicks.

## **Can I Have Role-Based Access Control (RBAC)?**

Yes. We support granular access controls. For example:

* A user can be restricted to a single endpoint.
* A tenant can only access its own data.
* An MSP can access all its tenants.
* A distributor account can view MSP-level data.

## **How Does Licensing Work?**

By default, licensing is based on the average number of successfully logged-in users. This can be calculated using the average of endpoint and email users, for instance. We also support volume-based ingestion licensing, which is applicable to ISPs and hosting providers.

## **What Are the Deployment Options?**

* **SaaS:** Instant enablement with some components, such as NDR sensors and collectors, will be deployed on-site.
* **On-Premises "SaaS":** This requires on-premises hardware. Its maintenance can be resource-intensive and is typically suitable for extreme-risk environments or large MSPs.

<br>
