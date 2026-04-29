---
description: >-
  Data can be exported from the CybrHawk platform in two ways. Either as small
  formatted selections as either CSV JSON from dashboard visualisations, or as
  large json dumps of raw, optionally filte
---

# Data Export

### Scoped Exports

From any dashboard, identify the visualisation that holds the data you're looking to export.

Select "Inspect" from the three dots on the top right of the visualisation.

<figure><img src="../.gitbook/assets/image (35).png" alt=""><figcaption></figcaption></figure>

Then choose either Download CSV and select either "Formatted CSV" for formatted exports, or "Raw CSV" for unformatted exports.

<figure><img src="../.gitbook/assets/Screenshot 2026-01-19 at 2.46.46 PM.png" alt=""><figcaption></figcaption></figure>

### Large Exports

In the event of an audit or a requirement for more data than a dashboard offers, an entire index can be exported with an optional filter over the documents.

Access the [Customer Portal](https://portal.cybrhawk.com), and go to "My Tenants > Data Export".

<figure><img src="../.gitbook/assets/Screenshot 2026-01-21 at 11.41.10 AM.png" alt=""><figcaption></figcaption></figure>

From this screen, select the index pattern for export from "Select Index", and optionally enter a query into the "Enter DB query" field. Queries can be determined in Console to determine the filtering (e.g. limiting to a single host: `source.ip: 192.168.0.1`).

<figure><img src="../.gitbook/assets/Screenshot 2026-01-21 at 11.43.07 AM.png" alt=""><figcaption></figcaption></figure>

After the export completes, which may take a while depending on the scale of data selected, the download will be available as a .jsonl.gzip. This file can be opened by most desktop applications that can handle zip files.

***

## Having Trouble?

If you're experiencing any issues with user management, please open a request via the support portal, or email [**CybrHawk Support**](mailto:support@threatdefence.com) and our team will assist you.
