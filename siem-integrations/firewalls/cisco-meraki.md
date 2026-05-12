# Cisco Meraki

By integrating **Cisco Meraki** with **CybrHawk** via the **Meraki Dashboard APIs**, you can stream network, device, and security events directly into CybrHawk for comprehensive visibility and centralized incident management.

This integration enables CybrHawk to monitor activity across Meraki-managed devices—including firewalls, switches, wireless access points, and endpoints—allowing correlation with other security data to detect threats, enforce policies, and accelerate response.

***

## Step 1. Obtain Your Meraki API Key

To interact with the Meraki Dashboard API, you must first obtain an API key:

1. Open your Meraki dashboard at [https://dashboard.meraki.com](https://dashboard.meraki.com).
2. Navigate to **Organization → Settings**.
3. Ensure the setting **Enable access to the Cisco Meraki Dashboard API** is turned on.
4. Click your account email address in the top-right corner and go to **My Profile**.
5. Generate your **API Key**.

***

## Step 2. Find the Organization name and ID (Optional)

If your Meraki setup has more than one organization enabled, and you need only selected organization's data, follow these steps to list the organization name(s) or ID(s) exactly as shown. Either name of ID is required to enable this filter.

Get Organization name(s).

1. Open your Meraki dashboard at [https://dashboard.meraki.com](https://dashboard.meraki.com).
2. The selected organization name appears in the organization drop-down menu, at the top left corner.
3. If you have access to multiple organizations, click the drop-down to view all organization names.
4. Note the exact organization name(s) that should remain enabled.

Get Organization ID(s). ( This is the preferred option as this is unique and exact )

1. Follow Step 1 and obtain your MERAKI-API-KEY.
2.  Use the following cURL command, with the above key,

    ```dotenv
    curl -L -H 'Authorization: Bearer MERAKI-API-KEY' \
         'https://api.meraki.com/api/v1/organizations'
    ```
3.  You would see the response in the following format.

    ```json
    [
      {
        "id": "123456",
        "name": "My Organization 01"
      },
      {
        "id": "789012",
        "name": "Organization-2"
      }
    ]
    ```
4. Note the organization ID(s) you prefer.

***

## Step 3. Configure CybrHawk Integration

Provide the following information to your CybrHawk representative at\
📧 [**CybrHawk Support**](mailto:socv2@cybrhawk.com):

* API Key
* Organization name(s) or ID(s) if needs filtering ( Optional )

***

## Support

For questions or assistance, please contact:\
📧 [**CybrHawk Support**](mailto:socv2@cybrhawk.com)
