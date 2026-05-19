# Office 365 Impossible Travel

**Alert Overview:** This alert triggers when a user account is successfully accessed from geographically distant locations within an impossible time frame, indicating potential account compromise.

**Step 1: Initial Dashboard Review**

1. **Navigate** to the default "Security Detections" dashboard in your ThreatDefence Analyst Console.
2. **Locate** the "Impossible Travel" alert in the table to the left and click on the filter to select it:

<figure><img src="../../../.gitbook/assets/image (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

The dashboard will refresh, only showing you the selected alert. Review impacted users, indicators, and techniques for quick awareness. Select(filter) one user if you wish to investigate one user only.

3.  **Do an initial review:**

    1. Review the td.alert.message, which contains a summary of the detection:

    <figure><img src="../../../.gitbook/assets/image (2) (1) (1) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

    1. Expand the alert using the > on the left side and inspect the available fields in the detection feed: logon locations, user agent, username, and ISP to determine the event outcome.
