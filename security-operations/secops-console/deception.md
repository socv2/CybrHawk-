# Deception

<figure><img src="../../.gitbook/assets/Screenshot 2026-10-21 at 12.22.32 PM.png" alt=""><figcaption></figcaption></figure>

## Deception

Use decoy accounts and systems to detect attacker activity early.

### Activity

* Overview
* Trips

### Inventory

#### Honeytoken accounts (AD)

Honeytokens are two unused Active Directory decoy accounts. Any logon attempt or activity is a high-confidence signal that an attacker is probing for credentials.

**What this detects**

Once the decoy accounts exist, Cybrhawk alerts on:

* Kerberos authentication attempts
* NTLM authentication attempts
* Entra ID sign-in attempts
* Lateral movement
* Unauthorised account modification
* Privilege escalation attempts

**The two decoy accounts**

Create the accounts exactly as specified. Their names are monitored by the detections.

* Set a strong password that differs from every real account.
* Do not share either password with Cybrhawk.
* Never add either account to a real privileged group.
* Keep both accounts enabled. Make them appear as ordinary service and administrator accounts.
* Keep both accounts in **Domain Users**.
* Add only the administrator-style account to the decoy group.
* Use a decoy group name that makes the administrator-style account appear valuable. The group must have no permissions.

{% hint style="warning" %}
Neither account must belong to a real privileged group.
{% endhint %}

**Prevent interactive use**

Create a dedicated GPO named **HoneyToken**. Link it at the domain root. Assign all four deny-logon rights to both accounts.

This prevents use of the accounts if their passwords are obtained.

Configure the rights at:

`Computer Configuration` → `Policies` → `Windows Settings` → `Security Settings` → `Local Policies` → `User Rights Assignment`

#### Honeytokens (Agent)

#### Honeypots
