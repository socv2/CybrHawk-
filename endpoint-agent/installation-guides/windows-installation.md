# Windows Agent

> **Note:**\
> Please check [Prerequisites and System Requirements](../prerequisites.md) before proceeding.

## Standard Installation (Windows GUI)

1. [Log in to the Customer Portal](https://portal.cybrhawk.com/deployment/endpoint-agent) and select your tenant from the dropdown list.\
   Your **Activation Code** will be displayed.
2.  Select **Windows**, then click **Generate Download Link** followed by **Click Here to Download**.

    <figure><img src="../../.gitbook/assets/Screenshot 2026-04-30 113435.png" alt="Generate Download Link" width="700"><figcaption></figcaption></figure>
3.  After the installer downloads, double-click it to launch the setup wizard. Enter your **Activation Code** from the portal and click **Next**.

    <figure><img src="../../.gitbook/assets/Screenshot 2026-04-30 113740.png" alt="MSI Activation" width="460"><figcaption></figcaption></figure>

    <figure><img src="../../.gitbook/assets/Screenshot 2026-04-30 113955.png" alt="MSI Activation Check" width="460"><figcaption></figcaption></figure>
4.  Review the Sysinternals End-User License Agreement (EULA).\
    Tick the checkbox to accept, then click **Next**.

    <figure><img src="../../.gitbook/assets/Screenshot 2026-04-30 114045.png" alt="MSI Install Sysinternals" width="460"><figcaption></figcaption></figure>

> **Note:**\
> Sysinternals are Microsoft tools used to enhance endpoint telemetry. CybrHawk recommends accepting the EULA.
>
> More information:\
> • [Sysmon | Microsoft Learn](https://learn.microsoft.com/en-us/sysinternals/downloads/sysmon)\
> • [Autoruns | Microsoft Learn](https://learn.microsoft.com/en-us/sysinternals/downloads/autoruns)

5.  (Optional) You may see an advanced option to override the Sysinternals download source. Leave this blank unless required, then click **Next**.

    <figure><img src="../../.gitbook/assets/Screenshot 2026-04-30 114310.png" alt="MSI Sysinternals Redist" width="460"><figcaption></figcaption></figure>

> **Note::**\
> For restricted/offline networks, see **Advanced Windows Install**:\
> `/docs/Deployment/Endpoint Agent/Install Guides/AdvancedWindowsInstall.md`

6.  Click **Install** to begin.

    <figure><img src="../../.gitbook/assets/Screenshot 2026-04-30 114503.png" alt="MSI Ready To Install" width="460"><figcaption></figcaption></figure>
7.  When installation completes, click **Finish**.

    <figure><img src="../../.gitbook/assets/Screenshot 2026-04-30 115531.png" alt="MSI Install Wizard Completion" width="460"><figcaption></figcaption></figure>

***

## Silent / Command-Line Installation

For unattended or scripted deployments, use `msiexec`:

```
msiexec.exe /i TD_Endpoint.msi /qn ACTIVATION_CODE=xxx SYSINTERNALS_ACCEPT_EULA=Yes
```

#### Command Line Install Options:

<table><thead><tr><th width="173">Argument</th><th width="108">Required</th><th width="221">Description</th><th width="178">Examples</th><th>Default</th></tr></thead><tbody><tr><td>ACTIVATION_CODE</td><td>Y</td><td>Unique activation code, distributed on portal</td><td></td><td>N/A</td></tr><tr><td>SYSINTERNALS_ACCEPT_EULA</td><td>N</td><td>Accepts the Sysinternals software license terms available <a href="https://learn.microsoft.com/en-us/sysinternals/license-terms">here</a>.</td><td>SYSINTERNALS_ACCEPT_EULA=Yes</td><td>No</td></tr><tr><td>REDIST</td><td>N</td><td>URL or Local directory path to pre-downloaded Sysinternals binaries. For use in restricted networks. See our article, <a href="windows-installation.md#advanced-installation-group-policy">Redist Override</a>, for more info.</td><td>REDIST=<a href="http://web01.mycompany.com/td">http://web01.mycompany.com/td</a><br>REDIST=C:\windows\temp\td</td><td>N/A</td></tr><tr><td>AUTO_UPDATE</td><td>N</td><td>Disable the automatic updater.</td><td><code>AUTO_UPDATE=No</code></td><td>N/A</td></tr></tbody></table>

### Uninstalling Windows Agent

1. Go to **“Apps"** then **"Installed apps”**.
2. Type **“TD\_Endpoint”**, choose TD\_Endpoint, and click **“Uninstall”**.

<figure><img src="../../.gitbook/assets/Screenshot 2026-04-30 120639.png" alt="Uninstall" width="700"><figcaption></figcaption></figure>

### Advanced Installation - Group Policy

For enterprise deployments, see our article on [MSI Transform files](deploying-via-intune.md)

### Advanced Uninstall - Command Line / Silent

1. Open PowerShell by pressing `Windows Key + X` and select `Windows PowerShell (Admin)`.

<figure><img src="../../.gitbook/assets/Screenshot 2026-04-30 121053.png" alt="Windows PowerShell" width="600"><figcaption></figcaption></figure>

2. Retrieve the application's `IdentifyingNumber` by entering `Get-WmiObject Win32_Product`

<figure><img src="../../.gitbook/assets/Screenshot 2026-04-30 121532.png" alt="Retrieve the Application Key" width="650"><figcaption></figcaption></figure>

3. Uninstall the application using the following command, replacing `IdentifyingNumber` with that retrieved in the previous step:

```powershell
msiexec.exe /x "<IdentifyingNumber>" /qn
```

Ensure you enclose the **IdentifyingNumber** with double quotes. e.g.

```powershell
msiexec.exe /x "{3638F48F-EB6C-4761-87E6-5B7E3C236BB2}" /qn
```

<figure><img src="../../.gitbook/assets/Screenshot 2026-04-30 122117.png" alt="Uninstall the Application" width="600"><figcaption></figcaption></figure>

The TD\_Endpoint agent will now be uninstalled from your system.

### Post-Installation Configuration Options

tdcli.exe is located in `C:\Program Files\TDagent\tdcli\tdcli.exe` and accepts several command-line options to modify existing installations:

| Argument             | Description                                                                                                                                                                   | Example                                                 |
| -------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------- |
| upgrade-sysinternals | Upgrades sysmon to the latest available at [https://live.sysinternals.com/](https://live.sysinternals.com/). `Note: Will be overridden by REDIST path if set during install.` | C:\Program Files\TDagent\tdcli.exe upgrade-sysinternals |
| disable-sysinternals | Uninstalls and disables Sysinternals binaries.                                                                                                                                | C:\Program Files\TDagent\tdcli.exe disable-sysinternals |
| enable-sysinternals  | Installs and enables Sysinternals binaries.                                                                                                                                   | C:\Program Files\TDagent\tdcli.exe enable-sysinternals  |
