# Mimecast

![Mimecast logo 2021](../../.gitbook/assets/mimecast-logo-dark-2021.png)

Mimecast provides an API which allows for the retrieval of data directly into CybrHawk.\
If you are using Mimecast, please follow this guide.

Before CybrHawk can retrieve logs from Mimecast, you must:

* Identify your regional base URL.
* Enable enhanced logging.
* Add a custom API application.
* Create a new user profile and application setting.
* Generate API access and secret keys in the Mimecast administrator portal.

***

## Identify Your Base Domain URL

Copy and save the [base URL](https://integrations.mimecast.com/documentation/api-overview/global-base-urls/) for your host region.

***

## Mimecast Permissions

The table below shows the endpoints used by the collection scripts and required administrator permissions.\
All permissions are included in the **Basic Administrator** role.

| Endpoint                           | Permission       |
| ---------------------------------- | ---------------- |
| /api/login/discover-authentication | N/A              |
| /api/audit/get-audit-events        | Logs \| Read     |
| /api/audit/get-siem-logs           | Tracking \| Read |

***

## Step 1: Creating a User

1. Navigate to **Administration → Directories → Internal Directories**.
2. Select the **Internal Domain** where you want to create the user.
3. Click **New Address**.
4. Complete the form. See [Managing User Email Addresses](https://mimecastsupport.zendesk.com/hc/en-us/articles/34000769619091-Directories-Managing-User-Email-Addresses) for details.

> **Note:** Keep a copy of the password. You will use it when setting up the scripts.

5. Click **Save and Exit**.

***

## Step 2: Adding the User to an Administrator Role

1. Navigate to **Administration → Account → Roles**.
2. Right-click the Administrator Role (e.g., Basic Administrator).
3. Select **Add Users to Role**.
4. Find the user created in [Step 1](mimecast.md#step-1-creating-a-user).
5. Select the checkbox next to the user.
6. Click **Add Selected Users**.

***

## Step 3: Creating a Group and Adding the User

1. Navigate to **Administration → Directories → Profile Groups**.
2. Create a new group.

> **Note:** Give the group a descriptive name (e.g., TD Admin).

3. With the group selected, click **Build**.
4. Click **Add Email Addresses**.
5. Add the user created in [Step 1](mimecast.md#step-1-creating-a-user).
6. Click **Save and Exit**.

***

## Step 4: Creating an Authentication Profile

> **Note:** 2-step authentication must be disabled for this profile.

1. Navigate to **Administration → Services → Application → Authentication Profiles**.
2. Click **New Authentication Profile**.
3. Enter a description.
4. Set **Authentication TTL** to _Never Expires_.
5. Leave other settings as the default.
6. Click **Save and Exit**.

***

## Step 5: Creating an Application Setting

1. Navigate to **Administration → Services → Applications**.
2. Click **New Application Settings**.
3. Enter a description.
4. Select the group created in [Step 3](mimecast.md#step-3-creating-a-group-and-adding-the-user).
5. Select the authentication profile from [Step 4](mimecast.md#step-4-creating-an-authentication-profile).
6. Leave other settings as the default.
7. Click **Save and Exit**.

***

## Step 6: Enabling Logging

1. Navigate to **Administration → Account → Account Settings**.
2. Expand the **Enhanced Logging** section.
3. Select the logs you want to enable:
   * **Inbound** — external senders to internal recipients.
   * **Outbound** — internal senders to external recipients.
   * **Internal** — between internal domains.
4. Click **Save**.

***

## Step 7: Registering an Integration

1. Navigate to **Administration → Services → API and Platform Integrations**.
2. Go to the **Available Integrations** tab.
3. Click **Generate Keys**.
4. Enter a description.
5. Click **Next**.
6. Provide a technical point of contact name and email address.
7. (Optional) Select the **Opt-in** checkbox for update notifications.
8. Click **Next**, review the summary, and click **Add**.
9. Copy the **Application ID** and **Application Key**.

> **Note:** You must wait at least 30 minutes before obtaining an Access ID and Secret Key.

***

## Step 8: Configuration in CybrHawk

Provide the following details to CybrHawk at **socv2@cybrhawk.com**:

* **MIMECAST\_API\_BASE\_URL** (e.g., `xx-api.mimecast.com`)
* **MIMECAST\_ACCOUNT\_CODE** (e.g., `CAU13A177`)
* **MIMECAST\_APP\_ID** (from [Step 5](mimecast.md#step-5-creating-an-application-setting))
* **MIMECAST\_APP\_KEY** (from [Step 5](mimecast.md#step-5-creating-an-application-setting))
* **MIMECAST\_ACCESS\_KEY** (from [Step 7](mimecast.md#step-7-registering-an-integration))
* **MIMECAST\_SECRET\_KEY** (from [Step 7](mimecast.md#step-7-registering-an-integration))

***

If you have any questions or need assistance, please contact us at **socv2@cybrhawk.com**.
