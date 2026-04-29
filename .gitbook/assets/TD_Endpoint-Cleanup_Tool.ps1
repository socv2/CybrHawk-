
param (
    [switch]$Force,
    [switch]$SysmonDeepCleanup = $false,
    [switch]$DisableSysmonOnly = $false,
    [switch]$Uninstall = $false,
    [switch]$Help
)

function PrintHelp {
    Write-Output "Usage: .\TD_Endpoint-Cleanup_Tool.ps1 [-Uninstall] [-Force] [-DisableSysmonOnly] [-SysmonDeepCleanup] [-Help]"
    Write-Output ""
    Write-Output "Parameters:"
    Write-Output "  -Force               : Force uninstallation of TDAgent and removal of all residual files/keys"
    Write-Output "  -DisableSysmonOnly   : Only disable sysmon via tdcli.exe (default is false)."
    Write-Output "  -SysmonDeepCleanup   : Deep clean up sysmon and purge all residual files for it (default is false)."
    Write-Output "  -Uninstall           : Uninstall TD_Endpoint (default is false)."
    Write-Output "  -Help                : Show this help information."
}


Write-Output ""
Write-Output "TD_Endpoint Cleanup Tool"
Write-Output "Version 00B"
Write-Output "ThreatDefence Pty Ltd"
Write-Output "Copyright 2024"
Write-Output ""

if ($Help) {
    PrintHelp
    exit
}

#Variables

$uninstallSuccessful = $false
$registryTDAgent = "HKLM:\SOFTWARE\ThreatDefence\TDAgent"
$expectedName = "TD_Endpoint"
$registryKeyPath = "HKLM:\SOFTWARE\ThreatDefence"
$scheduledTaskFolderPath = "\ThreatDefence\"


if ($Force) {
    $uninstallSuccessful = $true
    Write-Output "Starting Force clean up"
}

$currentVersion = (Get-ItemProperty -Path $registryTDAgent -Name "CurrentVersion" -ErrorAction SilentlyContinue).CurrentVersion

if ($null -eq $currentVersion) {
    Write-Output "No version found in the registry at '$registryTDAgent\CurrentVersion'."
} else {
    Write-Output "Installed TDAgent version: $currentVersion"

    # Initialize the version variable
    $version = $null

    # Determine the version based on the starting digits
    if ($currentVersion.StartsWith("5")) {
        $version = "5.x"
    } elseif ($currentVersion.StartsWith("6.0")) {
        $version = "6.0"
    } elseif ($currentVersion.StartsWith("6.1")) {
        $version = "6.1"
    }

}

function SysmonDisable {
    param (
        [string]$version
    )

    if ($version -eq "6.0" -or $version -eq "6.1") {
        Write-Output "Disabling Sysmon via tdcli.exe"
        $filePath = "C:\Program Files\TDAgent\tdcli\tdcli.exe"
        if (Test-Path -Path $filePath) {
            try {
                Start-Process -FilePath $filePath -ArgumentList "disable-sysinternals" -Wait -NoNewWindow
                Write-Output "Sysmon disabled successfully."
            } catch {
                Write-Error "Failed to run the command: $_"
            }
        } else {
            Write-Output "$filePath not found"
        }
    } elseif ($version -eq "5.x") {
        $sysmonPath = Join-Path -Path $env:SystemDrive -ChildPath "Program Files\TDAgent\sysmon\sysmon.exe"
        $disabledSysmonPath = Join-Path -Path $env:SystemDrive -ChildPath "Program Files\TDAgent\sysmon\sysmon.exe.off"
        if (Test-Path -Path $sysmonPath) {
            Start-Process -FilePath $sysmonPath -ArgumentList "-u force" -Wait -NoNewWindow
            Rename-Item -Path $sysmonPath -NewName $disabledSysmonPath -Force
            Write-Output "Sysmon disabled successfully using sysmon.exe."
        } else {
            Write-Output "$sysmonPath not found"
        }
    } else {
        Write-Output "Version '$version' not supported by the script."
    }
}

function DeleteService {
    param (
        [string]$svc
    )

    Stop-Service -Name $svc -Force -ErrorAction SilentlyContinue
    Get-WmiObject -Class Win32_Service -Filter "Name='$svc'" | ForEach-Object { $_.Delete() | Out-Null }
}

if ($DisableSysmonOnly) {
    SysmonDisable -version $version
    exit
}

