# SentinelOne

To integrate Sentinel One with CybrHawk, follow these steps:

## Step 1: Configuration in Sentinel One Management Console

1. Log in to the Sentinel One Management Console with administrative credentials.
2. Go to Settings > Users in the Management Console.
3. Click on the Admin user for whom you want to generate an API token.
   * Note: Creating a new user is not required; a Viewer user role is sufficient to query the SentinelOne API.
4. Click on the "Generate" link next to API Token.
5. A new window will open displaying the API Token. Click on "Copy" to save it to your clipboard.
6. You will also need the SentinelOne API URL for integration. This information is typically provided within the Sentinel One Management Console.

## Step 2: Configuration in CybrHawk

**Provide CybrHawk with Client Information**:

* Provide the following information to your CybrHawk representative at [CybrHawk Support](mailto:socv2@cybrhawk.com):
* SentinelOne API Key
* SentinelOne API URL
