# 1Password

By integrating **1Password** with **CybrHawk** via the **1Password Events Reporting API**, you can seamlessly ingest user activity and security event data into CybrHawk for centralized monitoring and response.

This integration enhances visibility into:

* Password management behavior
* Vault access
* Policy enforcement

It enables more effective detection of insider threats, credential misuse, and compliance violations.

***

## Requirements

* Access to your **1Password admin account**
* An active **1Password service account** (recommended for automation or API integration)

***

## Step 1. Generate a Bearer Token

1. Sign in to your account at [1Password.com](https://1password.com) and click **Integrations** in the sidebar.
2. Choose the **Events Reporting integration** where you want to issue a token and click **Add a token**.
3. Enter a name for the bearer token and choose an expiration time.
   * Select or deselect the event types the token will access.
   * Click **Issue Token**.
4. Click **Save in 1Password** and choose a vault to store your token. Then click **View Integration Details**.

For more information on issuing or revoking tokens, refer to the official 1Password guide:\
[➡ 1Password Events Reporting Guide](https://support.1password.com/events-reporting/#appendix-issue-or-revoke-bearer-tokens)

***

## Step 2. Configure CybrHawk Integration

Provide the following information to your CybrHawk representative at [**CybrHawk Support**](mailto:socv2@cybrhawk.com):

* Bearer Token
* Vault and Resource Scope
* Client ID

***

## Support

For questions or assistance, please contact:\
📧 [**CybrHawk Support**](mailto:socv2@cybrhawk.com)