if ($Uninstall) {
    #
    # Regular MSI Uninstallation Sequence Attempt
    #
    $app = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -like "*$expectedName*" }

    if ($app) {
        Write-Output "Application '$expectedName' found. Uninstalling..."
        try {
            # Uninstall the application
            $app.Uninstall() | Out-Null
            Write-Output "Uninstallation completed successfully."
            $uninstallSuccessful = $true

        } catch {
            Write-Error "Failed to uninstall the application: $_"
        }
    } else {
        Write-Output "No application found with name $expectedName"
    }

    if ($uninstallSuccessful) {
        Write-Output "Proceeding with the remaining tasks..."

        #
        # Registry Key Deletion
        #
        if (Test-Path -Path $registryKeyPath) {
            Write-Output "Registry key '$registryKeyPath' found. Deleting..."
            try {
                Remove-Item -Path $registryKeyPath -Recurse -Force
                Write-Output "Registry key deleted successfully."
            } catch {
                Write-Error "Failed to delete the registry key: $_"
            }
        } else {
            Write-Output "Registry key '$registryKeyPath' does not exist."
        }

        #
        # Scheduled Task Deletion
        #

        $tasks = Get-ScheduledTask | Where-Object { $_.TaskPath -eq $scheduledTaskFolderPath }

        if ($tasks) {
            Write-Output "Scheduled task folder '$scheduledTaskFolderPath' found. Unregistering tasks..."
            try {
                foreach ($task in $tasks) {
                    Unregister-ScheduledTask -TaskName $task.TaskName -TaskPath $task.TaskPath -Confirm:$false
                    Write-Output "Task '$($task.TaskName)' unregistered."
                }

                $remainingTasks = Get-ScheduledTask | Where-Object { $_.TaskPath -eq $scheduledTaskFolderPath }
                if (-not $remainingTasks) {
                    Write-Output "Scheduled task folder '$scheduledTaskFolderPath' is now empty. Deleting folder..."
                } else {
                    Write-Output "Scheduled task folder '$scheduledTaskFolderPath' still contains tasks. Will not delete."
                }
            } catch {
                Write-Error "Failed to unregister tasks or manage the folder: $_"
            }
        } else {
            Write-Output "Scheduled task folder '$scheduledTaskFolderPath' does not exist or is already empty."
        }

        #
        # Program Files Deletion
        #
        $path = Join-Path -Path $env:SystemDrive -ChildPath "Program Files\TDAgent"

        if (Test-Path -Path $path) {
            Remove-Item -LiteralPath $path -Recurse -Force
            Write-Output "Purging Program Files..."
        } else {
            Write-Output "Path does not exist: $path"
        }
        #
        # ProgramData Deletion
        #
        $path = Join-Path -Path $env:SystemDrive -ChildPath "ProgramData\TDAgent"

        if (Test-Path -Path $path) {
            Remove-Item -LiteralPath $path -Recurse -Force
            Write-Output "Purging ProgramData..."
        } else {
            Write-Output "Path does not exist: $path"
        }
    }
    
    # Check if any services are left behind
    $servicesToCheck = @("wazuhsvc", "TD Velo", "tdsvc-watchdog", "tdagentbs", "tdtlssvc", "sysmon")
    foreach ($service in $servicesToCheck) {
        if (Get-Service -Name $service -ErrorAction SilentlyContinue) {
            Write-Output "Service '$service' is still installed. Uninstalling it from the system"
            DeleteService -svc $service
        }
    }

    Write-Output ""
    Write-Output "TD_Endpoint removal complete. Goodbye."
    Write-Output ""
    exit
}

if ($SysmonDeepCleanup) {
    Write-Output "Attempting to uninstall sysmon first"
    SysmonDisable -version $version
    $sysmonPath = Join-Path -Path $env:SystemDrive -ChildPath "Windows\sysmon.exe"
    if (Test-Path -Path $sysmonPath) {
        Start-Process -FilePath $sysmonPath -ArgumentList "-u force" -Wait -NoNewWindow
        Write-Output "Cleaning sysmon residual files"
        $items = @(
            "HKLM:\SYSTEM\CurrentControlSet\Services\Sysmon64",
            "HKLM:\SYSTEM\CurrentControlSet\Services\SysmonDrv",
            "HKLM:\SYSTEM\ControlSet001\Services\Sysmon64",
            "HKLM:\SYSTEM\ControlSet001\Services\SysmonDrv",
            "HKLM:\SYSTEM\ControlSet002\Services\Sysmon64",
            "HKLM:\SYSTEM\ControlSet002\Services\SysmonDrv",
            "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Sysmon/Operational",
            "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Publishers\{5770385f-c22a-43e0-bf4c-06f5698ffbd9}",
            "HKLM:\SYSTEM\CurrentControlSet\Control\WMI\Autologger\EventLog-Microsoft-Windows-Sysmon-Operational"
        )

        foreach ( $i in $items ) {
            $error.Clear();
            Remove-Item -Path $i -Force -Recurse -ErrorAction SilentlyContinue
            
        }
        Write-Output ""
        Write-Output "Registry Keys removed, reboot the system then delete C:\Windows\SysmonDrv.sys and C:\Windows\Sysmon.exe to completely remove sysmon. For more info: https://www.jamesgibbins.com/posts/sysmon-install/#the-solution"
    }
    Write-Output "Sysmon cleanup complete"
    exit
}


if ($args.Count -eq 0) { 
    PrintHelp 
    exit
}


