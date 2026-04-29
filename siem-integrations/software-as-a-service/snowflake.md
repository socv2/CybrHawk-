# Snowflake

### Introduction

Snowflake is a fully managed, cloud-native data warehouse built to process structured and semi-structured data at massive scale. Its architecture separates storage from compute, enabling organisations to independently scale ingestion, analytics, machine learning, and reporting workloads without impacting performance.

Monitoring Snowflake with ThreatDefence extends security visibility beyond traditional infrastructure into cloud-hosted data platforms. By integrating Snowflake audit and usage telemetry into the ThreatDefence SIEM, security teams can detect suspicious behaviour such as anomalous login patterns, repeated authentication failures, privilege escalation, unusual query activity, and sensitive data access.

This document outlines how to configure Snowflake to export relevant logs and provide them to ThreatDefence for continuous monitoring and analysis.

### Step 1 – Configure Snowflake Account Access

Follow the steps below to obtain the connection parameters required for ThreatDefence SIEM integration.

#### 1. Create or Access Your Snowflake Account

* Navigate to the Snowflake sign-up page.
* Create a new account and select your preferred cloud provider (AWS, Azure, or GCP).
* If an account already exists, select Sign in and log in.

***

#### 2. Retrieve Account Connection Details

1. Click your profile avatar (top right corner).
2. Navigate to:\
   Account → View account details
3. Open the Config File tab.

***

#### 3. Select Connection Parameters

Within the Config File tab, select:

* Warehouse: TARGET\_WAREHOUSE
* Database: SNOWFLAKE
* Connection Method: Password

Record the configuration details displayed. These parameters are required for ThreatDefence to establish secure log collection from your Snowflake environment.

### Step 2 – Provide Configuration Details to ThreatDefence

Once the Snowflake connection parameters have been retrieved, provide the configuration details recorded at Step 1 to ThreatDefence to enable SIEM integration:

* USER
* PASSWORD
* ACCOUNT
* WAREHOUSE
* DATABASE
* SCHEMA
