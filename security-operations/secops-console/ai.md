# AI

### Introduction

Most organisations now use AI tools every day, often without a clear record of which ones, by whom, or with what data. The AI section of the CybrHawk SecOps console tracks AI use across computers and the network, checks it against the decisions the organisation has made, and scores how well that use is governed.

This playbook explains each page of the AI section, what the figures on it mean and where the data comes from.

<figure><img src="../../.gitbook/assets/Screenshot 2026-10-21 at 12.46.34 PM.png" alt=""><figcaption></figcaption></figure>

#### AI governance

AI governance is the set of decisions and controls that keep AI use safe and accountable. It comes down to four questions:

1\. Which AI tools are approved, which are tolerated, and which are not allowed? 2. Who in the organisation owns those decisions?

3\. What kinds of data must never be entered into an AI tool?

4\. Can the organisation show an auditor that these rules exist and are followed?

The AI section helps answer all four. Monitoring shows what is actually happening, the Sanction Register records the decisions, and the Attestations record the policies behind them, mapped to the NIST AI Risk Management Framework, ISO/IEC 42001 and the EU AI Act.

#### Open the AI section

AI dashboard link: Open the AI dashboard in SecOps. You will be asked to sign in if you are not already. In the left-hand menu, open Capabilities > AI. The AI page groups the pages under three headings:

| Heading              | Pages                                                                                     |
| -------------------- | ----------------------------------------------------------------------------------------- |
| Governance           | AI Governance, AI Incidents, Sanction Register, Attestations, Platform Catalog, Dashboard |
| Detection & Response | AI Detection & Response                                                                   |
| Usage                | AI Usage (endpoint agent), AI Usage (NDR)                                                 |

The AI page in SecOps, showing the Governance, Detection & Response and Usage headings

The six Governance pages also appear as tabs along the top of the AI Governance page.

Before you start, use the selector at the top of the screen to choose your MSP, then the sub-tenant you want to review.

#### Filters, views, Event View, and Insights

These controls appear on the Dashboard tab and the two AI Usage pages. Insights and Panel actions are shown here as they appear on the Dashboard tab.

| Control       | What it does                                                                                                                                                                                                                                |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Filters       | Drop-down filters across the top (for example User, Device or AI Domain) narrow every panel on the page at once                                                                                                                             |
| Views         | Saves the current filters and time range as a named view, either for yourself (Mine) or for the tenant (Team). A saved view applies automatically when opened and can be shared. Team views can be deleted only by their author or an admin |
| Page menu     | Copy view link, Add filter (by field and value), Insights, and Clear all filters                                                                                                                                                            |
| Panel actions | Per-panel options, such as Export CSV for a table                                                                                                                                                                                           |
| Event View    | The raw events behind the page. Search events, choose Columns, and filter by the same fields as the panels                                                                                                                                  |
| Insights      | Opens an assistant beside the page. It runs the page’s saved checks on your data, or answers a question typed or spoken about your data. Voice settings control spoken input and answers; nothing is recorded or stored in any mode         |

### AI Governance overview

The Overview tab gives the organisation a single AI Governance Score between 0 and 100 (higher is better), with a letter grade, and shows exactly where the missing points went.

#### AI Governance Score

The target is 70 (good). The scale under the score marks the bands: 40 at risk, 55 fair, 70 good and 85 excellent. Next to the score is a severity label and a line such as “You are 20 points from Good”.

The How the score is made card shows the calculation. Every organisation starts at 100. Points are then taken off for two reasons:

• Not assessed. No data source feeds that area, so the platform cannot measure it and those points cannot be earned yet. For example, with no web filtering or cloud app data controls sending data, data protection in AI use cannot be assessed.

• Problems found. The data is there and it shows a gap, such as AI services nobody has decided on, or governance questions left open.

Fixing either one brings the points back.

#### Score by pillar

The score is split by category. Each category can take off up to its maximum.

| Category                    | Max | What it measures (console description)                                   | Data that feeds it                     |
| --------------------------- | --- | ------------------------------------------------------------------------ | -------------------------------------- |
| Shadow AI exposure          | 25  | AI services people use that nobody has decided on                        | Endpoint DFIR, network sensors         |
| Governance attestations     | 20  | Your answers to the AI governance questions                              | Attestations                           |
| SOC AI assurance            | 15  | How many alerts the AI analyst screened                                  | SOC alerts                             |
| Data protection in AI use   | 15  | Whether what leaves in prompts can be inspected                          | Web filtering, cloud app data controls |
| AI visibility and inventory | 15  | Whether AI use is being watched at all                                   | Endpoint agent or network sensor       |
| AI agent security           | 10  | Secrets the AI agents on your computers can read, and risky agent setups | Endpoint AI agent scan                 |