# SIG # Begin signature block
# MIIpfwYJKoZIhvcNAQcCoIIpcDCCKWwCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCD27aXqmAuh8goN
# np5wWp8rhBz8ayBI0d2bHPYkJDYseKCCDnIwggawMIIEmKADAgECAhAIrUCyYNKc
# TJ9ezam9k67ZMA0GCSqGSIb3DQEBDAUAMGIxCzAJBgNVBAYTAlVTMRUwEwYDVQQK
# EwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xITAfBgNV
# BAMTGERpZ2lDZXJ0IFRydXN0ZWQgUm9vdCBHNDAeFw0yMTA0MjkwMDAwMDBaFw0z
# NjA0MjgyMzU5NTlaMGkxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwg
# SW5jLjFBMD8GA1UEAxM4RGlnaUNlcnQgVHJ1c3RlZCBHNCBDb2RlIFNpZ25pbmcg
# UlNBNDA5NiBTSEEzODQgMjAyMSBDQTEwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAw
# ggIKAoICAQDVtC9C0CiteLdd1TlZG7GIQvUzjOs9gZdwxbvEhSYwn6SOaNhc9es0
# JAfhS0/TeEP0F9ce2vnS1WcaUk8OoVf8iJnBkcyBAz5NcCRks43iCH00fUyAVxJr
# Q5qZ8sU7H/Lvy0daE6ZMswEgJfMQ04uy+wjwiuCdCcBlp/qYgEk1hz1RGeiQIXhF
# LqGfLOEYwhrMxe6TSXBCMo/7xuoc82VokaJNTIIRSFJo3hC9FFdd6BgTZcV/sk+F
# LEikVoQ11vkunKoAFdE3/hoGlMJ8yOobMubKwvSnowMOdKWvObarYBLj6Na59zHh
# 3K3kGKDYwSNHR7OhD26jq22YBoMbt2pnLdK9RBqSEIGPsDsJ18ebMlrC/2pgVItJ
# wZPt4bRc4G/rJvmM1bL5OBDm6s6R9b7T+2+TYTRcvJNFKIM2KmYoX7BzzosmJQay
# g9Rc9hUZTO1i4F4z8ujo7AqnsAMrkbI2eb73rQgedaZlzLvjSFDzd5Ea/ttQokbI
# YViY9XwCFjyDKK05huzUtw1T0PhH5nUwjewwk3YUpltLXXRhTT8SkXbev1jLchAp
# QfDVxW0mdmgRQRNYmtwmKwH0iU1Z23jPgUo+QEdfyYFQc4UQIyFZYIpkVMHMIRro
# OBl8ZhzNeDhFMJlP/2NPTLuqDQhTQXxYPUez+rbsjDIJAsxsPAxWEQIDAQABo4IB
# WTCCAVUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUaDfg67Y7+F8Rhvv+
# YXsIiGX0TkIwHwYDVR0jBBgwFoAU7NfjgtJxXWRM3y5nP+e6mK4cD08wDgYDVR0P
# AQH/BAQDAgGGMBMGA1UdJQQMMAoGCCsGAQUFBwMDMHcGCCsGAQUFBwEBBGswaTAk
# BggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29tMEEGCCsGAQUFBzAC
# hjVodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRUcnVzdGVkUm9v
# dEc0LmNydDBDBgNVHR8EPDA6MDigNqA0hjJodHRwOi8vY3JsMy5kaWdpY2VydC5j
# b20vRGlnaUNlcnRUcnVzdGVkUm9vdEc0LmNybDAcBgNVHSAEFTATMAcGBWeBDAED
# MAgGBmeBDAEEATANBgkqhkiG9w0BAQwFAAOCAgEAOiNEPY0Idu6PvDqZ01bgAhql
# +Eg08yy25nRm95RysQDKr2wwJxMSnpBEn0v9nqN8JtU3vDpdSG2V1T9J9Ce7FoFF
# UP2cvbaF4HZ+N3HLIvdaqpDP9ZNq4+sg0dVQeYiaiorBtr2hSBh+3NiAGhEZGM1h
# mYFW9snjdufE5BtfQ/g+lP92OT2e1JnPSt0o618moZVYSNUa/tcnP/2Q0XaG3Ryw
# YFzzDaju4ImhvTnhOE7abrs2nfvlIVNaw8rpavGiPttDuDPITzgUkpn13c5Ubdld
# AhQfQDN8A+KVssIhdXNSy0bYxDQcoqVLjc1vdjcshT8azibpGL6QB7BDf5WIIIJw
# 8MzK7/0pNVwfiThV9zeKiwmhywvpMRr/LhlcOXHhvpynCgbWJme3kuZOX956rEnP
# LqR0kq3bPKSchh/jwVYbKyP/j7XqiHtwa+aguv06P0WmxOgWkVKLQcBIhEuWTatE
# QOON8BUozu3xGFYHKi8QxAwIZDwzj64ojDzLj4gLDb879M4ee47vtevLt/B3E+bn
# KD+sEq6lLyJsQfmCXBVmzGwOysWGw/YmMwwHS6DTBwJqakAwSEs0qFEgu60bhQji
# WQ1tygVQK+pKHJ6l/aCnHwZ05/LWUpD9r4VIIflXO7ScA+2GRfS0YW6/aOImYIbq
# yK+p/pQd52MbOoZWeE4wgge6MIIFoqADAgECAhAGWnE+YaYLg6mShH/PZM4MMA0G
# CSqGSIb3DQEBCwUAMGkxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwg
# SW5jLjFBMD8GA1UEAxM4RGlnaUNlcnQgVHJ1c3RlZCBHNCBDb2RlIFNpZ25pbmcg
# UlNBNDA5NiBTSEEzODQgMjAyMSBDQTEwHhcNMjQwNDI0MDAwMDAwWhcNMjUwNTAy
# MjM1OTU5WjCBwjETMBEGCysGAQQBgjc8AgEDEwJBVTEdMBsGA1UEDwwUUHJpdmF0
# ZSBPcmdhbml6YXRpb24xFDASBgNVBAUTCzE1OCAwMTQgMTY1MQswCQYDVQQGEwJB
# VTEYMBYGA1UECBMPTmV3IFNvdXRoIFdhbGVzMQ8wDQYDVQQHEwZTeWRuZXkxHjAc
# BgNVBAoTFVRocmVhdERlZmVuY2UgUHR5IEx0ZDEeMBwGA1UEAxMVVGhyZWF0RGVm
# ZW5jZSBQdHkgTHRkMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAsQ4C
# KJvbuN8EHmPGjmnD2lzqHjurwwCw5hg+ht5XzH7UFcp/QYl9ii5MThoDvfn41o9t
# QWD/TVBj2/YN0dg7FNiZAo0B9emJ0h2EwL/tQLGY8t4WEL3K42pD18gtv64KUA5S
# vGLvlbJHfug6JT0YMabjkIZaj+Z/FcAQ3LCBXgpiFbA0RP1+dEXI8sIY4YmxUaYx
# OWni9K3Td7+DoL9Wu2LbzJbv+IgOLcQFhpX5dS+zMmElxa7uanS0vxFD3Xunmnpb
# 53WpZZEcIOvixeQ2XoOJxnhCKmBYFuqx02GOE/0MFtBVNYSw7zPFTKW33qSj92Hr
# 5tI8w+/AW7RAyURbqDZJk1pJUpxBHIUtu3vUpU40pOM3wummr4i8Om1iT5E4gLzG
# uO3xFYWWU1vaKfFCR2j6DefnwgCZ/gERhQSarT7wpLumv5wWEv0RWxwyi08ixaxB
# CUSpEVwYb8ySgtW+35lG+5GBvTF/ExJiwXvQZ95etpceaxzXvJyYeExNrR3mB39y
# T3ZNgR3yKDvgpZ3fu6T3xcMjBJX9zyBL3pY3ZiChHvXQACf1wJkwFs65ltH+0e12
# +U+vvI6ll13C+fMvHJ+lSMcZmRjpIxdSgcIHoWuM+4MkcSupQxRPLOPa0ZrHAHJJ
# rX8f4fTbuFVR9esE1NYv1J35ifD7/67y5SCG5dUCAwEAAaOCAgIwggH+MB8GA1Ud
# IwQYMBaAFGg34Ou2O/hfEYb7/mF7CIhl9E5CMB0GA1UdDgQWBBSl/hFlQnD5ScxO
# oPs/S2FYXpNJKDA9BgNVHSAENjA0MDIGBWeBDAEDMCkwJwYIKwYBBQUHAgEWG2h0
# dHA6Ly93d3cuZGlnaWNlcnQuY29tL0NQUzAOBgNVHQ8BAf8EBAMCB4AwEwYDVR0l
# BAwwCgYIKwYBBQUHAwMwgbUGA1UdHwSBrTCBqjBToFGgT4ZNaHR0cDovL2NybDMu
# ZGlnaWNlcnQuY29tL0RpZ2lDZXJ0VHJ1c3RlZEc0Q29kZVNpZ25pbmdSU0E0MDk2
# U0hBMzg0MjAyMUNBMS5jcmwwU6BRoE+GTWh0dHA6Ly9jcmw0LmRpZ2ljZXJ0LmNv
# bS9EaWdpQ2VydFRydXN0ZWRHNENvZGVTaWduaW5nUlNBNDA5NlNIQTM4NDIwMjFD
# QTEuY3JsMIGUBggrBgEFBQcBAQSBhzCBhDAkBggrBgEFBQcwAYYYaHR0cDovL29j
# c3AuZGlnaWNlcnQuY29tMFwGCCsGAQUFBzAChlBodHRwOi8vY2FjZXJ0cy5kaWdp
# Y2VydC5jb20vRGlnaUNlcnRUcnVzdGVkRzRDb2RlU2lnbmluZ1JTQTQwOTZTSEEz
# ODQyMDIxQ0ExLmNydDAJBgNVHRMEAjAAMA0GCSqGSIb3DQEBCwUAA4ICAQBrHJjX
# ocalmB6x15pcp/lBKtmvS+jC6Go5Y6eLscHbT+OQd71VjLf2GNWVGdlK2sEWjYuS
# utRflMT76rRokCSPJ1WO3wvFTSiH+7BVf6jfHL8o+cbdjlWG0PIU7AXTR5eHcRUi
# Thmcyo2NLq4r85IpNQylf62PrQzwGMQYuXYnOwvTe0XnBBLvSJeQu1AADI4AKrPT
# 3W+S9esxBMclJ17e7d+ub2DuK8WeBT5CEaoMkjoiciRo39uYddoJOFbQNl2E/BAN
# 2JEL/l+saoaka//WqrB2HFHlZGLo8Hv0q0f6uIzQOYvWQ687N1Kir7ZM3WB8vXuq
# Yw0IZOl9mgsMcC4J6OSz4VUO7cZLrsQ1ENYrOZUlYKwRezd+9SbqzLhDM1QvsCqL
# Mv2uooJVkIPKx5/7BRTy5dCc3R5BZToHac971DXrBDRzrRfrW+X7wXewK3wMhSyl
# wXB1QHb4XIVbDjgJqyrR7MSUGlUPd6y1+FrcG5JHvGprVcUnCTPtQF9axo1Y9vR5
# 9a5S1MeaKL9EVwa1hkERN+e/S7m084UuXD6qDhGIR4LuAkIIeNgCLjEro4r8WXNo
# kI7h4PoIQEOUO7TpEcTT6QwzmzpB5SYwy5ADLAd6Sytg3ngvJeFUJssXyvY+SOH9
# dq1SMSx1XRzl84CY8AUtYr8V22vDvdZaeLPlSTGCGmMwghpfAgEBMH0waTELMAkG
# A1UEBhMCVVMxFzAVBgNVBAoTDkRpZ2lDZXJ0LCBJbmMuMUEwPwYDVQQDEzhEaWdp
# Q2VydCBUcnVzdGVkIEc0IENvZGUgU2lnbmluZyBSU0E0MDk2IFNIQTM4NCAyMDIx
# IENBMQIQBlpxPmGmC4OpkoR/z2TODDANBglghkgBZQMEAgEFAKB8MBAGCisGAQQB
# gjcCAQwxAjAAMBkGCSqGSIb3DQEJAzEMBgorBgEEAYI3AgEEMBwGCisGAQQBgjcC
# AQsxDjAMBgorBgEEAYI3AgEVMC8GCSqGSIb3DQEJBDEiBCD+6J2iffRZunxR67E/
# AKZ2FhHbI1wE/X/8e6jZ/B/hxzANBgkqhkiG9w0BAQEFAASCAgCOSQP2wBb6JwgD
# XotHpztuN/w+Y1NfKhAykUfXS8oF2hxjy/RaHjGuGZ1/TYXo8oyuWvhokYdVgegl
# f9yr4GjUBK7f90tAlDkZArPjEsB32cso2KEL5NEQsnqzzMJakqCHiWANal6i2psu
# VJiyBUxVi7+7GkJR0RqJBzpaYNHb4qLZ22VC0woXlvQiLAtb7hc/vnCGpoV1i8qi
# QLVb7D3xjQhmCOJdEPP/bsn6/Nb4/j3z1umyAjVuKCE8KOt3hb0jBjmqCdiXXv0A
# UB4OP2jvb726kClr2rFhqTvoRIhF3deso0Zt1HAuEg1Bv/wgPjRugOSzi57t7RHR
# 07Oovg4TVvdGW9rsB9h14VxEOPOkDxECkIks7fIU575K1CIe/WgspNBp64xh2o8+
# UAjf5mch+kRBVtDRzjzY5PSwRedLwtke/VtyGmWCtghxiiYsu/6i7ojVacuclz67
# wehWo9tJw74LmXMpo+meuTWIwvKAt3R42cWPKFWiELYK+rpVJV3GiFNrVx1fE24Q
# lOUV0LhmYD/ZIzfL/frdXYq56lKHgkjYV6kDU9l/8f9739BE35oG3V9BPkxdULiu
# RbKCauf15EBUGHBCGLwsZ9qrBJf62Exz5T+oCR+CGZ1wMpofqEzUHNGjYgnuYXqo
# kq0oSb88OxieUkrn3k/9IFHzyNaasaGCFzkwghc1BgorBgEEAYI3AwMBMYIXJTCC
# FyEGCSqGSIb3DQEHAqCCFxIwghcOAgEDMQ8wDQYJYIZIAWUDBAIBBQAwdwYLKoZI
# hvcNAQkQAQSgaARmMGQCAQEGCWCGSAGG/WwHATAxMA0GCWCGSAFlAwQCAQUABCDs
# u0W63Y+HDMKjvwDpBYBJSr/5HetKEIb79D/WihxD9AIQdV4KHPbxKgcZeeGkqTBo
# HRgPMjAyNDEwMTYwNDQ4MjVaoIITAzCCBrwwggSkoAMCAQICEAuuZrxaun+Vh8b5
# 6QTjMwQwDQYJKoZIhvcNAQELBQAwYzELMAkGA1UEBhMCVVMxFzAVBgNVBAoTDkRp
# Z2lDZXJ0LCBJbmMuMTswOQYDVQQDEzJEaWdpQ2VydCBUcnVzdGVkIEc0IFJTQTQw
# OTYgU0hBMjU2IFRpbWVTdGFtcGluZyBDQTAeFw0yNDA5MjYwMDAwMDBaFw0zNTEx
# MjUyMzU5NTlaMEIxCzAJBgNVBAYTAlVTMREwDwYDVQQKEwhEaWdpQ2VydDEgMB4G
# A1UEAxMXRGlnaUNlcnQgVGltZXN0YW1wIDIwMjQwggIiMA0GCSqGSIb3DQEBAQUA
# A4ICDwAwggIKAoICAQC+anOf9pUhq5Ywultt5lmjtej9kR8YxIg7apnjpcH9CjAg
# QxK+CMR0Rne/i+utMeV5bUlYYSuuM4vQngvQepVHVzNLO9RDnEXvPghCaft0djvK
# KO+hDu6ObS7rJcXa/UKvNminKQPTv/1+kBPgHGlP28mgmoCw/xi6FG9+Un1h4eN6
# zh926SxMe6We2r1Z6VFZj75MU/HNmtsgtFjKfITLutLWUdAoWle+jYZ49+wxGE1/
# UXjWfISDmHuI5e/6+NfQrxGFSKx+rDdNMsePW6FLrphfYtk/FLihp/feun0eV+pI
# F496OVh4R1TvjQYpAztJpVIfdNsEvxHofBf1BWkadc+Up0Th8EifkEEWdX4rA/FE
# 1Q0rqViTbLVZIqi6viEk3RIySho1XyHLIAOJfXG5PEppc3XYeBH7xa6VTZ3rOHNe
# iYnY+V4j1XbJ+Z9dI8ZhqcaDHOoj5KGg4YuiYx3eYm33aebsyF6eD9MF5IDbPgjv
# wmnAalNEeJPvIeoGJXaeBQjIK13SlnzODdLtuThALhGtyconcVuPI8AaiCaiJnfd
# zUcb3dWnqUnjXkRFwLtsVAxFvGqsxUA2Jq/WTjbnNjIUzIs3ITVC6VBKAOlb2u29
# Vwgfta8b2ypi6n2PzP0nVepsFk8nlcuWfyZLzBaZ0MucEdeBiXL+nUOGhCjl+QID
# AQABo4IBizCCAYcwDgYDVR0PAQH/BAQDAgeAMAwGA1UdEwEB/wQCMAAwFgYDVR0l
# AQH/BAwwCgYIKwYBBQUHAwgwIAYDVR0gBBkwFzAIBgZngQwBBAIwCwYJYIZIAYb9
# bAcBMB8GA1UdIwQYMBaAFLoW2W1NhS9zKXaaL3WMaiCPnshvMB0GA1UdDgQWBBSf
# VywDdw4oFZBmpWNe7k+SH3agWzBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3Js
# My5kaWdpY2VydC5jb20vRGlnaUNlcnRUcnVzdGVkRzRSU0E0MDk2U0hBMjU2VGlt
# ZVN0YW1waW5nQ0EuY3JsMIGQBggrBgEFBQcBAQSBgzCBgDAkBggrBgEFBQcwAYYY
# aHR0cDovL29jc3AuZGlnaWNlcnQuY29tMFgGCCsGAQUFBzAChkxodHRwOi8vY2Fj
# ZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRUcnVzdGVkRzRSU0E0MDk2U0hBMjU2
# VGltZVN0YW1waW5nQ0EuY3J0MA0GCSqGSIb3DQEBCwUAA4ICAQA9rR4fdplb4ziE
# EkfZQ5H2EdubTggd0ShPz9Pce4FLJl6reNKLkZd5Y/vEIqFWKt4oKcKz7wZmXa5V
# gW9B76k9NJxUl4JlKwyjUkKhk3aYx7D8vi2mpU1tKlY71AYXB8wTLrQeh83pXnWw
# wsxc1Mt+FWqz57yFq6laICtKjPICYYf/qgxACHTvypGHrC8k1TqCeHk6u4I/VBQC
# 9VK7iSpU5wlWjNlHlFFv/M93748YTeoXU/fFa9hWJQkuzG2+B7+bMDvmgF8VlJt1
# qQcl7YFUMYgZU1WM6nyw23vT6QSgwX5Pq2m0xQ2V6FJHu8z4LXe/371k5QrN9FQB
# hLLISZi2yemW0P8ZZfx4zvSWzVXpAb9k4Hpvpi6bUe8iK6WonUSV6yPlMwerwJZP
# /Gtbu3CKldMnn+LmmRTkTXpFIEB06nXZrDwhCGED+8RsWQSIXZpuG4WLFQOhtloD
# RWGoCwwc6ZpPddOFkM2LlTbMcqFSzm4cd0boGhBq7vkqI1uHRz6Fq1IX7TaRQuR+
# 0BGOzISkcqwXu7nMpFu3mgrlgbAW+BzikRVQ3K2YHcGkiKjA4gi4OA/kz1YCsdhI
# BHXqBzR0/Zd2QwQ/l4Gxftt/8wY3grcc/nS//TVkej9nmUYu83BDtccHHXKibMs/
# yXHhDXNkoPIdynhVAku7aRZOwqw6pDCCBq4wggSWoAMCAQICEAc2N7ckVHzYR6z9
# KGYqXlswDQYJKoZIhvcNAQELBQAwYjELMAkGA1UEBhMCVVMxFTATBgNVBAoTDERp
# Z2lDZXJ0IEluYzEZMBcGA1UECxMQd3d3LmRpZ2ljZXJ0LmNvbTEhMB8GA1UEAxMY
# RGlnaUNlcnQgVHJ1c3RlZCBSb290IEc0MB4XDTIyMDMyMzAwMDAwMFoXDTM3MDMy
# MjIzNTk1OVowYzELMAkGA1UEBhMCVVMxFzAVBgNVBAoTDkRpZ2lDZXJ0LCBJbmMu
# MTswOQYDVQQDEzJEaWdpQ2VydCBUcnVzdGVkIEc0IFJTQTQwOTYgU0hBMjU2IFRp
# bWVTdGFtcGluZyBDQTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAMaG
# NQZJs8E9cklRVcclA8TykTepl1Gh1tKD0Z5Mom2gsMyD+Vr2EaFEFUJfpIjzaPp9
# 85yJC3+dH54PMx9QEwsmc5Zt+FeoAn39Q7SE2hHxc7Gz7iuAhIoiGN/r2j3EF3+r
# GSs+QtxnjupRPfDWVtTnKC3r07G1decfBmWNlCnT2exp39mQh0YAe9tEQYncfGpX
# evA3eZ9drMvohGS0UvJ2R/dhgxndX7RUCyFobjchu0CsX7LeSn3O9TkSZ+8OpWNs
# 5KbFHc02DVzV5huowWR0QKfAcsW6Th+xtVhNef7Xj3OTrCw54qVI1vCwMROpVymW
# Jy71h6aPTnYVVSZwmCZ/oBpHIEPjQ2OAe3VuJyWQmDo4EbP29p7mO1vsgd4iFNmC
# KseSv6De4z6ic/rnH1pslPJSlRErWHRAKKtzQ87fSqEcazjFKfPKqpZzQmiftkaz
# nTqj1QPgv/CiPMpC3BhIfxQ0z9JMq++bPf4OuGQq+nUoJEHtQr8FnGZJUlD0UfM2
# SU2LINIsVzV5K6jzRWC8I41Y99xh3pP+OcD5sjClTNfpmEpYPtMDiP6zj9NeS3YS
# UZPJjAw7W4oiqMEmCPkUEBIDfV8ju2TjY+Cm4T72wnSyPx4JduyrXUZ14mCjWAkB
# KAAOhFTuzuldyF4wEr1GnrXTdrnSDmuZDNIztM2xAgMBAAGjggFdMIIBWTASBgNV
# HRMBAf8ECDAGAQH/AgEAMB0GA1UdDgQWBBS6FtltTYUvcyl2mi91jGogj57IbzAf
# BgNVHSMEGDAWgBTs1+OC0nFdZEzfLmc/57qYrhwPTzAOBgNVHQ8BAf8EBAMCAYYw
# EwYDVR0lBAwwCgYIKwYBBQUHAwgwdwYIKwYBBQUHAQEEazBpMCQGCCsGAQUFBzAB
# hhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wQQYIKwYBBQUHMAKGNWh0dHA6Ly9j
# YWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFRydXN0ZWRSb290RzQuY3J0MEMG
# A1UdHwQ8MDowOKA2oDSGMmh0dHA6Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2Vy
# dFRydXN0ZWRSb290RzQuY3JsMCAGA1UdIAQZMBcwCAYGZ4EMAQQCMAsGCWCGSAGG
# /WwHATANBgkqhkiG9w0BAQsFAAOCAgEAfVmOwJO2b5ipRCIBfmbW2CFC4bAYLhBN
# E88wU86/GPvHUF3iSyn7cIoNqilp/GnBzx0H6T5gyNgL5Vxb122H+oQgJTQxZ822
# EpZvxFBMYh0MCIKoFr2pVs8Vc40BIiXOlWk/R3f7cnQU1/+rT4osequFzUNf7WC2
# qk+RZp4snuCKrOX9jLxkJodskr2dfNBwCnzvqLx1T7pa96kQsl3p/yhUifDVinF2
# ZdrM8HKjI/rAJ4JErpknG6skHibBt94q6/aesXmZgaNWhqsKRcnfxI2g55j7+6ad
# cq/Ex8HBanHZxhOACcS2n82HhyS7T6NJuXdmkfFynOlLAlKnN36TU6w7HQhJD5TN
# OXrd/yVjmScsPT9rp/Fmw0HNT7ZAmyEhQNC3EyTN3B14OuSereU0cZLXJmvkOHOr
# pgFPvT87eK1MrfvElXvtCl8zOYdBeHo46Zzh3SP9HSjTx/no8Zhf+yvYfvJGnXUs
# HicsJttvFXseGYs2uJPU5vIXmVnKcPA3v5gA3yAWTyf7YGcWoWa63VXAOimGsJig
# K+2VQbc61RWYMbRiCQ8KvYHZE/6/pNHzV9m8BPqC3jLfBInwAM1dwvnQI38AC+R2
# AibZ8GV2QqYphwlHK+Z/GqSFD/yYlvZVVCsfgPrA8g4r5db7qS9EFUrnEw4d2zc4
# GqEr9u3WfPwwggWNMIIEdaADAgECAhAOmxiO+dAt5+/bUOIIQBhaMA0GCSqGSIb3
# DQEBDAUAMGUxCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAX
# BgNVBAsTEHd3dy5kaWdpY2VydC5jb20xJDAiBgNVBAMTG0RpZ2lDZXJ0IEFzc3Vy
# ZWQgSUQgUm9vdCBDQTAeFw0yMjA4MDEwMDAwMDBaFw0zMTExMDkyMzU5NTlaMGIx
# CzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3
# dy5kaWdpY2VydC5jb20xITAfBgNVBAMTGERpZ2lDZXJ0IFRydXN0ZWQgUm9vdCBH
# NDCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAL/mkHNo3rvkXUo8MCIw
# aTPswqclLskhPfKK2FnC4SmnPVirdprNrnsbhA3EMB/zG6Q4FutWxpdtHauyefLK
# EdLkX9YFPFIPUh/GnhWlfr6fqVcWWVVyr2iTcMKyunWZanMylNEQRBAu34LzB4Tm
# dDttceItDBvuINXJIB1jKS3O7F5OyJP4IWGbNOsFxl7sWxq868nPzaw0QF+xembu
# d8hIqGZXV59UWI4MK7dPpzDZVu7Ke13jrclPXuU15zHL2pNe3I6PgNq2kZhAkHnD
# eMe2scS1ahg4AxCN2NQ3pC4FfYj1gj4QkXCrVYJBMtfbBHMqbpEBfCFM1LyuGwN1
# XXhm2ToxRJozQL8I11pJpMLmqaBn3aQnvKFPObURWBf3JFxGj2T3wWmIdph2PVld
# QnaHiZdpekjw4KISG2aadMreSx7nDmOu5tTvkpI6nj3cAORFJYm2mkQZK37AlLTS
# YW3rM9nF30sEAMx9HJXDj/chsrIRt7t/8tWMcCxBYKqxYxhElRp2Yn72gLD76GSm
# M9GJB+G9t+ZDpBi4pncB4Q+UDCEdslQpJYls5Q5SUUd0viastkF13nqsX40/ybzT
# QRESW+UQUOsxxcpyFiIJ33xMdT9j7CFfxCBRa2+xq4aLT8LWRV+dIPyhHsXAj6Kx
# fgommfXkaS+YHS312amyHeUbAgMBAAGjggE6MIIBNjAPBgNVHRMBAf8EBTADAQH/
# MB0GA1UdDgQWBBTs1+OC0nFdZEzfLmc/57qYrhwPTzAfBgNVHSMEGDAWgBRF66Kv
# 9JLLgjEtUYunpyGd823IDzAOBgNVHQ8BAf8EBAMCAYYweQYIKwYBBQUHAQEEbTBr
# MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wQwYIKwYBBQUH
# MAKGN2h0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJ
# RFJvb3RDQS5jcnQwRQYDVR0fBD4wPDA6oDigNoY0aHR0cDovL2NybDMuZGlnaWNl
# cnQuY29tL0RpZ2lDZXJ0QXNzdXJlZElEUm9vdENBLmNybDARBgNVHSAECjAIMAYG
# BFUdIAAwDQYJKoZIhvcNAQEMBQADggEBAHCgv0NcVec4X6CjdBs9thbX979XB72a
# rKGHLOyFXqkauyL4hxppVCLtpIh3bb0aFPQTSnovLbc47/T/gLn4offyct4kvFID
# yE7QKt76LVbP+fT3rDB6mouyXtTP0UNEm0Mh65ZyoUi0mcudT6cGAxN3J0TU53/o
# Wajwvy8LpunyNDzs9wPHh6jSTEAZNUZqaVSwuKFWjuyk1T3osdz9HNj0d1pcVIxv
# 76FQPfx2CWiEn2/K2yCNNWAcAgPLILCsWKAOQGPFmCLBsln1VWvPJ6tsds5vIy30
# fnFqI2si/xK4VC0nftg62fC2h5b9W9FcrBjDTZ9ztwGpn1eqXijiuZQxggN2MIID
# cgIBATB3MGMxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjE7
# MDkGA1UEAxMyRGlnaUNlcnQgVHJ1c3RlZCBHNCBSU0E0MDk2IFNIQTI1NiBUaW1l
# U3RhbXBpbmcgQ0ECEAuuZrxaun+Vh8b56QTjMwQwDQYJYIZIAWUDBAIBBQCggdEw
# GgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMBwGCSqGSIb3DQEJBTEPFw0yNDEw
# MTYwNDQ4MjVaMCsGCyqGSIb3DQEJEAIMMRwwGjAYMBYEFNvThe5i29I+e+T2cUhQ
# hyTVhltFMC8GCSqGSIb3DQEJBDEiBCA0EWBg9F3IOnbHoQfPoxqKIyGLEi+ILCcZ
# gZz3gFABRTA3BgsqhkiG9w0BCRACLzEoMCYwJDAiBCB2dp+o8mMvH0MLOiMwrtZW
# df7Xc9sF1mW5BZOYQ4+a2zANBgkqhkiG9w0BAQEFAASCAgCxNsUtslI3sERse/ST
# mmuvxBUAdbLyobp+t3UuFejD0k47+WQLNmtYzMskwLSs15Hou25pSSl/3E5HeGeA
# +LivkefcbBFFFNAPjUoZwgcTijpqyaXzLk69j8gIwXL4FzRIr0XrOd8Tz7ihHTiW
# WxQKSHolMYN6hRHHs1HPoIaHXlLx21UJQxqpqfcfu1Z4z96GVADaqaYjYMpap41p
# lzC1ItTeXnT7BEIzy43nRBr4IHBEAW42QzUzZrThR2z0SvFbduApi93L48lCQQkg
# 632P1COoI88GuIhuXwVdE0L/Pzlxz3Rs2pcxLgdAWUTkSRTYcpUjqzZo7CUvN3xU
# EQI5i8ZkQ1gbL54zDmocUhT0Hyhpx+QyKCzRPadfIzKaKKNg9/pe8MA0iLru4Ifl
# EXG4RhzMoTICk6eQntzbwXA4kD8TcyhATkdCRzW6LUN114WcpPdDd9ho3Dkc+SV3
# Hwp85ArI54Jd9myPf91brj0+t1tcaiHSAHIe0Kq+mz/w/ord5nuBtqPq2UxpVVX7
# /6rh7v8Hvgn74QWM/7Nrf/OjqCY+N+yO0ut3dKZ/uVtnJv1M0dBDBMlnhzdbG6pZ
# FNocvKTgfjJRgCurvUlOuRWgzqhoMlkKp0IjbdWA6Hj5ZBBlJeNH+GBkJel+ej2c
# OTX/VkE5gYfpM7H15gq8JL2Skw==
# SIG # End signature block
