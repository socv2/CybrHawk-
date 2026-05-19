# Clean-up Tool

## Overview

In situations where the standard uninstallation process cannot be used, CybrHawk provides a **Cleanup Tool**. This utility completely removes the **TD\_Endpoint** software from a host system.

***

> **Caution:**\
> The cleanup script does **not** prompt for confirmation. Once executed, **TD\_Endpoint will be removed immediately**. Use this tool only when standard uninstall methods (e.g., Control Panel, command-line uninstall) are unavailable or have failed.

***

## Download

The Cleanup Tool can be downloaded here:

{% file src="../../.gitbook/assets/TD_Endpoint-Cleanup_Tool.ps1" %}

### Example Usage <a href="#example-usage" id="example-usage"></a>

```
PS /> powershell -ep bypass -f .\TD_Endpoint-Cleanup_Tool.ps1 -Uninstall -Force
```

### All Parameters <a href="#all-parameters" id="all-parameters"></a>

```
TD_Endpoint Cleanup Tool
Version 00B
 CybrHawk Pty Ltd
Copyright 2024

Usage: .\TD_Endpoint-Cleanup_Tool.ps1 [-Uninstall] [-Force] [-DisableSysmonOnly] [-SysmonDeepCleanup] [-Help]

Parameters:
  -Force               : Force uninstallation of TDAgent and removal of all residual files/keys
  -DisableSysmonOnly   : Only disable sysmon via tdcli.exe (default is false).
  -SysmonDeepCleanup   : Deep clean up sysmon and purge all residual files for it (default is false).
  -Uninstall           : Uninstall TD_Endpoint (default is false).
  -Help                : Show this help information.
```

> **Note:** Powershell must be run as administrator.
