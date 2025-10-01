<#
.SYNOPSIS
Automates host-side configuration for Hyper-V lab readiness.

.DESCRIPTION
Disables Large Send Offload v2, validates Hyper-V Default Switch, and prepares host for VM provisioning.

.NOTES
Author: Shawn
Last Updated: 2025-09-30
#>

param (
    [switch]$WhatIf
)

function Disable-LSOv2 {
    Write-Host "`n[+] Disabling Large Send Offload v2 (IPv4/IPv6)..."
    Get-NetAdapterAdvancedProperty |
    Where-Object { $_.DisplayName -like "Large Send Offload v2*" -and $_.DisplayValue -ne "Disabled" } |
    ForEach-Object {
        Write-Host "    → $($_.DisplayName) on $($_.Name)"
        if (-not $WhatIf) {
            Set-NetAdapterAdvancedProperty -Name $_.Name -DisplayName $_.DisplayName -DisplayValue "Disabled"
        }
    }
}

function Validate-HyperVSwitch {
    Write-Host "`n[+] Validating Hyper-V Default Switch..."
    $switch = Get-VMSwitch -SwitchType Internal | Where-Object { $_.Name -eq "Default Switch" }
    if ($switch) {
        Write-Host "    → Default Switch is present and active."
    } else {
        Write-Warning "    ⚠️ Default Switch not found. Check Hyper-V installation or create manually."
    }
}

# Main Execution
Write-Host "`n=== HostPrep.ps1 — Hyper-V Host Configuration ==="
Disable-LSOv2
Validate-HyperVSwitch
Write-Host "`n✅ Host configuration complete.`n"
