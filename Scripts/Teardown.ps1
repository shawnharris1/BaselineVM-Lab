# Teardown.ps1
# Removes all baseline VMs and logs the teardown process

# Variables
$vmPath = "P:\BaselineVM\VMs"
$logPath = "P:\BaselineVM\TeardownLogs\DecommissionLog.md"
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Get all baseline VMs
$vmList = Get-VM | Where-Object { $_.Name -like "Baseline-*" }

# Begin log
Add-Content $logPath "`n## Teardown Log - $timestamp`n"

foreach ($vm in $vmList) {
    $vmName = $vm.Name
    Write-Host "Removing VM: $vmName"

    # Stop VM if running
    if ($vm.State -eq "Running") {
        Stop-VM -Name $vmName -Force
    }

    # Remove VM
    Remove-VM -Name $vmName -Force

    # Delete associated VHD
    $vhdPath = Join-Path $vmPath "$vmName.vhdx"
    if (Test-Path $vhdPath) {
        Remove-Item $vhdPath -Force
    }

    # Log removal
    Add-Content $logPath "- $vmName removed and VHD deleted"
}

Write-Host "Teardown complete. Log saved to $logPath"
