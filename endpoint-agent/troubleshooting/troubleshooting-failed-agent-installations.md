# Agent Fails to Install

In most cases, failed CybrHawk agent installations occur due to connectivity issues or the installation being blocked by Endpoint Detection & Response (EDR) software. This guide outlines the most common causes and steps to resolve them.

***

### 1. Verify You Are Using the Latest Agent <a href="#id-1-verify-you-are-using-the-latest-agent" id="id-1-verify-you-are-using-the-latest-agent"></a>

* Always download the latest version of the agent from the CybrHawk portal: [https://portal.cybrhawk.com/deployment/endpoint-agent](https://portal.cybrhawk.com/deployment/endpoint-agent)

***

### 2. Check System and Network Requirements <a href="#id-2-check-system-and-network-requirements" id="id-2-check-system-and-network-requirements"></a>

* Review the System and Network Requirements section in the portal: [https://portal.cybrhawk.com/deployment/endpoint-agent](https://portal.cybrhawk.com/deployment/endpoint-agent)
* Ensure your system meets the minimum OS and hardware requirements.
* Verify that all provided IP addresses and hostnames are whitelisted on your perimeter firewall and/or proxy.
* On some enterprise firewalls (such as Palo Alto), SSL decryption can block traffic. You may need to add exceptions to SSL inspection policies. Example for Palo Alto decryption exclusions: [https://docs.paloaltonetworks.com/network-security/decryption/administration/decryption-exclusions/palo-alto-networks-predefined-decryption-exclusions#idfe9d8ac4-9a24-4cc0-a616-1f3092de7c6f](https://docs.paloaltonetworks.com/network-security/decryption/administration/decryption-exclusions/palo-alto-networks-predefined-decryption-exclusions#idfe9d8ac4-9a24-4cc0-a616-1f3092de7c6f)

***

### 3. Exclude CybrHawk Agent from EDR or Antivirus <a href="#id-3-exclude-threatdefence-agent-from-edr-or-antivirus" id="id-3-exclude-threatdefence-agent-from-edr-or-antivirus"></a>

* Some Endpoint Protection platforms may interfere with agent installation or operation.
* Add exclusions in your EDR or antivirus (e.g., Microsoft Defender, CrowdStrike) for:

```
C:\Program Files\TDAgent*`
```

***

### 4. Remove Older Agent Versions (If Applicable) <a href="#id-4-remove-older-agent-versions-if-applicable" id="id-4-remove-older-agent-versions-if-applicable"></a>

* If an older CybrHawk agent was previously installed, installation may fail until remnants are removed.
* Use the official cleanup tool before reinstalling: [here](cleanup-tool.md)

***

### 5. Collect Required Logs for Support <a href="#id-5-collect-required-logs-for-support" id="id-5-collect-required-logs-for-support"></a>

If the installation still fails after performing the above checks, please gather the following information and attach it to your support ticket:

* Tenant name
* Agent name
* Operating system
* MSI installation log
* Agent log (`C:\ProgramData\TDagent`)
* Error code or screenshot (if it was an interactive install)
