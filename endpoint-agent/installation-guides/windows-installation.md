# Windows Agent

> **Note:**\
> Please check [Prerequisites and System Requirements](../prerequisites.md) before proceeding.

## Standard Installation (Windows GUI)

1. [Log in to the Customer Portal](https://portal.cybrhawk.com/deployment/endpoint-agent) and select your tenant from the dropdown list.\
   Your **Activation Code** will be displayed.
2.  Select **Windows**, then click **Generate Download Link** followed by **Click Here to Download**.

    ![Generate Download Link](<../../.gitbook/assets/Screenshot 2026-04-30 113435.png>)
3.  After the installer downloads, double-click it to launch the setup wizard. Enter your **Activation Code** from the portal and click **Next**.

    ![MSI Activation](<../../.gitbook/assets/Screenshot 2026-04-30 113740.png>)

    ![MSI Activation Check](<../../.gitbook/assets/Screenshot 2026-04-30 113955.png>)
4.  Review the Sysinternals End-User License Agreement (EULA).\
    Tick the checkbox to accept, then click **Next**.

    ![MSI Install Sysinternals](<../../.gitbook/assets/Screenshot 2026-04-30 114045.png>)

> **Note:**\
> Sysinternals are Microsoft tools used to enhance endpoint telemetry. CybrHawk recommends accepting the EULA.
>
> More information:\
> • [Sysmon | Microsoft Learn](https://learn.microsoft.com/en-us/sysinternals/downloads/sysmon)\
> • [Autoruns | Microsoft Learn](https://learn.microsoft.com/en-us/sysinternals/downloads/autoruns)

5.  (Optional) You may see an advanced option to override the Sysinternals download source. Leave this blank unless required, then click **Next**.

    ![MSI Sysinternals Redist](<../../.gitbook/assets/Screenshot 2026-04-30 114310.png>)

> **Note::**\
> For restricted/offline networks, see **Advanced Windows Install**:\
> `/docs/Deployment/Endpoint Agent/Install Guides/AdvancedWindowsInstall.md`

6.  Click **Install** to begin.

    ![MSI Ready To Install](<../../.gitbook/assets/Screenshot 2026-04-30 114503.png>)
7.  When installation completes, click **Finish**.

    ![MSI Install Wizard Completion](<../../.gitbook/assets/Screenshot 2026-04-30 115531.png>)

***

## Silent / Command-Line Installation

For unattended or scripted deployments, use `msiexec`:

```
msiexec.exe /i TD_Endpoint.msi /qn ACTIVATION_CODE=xxx SYSINTERNALS_ACCEPT_EULA=Yes
```

#### Command Line Install Options:

| Argument                   | Required | Description                                                                                                                                                                                                         | Examples                                                                                                             | Default |
| -------------------------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- | ------- |
| ACTIVATION\_CODE           | Y        | Unique activation code, distributed on portal                                                                                                                                                                       |                                                                                                                      | N/A     |
| SYSINTERNALS\_ACCEPT\_EULA | N        | Accepts the Sysinternals software license terms available [here](https://learn.microsoft.com/en-us/sysinternals/license-terms).                                                                                     | SYSINTERNALS\_ACCEPT\_EULA=Yes                                                                                       | No      |
| REDIST                     | N        | URL or Local directory path to pre-downloaded Sysinternals binaries. For use in restricted networks. See our article, [Redist Override](windows-installation.md#advanced-installation-group-policy), for more info. | <p>REDIST=<a href="http://web01.mycompany.com/td">http://web01.mycompany.com/td</a><br>REDIST=C:\windows\temp\td</p> | N/A     |
| AUTO\_UPDATE               | N        | Disable the automatic updater.                                                                                                                                                                                      | `AUTO_UPDATE=No`                                                                                                     | N/A     |

### Uninstalling Windows Agent

1. Go to **“Apps & Features"** or **"Add/Remove Programs”**.
2. Type **“TD\_Endpoint”**, choose TD\_Endpoint and click **“Uninstall”**.

![uninstall](<../../.gitbook/assets/Screenshot 2026-04-30 120639.png>)

### Advanced Installation - Group Policy

For enterprise deployments, see our article on [MSI Transform files](deploying-via-intune.md)

### Advanced Uninstall - Command Line / Silent

1. Open PowerShell by pressing `Windows Key + X` and select `Windows PowerShell (Admin)`.

![Windows PowerShell](<../../.gitbook/assets/Screenshot 2026-04-30 121053.png>)

2. Retrieve the application's `IdentifyingNumber` by entering `Get-WmiObject Win32_Product`

![Retrieve the Application Key](<../../.gitbook/assets/Screenshot 2026-04-30 121532.png>)

3. Uninstall the application using the following command, replacing `IdentifyingNumber` with that retrieved in the previous step:

```powershell
msiexec.exe /x "<IdentifyingNumber>" /qn
```

Ensure you enclose the **IdentifyingNumber** with double quotes. e.g.

```powershell
msiexec.exe /x "{3357A676-12AA-42AB-ADF3-A3DC3E0EA726}" /qn
```

![Uninstall the Application](<../../.gitbook/assets/Screenshot 2026-04-30 122117.png>)

TD\_Endpoint agent will now be uninstalled from your system.

### Post-Installation Configuration Options

tdcli.exe is located in `C:\Program Files\TDagent\tdcli\tdcli.exe` and accepts several command-line options to modify existing installations:

| Argument             | Description                                                                                                                                                                   | Example                                                 |
| -------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------- |
| upgrade-sysinternals | Upgrades sysmon to the latest available at [https://live.sysinternals.com/](https://live.sysinternals.com/). `Note: Will be overridden by REDIST path if set during install.` | C:\Program Files\TDagent\tdcli.exe upgrade-sysinternals |
| disable-sysinternals | Uninstalls and disables Sysinternals binaries.                                                                                                                                | C:\Program Files\TDagent\tdcli.exe disable-sysinternals |
| enable-sysinternals  | Installs and enables Sysinternals binaries.                                                                                                                                   | C:\Program Files\TDagent\tdcli.exe enable-sysinternals  |
