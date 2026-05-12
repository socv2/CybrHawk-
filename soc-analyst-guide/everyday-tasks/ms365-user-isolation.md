# MS365 User Isolation

CybrHawk offers active defence capabilities for Microsoft 365 environments, enabling you to swiftly respond to compromised accounts by revoking user sessions and disabling accounts. This guide provides the steps required to configure Microsoft Graph API permissions for the user isolation functionality.

You can manually isolate or release users at any time via your [CybrHawk portal](https://portal.cybrhawk.com/).

***

## Prerequisites

* Onboarding Microsoft Graph API in CybrHawk. Refer to the [Microsoft Graph API Guide](../../microsoft-365/ms-graph.md) for details.

***

#### Usage

* Access your [CybrHawk portal](https://portal.cybrhawk.com/).
* Navigate to **Assets** > **M365 Users**.
* Select your tenant, and review the list of users.
* Use the **Isolate** or **Release** buttons to manage user accounts.

**Notes**

* All Disabled accounts will be marked as "Isolated" in the portal.
* External accounts can be isolated, but their active sessions cannot be revoked because external users sign in through their home tenant.
