# Deploying via MS Intune

## Deployment via Microsoft Intune MDM

CybrHawk supports deployment of the Endpoint Agent via **Microsoft Intune**.\
This method is recommended for enterprise environments where agents need to be deployed and managed at scale.

For background information, refer to Microsoft’s official documentation on [Line-of-Business application deployment](https://learn.microsoft.com/en-us/mem/intune/apps/lob-apps-windows).

***

### Step-by-Step Guide

1.  **Open Intune Admin Center**

    * Navigate to the **Microsoft Intune admin center**.
    * From the left-hand navigation bar, select **Apps > All apps**.

    ![Figure 1](../../.gitbook/assets/1.png)
2.  **Add a New Application**

    * Press **+ Add**.
    * Select **Line-of-business app**.

    ![Figure 2](../../.gitbook/assets/2.png)
3.  **Select App Package File**

    * Upload the CybrHawk Endpoint Agent MSI file available in the [Customer Portal](https://portal.cybrhawk.com/deployment/endpoint-agent).

    ![Figure 3](../../.gitbook/assets/3.png)\
    ![Figure 4](../../.gitbook/assets/4.png)
4. **Configure App Information**
   * Set the **Publisher** field.
   * Populate the **Command-line arguments** as if calling `msiexec.exe` directly.\
     Example:

( `/qn ACTIVATION_CODE=... SYSINTERNALS_ACCEPT_EULA=Yes`).

![Figure 5](../../.gitbook/assets/5.png)

5. Configure assignments or select **+ All users** and **+ All devices** to deploy globally.

![Figure 6](../../.gitbook/assets/6.png)

6. Confirm the details, set a description, press **Create**.

![Figure 7](../../.gitbook/assets/7.png)

7. After pressing create no further action is required.

![Figure 8](../../.gitbook/assets/8.png)

8. Navigating back to Apps from the left navigation bar now shows an item for our deployment.

![Figure 9](../../.gitbook/assets/9.png)

No further action is required, endpoints will automatically download and install the uploaded software.
