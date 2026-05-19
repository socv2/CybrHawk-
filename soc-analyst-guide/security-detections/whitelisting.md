# Whitelisting

Whitelisting allows analysts to suppress false positives by creating precise, targeted rules directly from security alerts. This ensures benign activity is excluded while maintaining full detection coverage.

***

## When to Whitelist

* Only for **confirmed false positives** after validating the activity is legitimate and authorized.
* Always **narrow the scope** — target the exact scenario that triggered the alert. Avoid wildcards (`*`) and overly broad filters.

***

## How to Whitelist

1. Open the false positive alert in the dashboard.
2. Click **Interactions** in the alert details.
3. Select **Whitelist** from the menu.
4. Define the rule using exact fields and values. Test the syntax first in the **Security Detections** interface.
   *   Example (narrow):

       ```
       user.name: John AND destination.port:(135 OR 445) AND agent.name:johnPC
       ```
   *   Example (O365 Impossible Travel):

       ```
       user.name: "Ethan Harrison" AND source.ip:(221.221.112.112 OR 199.199.123.123)
       ```
5. Provide a **reason for the whitelist** (e.g., "Expected login from approved IPs").
6. Save and apply — the rule takes effect immediately.

***

## Features

* **Instant effect**: Matching alerts are suppressed immediately.
* **Audit trail**: All whitelist actions are recorded in **MySOC → Whitelisting History**.
* **Safe validation**: Rules with invalid syntax are rejected automatically.

***

## Managing Whitelists

* **Edit or Remove**: Go back to the original alert, open **Interactions**, and adjust the rule.
* **Review History**: Use the **Whitelisting History** dashboard to audit all entries and prune outdated ones.

***

## Best Practices

* Use the **narrowest criteria** (e.g., user, host, port, IP).
* Always document the reason for creating the whitelist.
* Periodically review and remove old whitelists to prevent detection gaps.

***
