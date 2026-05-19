# Escalations

Escalations ensure that validated or high-impact alerts are promptly raised with customers for confirmation, action, or additional context. The process standardises communication and guarantees timely responses.

***

## When to Escalate

* **Validation Needed:** Confirm if suspicious activity is expected.\
  \&#xNAN; _Example: "Is this user expected to access this system?"_
* **Action Required:** Customer approval or remediation is necessary.\
  \&#xNAN; _Example: "Confirm to lock this account."_
* **Context Needed:** Business-specific insight is required.\
  \&#xNAN; _Example: "Is this application change authorised?"_

***

## How to Escalate

1. Open the relevant alert in the dashboard.
2. Go to **Interactions** in the alert details.
3. Select **Escalate** from the menu.
4. Draft a clear message:
   * Specify the requested action or information.
   * Include context (from `td.alert.message` or Hunt results).
5. Send — the system will:
   * Email designated customer contacts immediately.
   * Record the escalation in the alert’s history.

***

## Follow-Up Protocol

* **Critical Severity:** If no reply within **10 minutes**, trigger an emergency phone call to customer contacts.
* **High Severity:** If no reply within **30 minutes**, follow up via email.
* **All Escalations:** Customer responses are logged automatically in alert history.

***

## Tracking Escalations

1. In the alert dashboard, open **Filters**.
2. Set **Status = Escalated** to view active escalations.
3. Monitor responses and update alert statuses as needed.

***

## Best Practices

* **Be Clear:** State exactly what you need from the customer.
* **Match Urgency to Severity:** Use strict timelines for high/critical alerts.
* **Document Everything:** All escalations and responses are automatically logged for audit and compliance.