#### What pulls it down and where the points go

What pulls it down shows the points lost per category, in points and as a percentage. Where the points go shows the same as a table, with a grade and description for each category.

#### Fix these to gain points

This panel lists the actions that would raise the score, most severe first, with the points each one is worth. Items are grouped under Open AI incidents, Everything else (such as unanswered governance questions) and Missing data sources.

#### AI services in use

Every AI service seen in the period, how often it was used, its decision and its share of use. A service counts once the endpoint DFIR or the network sensors see it.

### AI Incidents

An AI incident is raised when AI activity conflicts with, or sits outside, the organisation’s decisions. Examples are an AI app installed with no decision, traffic to a banned platform, or an AI agent that can read a stored password.

The five tiles at the top show Open AI incidents (split into high, medium and low), AI services seen (and how many have no decision yet), Computers with AI apps (from the software inventory), Services in risky countries and Median time to contain.

#### AI incidents

Each row shows the incident, its activity (for example, the number of hosts an app is installed on), severity and status. The buttons switch between Open, Contained, Closed and All. Clicking an incident opens its record:

| Field            | What it holds                                                                                                    |
| ---------------- | ---------------------------------------------------------------------------------------------------------------- |
| Who              | The users or hosts involved                                                                                      |
| What happened    | The activity that raised the incident                                                                            |
| What is affected | The computers or accounts concerned                                                                              |
| Did data leave   | Whether data left the organisation, or “Not measured”                                                            |
| Root cause       | <p>No decision made, No block rule, Policy not</p><p>communicated, Policy ignored, Unapproved install, Other</p> |
| Outcome          | Decision made, Blocked, Removed from host, User briefed, Accepted, False positive                                |
| Timeline         | First seen, last seen, and when the incident was raised                                                          |
| Next step        | The recommended action, for example allow, tolerate or ban the vendor                                            |

The record also shows the supporting evidence (installed software and installed AI agents) and three buttons: Mark contained, Close and Open case.

#### Installed AI apps and agents

From the endpoint software inventory. For each app: App, Maker, Decision, Computers, Version and Last inventory.

Command line agents (Claude Code, Codex CLI, Aider, editor add-ons) are checked for:

| Check                   | Console description                              |
| ----------------------- | ------------------------------------------------ |
| Acting without approval | Auto-approve or unrestricted shell access        |
| Secrets in agent files  | Keys or passwords found, last 3 characters shown |
| Unknown connections     | Agent tools pointing at hosts nobody approved    |
| Planted instructions    | Instructions hidden in agent memory files        |

#### Incident data sources

Each data source with its status and latest data, the last scan time and schedule, and a Run scan now button. A source showing No data cannot raise incidents.

### Sanction Register

The Sanction Register is the organisation’s decision list for AI platforms. Every other page in the AI section measures activity against it.

#### Banned, unreviewed, tolerated, and sanctioned

| Decision   | Console description      | Effect                                          |
| ---------- | ------------------------ | ----------------------------------------------- |
| Sanctioned | Approved for use         | Use is expected and recorded                    |
| Tolerated  | Allowed for now, watched | Use is recorded and reported                    |
| Banned     | Blocked                  | Any traffic to these is reported as a violation |
| Unreviewed | Awaiting decision        | Counts against Shadow AI exposure               |

The buttons at the top filter the list by decision, with a count on each, and a coloured bar shows the split. Each platform has a decision drop-down and three fields: owner, approved for and note. Search platforms finds a platform, and Export CSV exports the register.

#### Inherited decisions

Decisions set by CybrHawk show on each row as inherited. The page notes that decisions made here override the MSP-wide defaults, and changing an inherited row writes a decision for the scope picked in the top bar.

### Attestations

Attestations are the AI governance questions the organisation answers formally. They make up the Governance attestations category of the score (20 points).

#### Frameworks and custom questions

| Button                  | Console description                                                                       |
| ----------------------- | ----------------------------------------------------------------------------------------- |
| NIST AI RMF             | Core AI governance questions organised by the NIST AI Risk Management Framework functions |
| ISO/IEC 42001 readiness | Readiness questions for an AI management system aligned with ISO/IEC 42001                |
| EU AI Act exposure      | Exposure screening for organisations in scope of the EU AI Act                            |
| Add custom question     | Adds the organisation’s own question                                                      |

#### Govern, Map, Measure, and Manage

The NIST AI RMF questions are grouped under the four NIST functions:

| Function | Questions                                                                                                                                                                                                                                                     |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Govern   | GOV-1 an AI acceptable-use policy exists and is published to all staff; GOV-2 a named owner is accountable for AI risk; GOV-3 staff receive guidance or training on safe AI use; GOV-4 AI use by third parties handling your data is addressed in contracts   |
| Map      | MAP-1 the AI tools in use are known and recorded; MAP 2 for each sanctioned tool, it is recorded which teams use it and for what; MAP-3 a short list of data that must never go into AI tools                                                                 |
| Measure  | MEA-1 monitoring reports which AI platforms are used, by whom and how often; MEA-2 an inline control (cloud app DLP, M365 AI auditing or web filtering) can see or stop sensitive content; MEA-3 anything drafted by AI passes a human check before it leaves |
| Manage   | MAN-1 a ban is enforced at the web filter or endpoint; MAN-2 when a tool is dropped or banned, accounts are closed and data exported or deleted; MAN-3 staff know where to report a data spill into an AI tool or a harmful AI output                         |

Each question takes an answer (yes, partial, no, not applicable), an owner and an evidence link or note. Questions marked evidence required need a link to the proof. Answers are recorded with who attested and when, and an answer older than its revalidation period shows as stale.

### Platform Catalog

The Platform Catalog is the list of AI platforms the dashboards and reports recognise. A connection is counted as AI use only when its domain matches a platform in this catalog.

| Column              | Meaning                                                                                      |
| ------------------- | -------------------------------------------------------------------------------------------- |
| Platform            | The AI service, or a group of similar tools                                                  |
| Domains             | The domains matched to the platform; a wildcard such as \*.example.com covers all subdomains |
| Category            | The type of tool, for example coding, writing, image or research                             |
| Tier                | consumer-only, consumer, consumer-and-enterprise, or ai-detection-circumvention              |
| Trains on your data | Whether the vendor trains on customer input: yes, unknown or configurable                    |
| Origin              | Seed (shipped with the product) or edited                                                    |

The page notes that product updates fill in new platforms but never overwrite a platform you have edited, and that disabled platforms stop matching immediately.

### Dashboard

The Dashboard tab brings the Governance pages together on one screen. The User, Device and AI Domain filters narrow every panel.

| Panel                                                                                                   | What it shows                                                          |
| ------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| The AI Estate, decide inline                                                                            | Every AI platform in use, with a decision recorded from the panel      |
| Governance score, Platforms seen, People using AI, Banned in use, Awaiting decision, AI-screened alerts | The headline figures for the period                                    |
| Top AI Domains                                                                                          | The most used AI sites                                                 |
| Where AI Use Is Seen                                                                                    | Whether activity was seen by the endpoint agent or the network sensors |
| Score By Pillar                                                                                         | Points kept per category, or “Not assessed”                            |
| Governance Attestations                                                                                 | Questions attested out of the total, per framework                     |
| Activity Over Time                                                                                      | AI use over the period                                                 |
| People And Adoption                                                                                     | Per user: AI visits, platforms, devices and share                      |
| Decisions Standing                                                                                      | Platforms in each decision state                                       |

| Panel      | What it shows                                                                                        |
| ---------- | ---------------------------------------------------------------------------------------------------- |
| Event View | The raw events behind every panel, with Status, Data Sources, Severity, User, MITRE and Tags filters |

### AI Detection & Response

This page covers AI agents installed on computers: coding assistants, command-line agents and desktop AI apps. It shows which agents are on which computers, what each one can reach, and the passwords, keys and logins they can read. It uses endpoint agent scans from the last 30 days.

The page states that values are never collected. The scan records which kind of secret sits in which file an agent reads, the file’s fingerprint and where in the file it is, enough to find and rotate it without anyone seeing the secret.

#### Overview

| Tile                     | What it counts                                                                 |
| ------------------------ | ------------------------------------------------------------------------------ |
| Computers with AI agents | Accounts with agents, of computers scanned                                     |
| Agent types              | Agents installed, the rest configuration left behind                           |
| Secrets agents can read  | Secrets on computers, and how many are high confidence                         |
| Agent logins stored      | Stored AI logins, by computer                                                  |
| MCP configurations       | Configurations that define servers, and those that enable every project server |
| Agent risks              | Banned agents, privileged accounts, servers, leftovers                         |

The page notes that the scans show an MCP configuration exists and whether it defines servers; the servers themselves are not tested.

Below the tiles are four panels: Secrets exposed to AI agents (by kind and name; click a name to list where), Fix these first (most severe), Agents in use (agents per computer and account, with their Sanction Register decision) and What agents can reach (files the agents read, by kind).

