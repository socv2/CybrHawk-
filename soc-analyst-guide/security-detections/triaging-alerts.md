# Triaging Alerts

#### **SOC Analyst Guide: Mastering Alert Triage**

This guide provides a step-by-step process for effectively triaging and investigating security alerts.

***

**1. First Steps: Accessing & Filtering the Dashboard**

Your primary view is the **Security Detections** dashboard. Before you start, ensure you are looking at the correct data.

*   **Set Your Scope:** Use the **Header Controls** at the very top to filter the view.

    * **MSP/Tenant Filter:** If searching single tenant or an MSP, ensure the filter is set (e.g., `tenant: tdsoc`). This prevents you from seeing irrelevant alerts.

    <figure><img src="../../.gitbook/assets/image (3) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

    * **Time Filter:** Set an appropriate time frame (e.g., Last 24 hours, Last 7 days), or an absolute time to focus on the desired activity.

    <div align="left" data-full-width="false"><figure><img src="../../.gitbook/assets/image (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure></div>
*   **Search for Specific Alerts:** Need to find an alert containing a specific message?

    * Use the **Search Bar** with Lucene syntax.
    *   **Example:** To find alerts mentioning "365", from user named john and his IP:

        * `td.alert.message:*365*`

        **More complex example:** Find some connections from John on certain service:
    * `user.name:john AND source.ip:`<sub>`2.2.2.2`</sub>` `` ``AND destination.port:(445 OR 446) `

    <figure><img src="../../.gitbook/assets/Screenshot 2026-05-13 125400.png" alt=""><figcaption></figcaption></figure>
* _Tip: Use asterisks (`*`) as wildcards and `AND` to connect keywords._

***

**2. Prioritize: The "Security Detections by Severity" Table**

Don't get overwhelmed. Always start here to focus on the most critical threats.

* **Location:** The main table on the dashboard's top-left.
* **Action:** Review the list of alerts sorted by **Severity** (highest to lowest). Alerts with a severity of **15 are critical**.
* **Click on the Alert Name** (e.g., "Dark Web Leaks with Plain Text Password") to select it for investigation.

***

**3. Triage & Initial Investigation**

Once you've selected an alert, it's time to take ownership and gather context.

**A. Take Ownership:**

* Click **Start Triage**. This changes the alert's status to "Triaged," officially assigning it to you and telling the team you're handling it.

**B. Gather Context - Get the "Full Picture":**

1. **Check the Alert Feed:** The expanded view shows key details: time, source, target, and the **MITRE ATT\&CK technique** mapped to the activity.
2. **Review Top Indicators:** Look at the "Top Indicators" widget for related IOCs (IPs, hashes, domains).
3. **Consult the AI Assistant (Avesa):**
   * Click **AI Assistant**. Avesa analyzes historical data to provide insights, potential causes, and recommended next steps. Use it to guide your initial approach.

**C. Quick Actions (Interaction Menu):** Based on your initial assessment, you can:

* **Whitelist:** If it's a confirmed false positive. _Requires knowledge of **Lucene syntax**._
* **Escalate:** If it's a severe, true positive. _You must provide a recipient email and a clear reason._
* **Notify:** Send details to relevant stakeholders.

***

**4. Deep Dive Investigation**

If the alert is complex and requires more info, use these powerful tools:

* **For ANY Alert: Use `Hunt`**
  * This is your most important tool. Clicking **Hunt** opens a new dashboard pre-filtered for your specific alert, allowing you to search for related events and "follow the breadcrumbs" to see the full scope of the activity.
* **For Process-Related Alerts: Use `Process Tree`**
  * If the alert involves a Windows or Linux process, use this to visualize the entire execution chain (parent and child processes) to find the root cause.

***

**5. Finalize: Document & Collaborate**

**Documentation is not optional; it's critical for the team.**

* **Update the Alert:** Always click **Update** after your investigation.
  * **Add Notes:** Record what you found and what you did (e.g., "False positive: approved software update").
  * **Set the Status:** Accurately reflect the outcome (`Resolved`, `Escalated`, `Pending`).
* **Collaborate with Your Team:**
  * Use **SecOps Chat** to discuss complex alerts with colleagues and strategize your response.

***
