# Analyst Cheat Sheet

A quick reference for common operations in the CybrHawk Analyst Console.

***

| Goal                    | Action                                  | Hint                                              |
| ----------------------- | --------------------------------------- | ------------------------------------------------- |
| Find an alert           | Search: `td.alert.message:(*keyword*)`  | Combine `AND`, `OR`, and wildcards `*`            |
| Prioritise              | Use **Security Detections by Severity** | Work highest severity (e.g., **15**) first        |
| Take ownership          | Open alert → **Start Triage**           | Assign yourself to lock coordination              |
| Get advice/context      | Use **AI Assistant (Avesa)**            | Ask for likely root cause and next steps          |
| Investigate deeply      | Click **Hunt** from the alert           | Pivot by user, host, IP, file hash                |
| Document decisions      | Click **Update**                        | Always add notes; capture hypothesis & outcome    |
| Handle a false positive | **Interaction → Whitelist**             | Use **Lucene** syntax (see examples below)        |
| Escalate a real threat  | **Interaction → Escalate**              | Sends notification to default escalation contacts |
| Get human help          | Use **SecOps Chat**                     | Share alert link + short summary of findings      |

***
