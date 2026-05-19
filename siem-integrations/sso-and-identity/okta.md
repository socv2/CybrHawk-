# Okta

Integrating **Okta** with **CybrHawk** allows user and authentication activity to be streamed into CybrHawk for centralized monitoring and incident response. This provides visibility into login attempts, policy enforcement, and identity-related risks, enabling faster detection and response to account misuse, phishing, and unauthorized access.

***

## Before You Begin

* Sign in to **Okta** as a user with **administrator permissions**.
  * The following roles have the necessary permissions: **Read Only Admin**, **Super Admin**, or **Org Admin**.
* CybrHawk recommends creating and using a **dedicated Read Only Admin role** specifically for generating the Okta API token.

> **Important Notes:**
>
> * The API token inherits the permissions of the user who created it. If that user’s role changes, the token permissions also change.
> * To ensure uninterrupted collection, the user must remain **active** for as long as the token is in use.
> * The token-creating user must have these Okta permissions:
>   * View users
>   * View groups
>   * View System Log

***

## Step 1. Create an Okta API Token

1. Sign in to Okta with administrator permissions.
2. Go to **Security → API**.
3. On the **Tokens** tab, click **Create Token**.
4. Enter a descriptive name for the token, for example: **CybrHawk - Log Integration**.
5. Under **API calls made with this token must originate from**, select **Any IP**.
6. Click **Create Token**.
7.  Copy the **Token value** and store it securely (e.g., a password vault).

    > ⚠️ The token value cannot be retrieved again after closing this form.
8. Confirm the new token appears in the list of active API tokens.

***

## Step 2. Configure Okta ThreatInsight

Okta ThreatInsight helps reduce noise by logging malicious or suspicious IP activity.

1. In the Admin Console, go to **Security → General**.
2. Locate **Okta ThreatInsight settings** and click **Edit**.
3. Select **Log authentication attempts from malicious IPs**.
   * (Optional) If you’ve configured trusted IPs (e.g., gateways, Okta agents), you can select **Log and enforce security based on threat level**.
4. In the **Exempt Zones** field, add network zones containing IPs you trust.
5. Click **Save**.

***

## Step 3. Enable Security Notification Emails

1. In the Admin Console, go to **Security → General**.
2. Under **Security notification emails**, click **Edit**.
3. In the **Report suspicious activity via email** list, select **Enabled**.
4. Click **Save**.

***

## Step 4. (Optional) Enable Phishing-Resistant Authentication

For stronger authentication security, configure phishing-resistant factors such as WebAuthn or Okta FastPass.

* Configure **WebAuthn** and **Okta Verify** authenticators.
* Configure **Okta FastPass**.
* Create **authenticator enrollment policies** for WebAuthn and FastPass.
* Configure **authentication policies** requiring WebAuthn or FastPass as a possession factor.

> See Okta’s official documentation for detailed setup guidance.

***

## Step 5. Provide Okta Credentials to CybrHawk

Send the following details to your CybrHawk representative at\
📧 **socv2@cybrhawk.com**:

* API Token
* Okta Tenant URL

Once provided, CybrHawk will configure ingestion so that Okta activity is correlated with other security telemetry for monitoring, detection, and incident response.

***