#### Agents

One row per agent per computer and account, from the newest scan. Columns: Agent, Account, Computer, Status, Sanction, Can reach, Secrets and Last scan.

#### Secrets exposed

Findings, most severe first, with a By name panel listing every kind found. Picking a finding opens its detail.

#### Agent access

Agent access and risks, most severe first. Columns: Risk, What, Agent, Computer, Account and Detail.

#### Person or computer

The findings above for a single person or computer. The search box at the top finds a person, computer, agent, secret type or file.

### AI Usage (endpoint agent)

This page shows AI use from inside each computer: which AI sites each person visits, in which browser, how often and for how long. Because it ties activity to a named user, it is the page to use when a finding needs to be traced to a person.

The tiles count Non-English AI, Shadow AI, Public Share Links, AI Users and AI Tools. Filters: Risk, Provider, Category, Language, User, Host and Browser.

| Panel                                                   | What it shows                                                             |
| ------------------------------------------------------- | ------------------------------------------------------------------------- |
| Top AI Users                                            | The people with the most AI activity                                      |
| AI Language Mix                                         | Non-English and English AI use, with Big-5 Platforms and Shadow AI counts |
| AI Tools By Provider                                    | Which vendors’ tools are in use                                           |
| Activity Over Time                                      | AI use over the period                                                    |
| Big-5 vs Shadow AI                                      | Big-5 platforms compared with shadow AI                                   |
| English vs Non-English                                  | Use split by platform language                                            |
| Top AI Domains                                          | The AI sites visited most                                                 |
| Top Hosts                                               | The computers with the most AI activity                                   |
| Browsers                                                | Which browsers the activity came from                                     |
| Top Users By Total AI Engagement                        | Users ranked by overall AI use                                            |
| Top Users By Visit Duration, Time Spent On AI Platforms | Users ranked by time spent on AI platforms                                |
| Event View                                              | Raw events: user.name, hunter.domain, hunter.browser, host.name           |

### AI Usage (NDR)

This page shows AI use from the network. The network sensors record lookups and encrypted connections to AI services from machines on monitored networks, so it also covers devices without the endpoint agent.

The tiles count High-risk Vendors, Shadow AI, Sanctioned, Source IPs and AI Domains. Filters: Risk, Domain, Source IP, Dst Country, Owner, Tenant and Tags.

| Panel          | What it shows                                  |
| -------------- | ---------------------------------------------- |
| Top Source IPs | Internal addresses sending the most AI traffic |

| Panel                      | What it shows                                                                                             |
| -------------------------- | --------------------------------------------------------------------------------------------------------- |
| AI Exposure                | Vendors, sanctioned and countries                                                                         |
| Top AI Domains             | The AI services reached most                                                                              |
| Activity Over Time         | AI traffic over the period                                                                                |
| Destination Countries      | Where AI traffic goes                                                                                     |
| Network Owners             | Who owns the destination networks                                                                         |
| Hosts By Platform          | Which hosts reach which AI platforms                                                                      |
| Suppressed False Positives | Matches suppressed as false positives                                                                     |
| Least-accessed AI          | The least used AI services                                                                                |
| Event View                 | Raw events: td.netflow.ssl.server.name, source.ip, destination.geo.as\_org, destination.geo.country\_name |

### AI incident data sources

The AI section uses six data sources, listed on the AI Incidents page. A source that is not sending data shows as No data, and the categories it feeds are marked “not assessed”.

| Source              | Console description                                                                                     | Pages that use it                                |
| ------------------- | ------------------------------------------------------------------------------------------------------- | ------------------------------------------------ |
| Network sensors     | Lookups and encrypted connections to AI services from machines on monitored networks                    | <p>AI Usage (NDR), Overview,</p><p>Dashboard</p> |
| Endpoint DFIR       | AI sites visited on each computer, by person, collected by the endpoint agent                           | AI Usage (endpoint agent), Overview, Dashboard   |
| Installed software  | <p>AI apps installed on each computer, from the endpoint software</p><p>inventory</p>                   | AI Incidents                                     |
| Installed AI agents | What AI agents on each computer are allowed to do, and findings in their files, checked on the computer | AI Detection & Response, AI Incidents            |
| File monitoring     | Changes to AI agent settings and memory files                                                           | AI Detection & Response                          |
| Email detections    | Alerts about AI-written phishing or fraud                                                               | AI Incidents                                     |

Every connection is matched against the Platform Catalog to identify the AI service, then compared with the Sanction Register decision.
