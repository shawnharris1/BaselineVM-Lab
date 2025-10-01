# Provision-CustomVMs.ps1
# Dynamically provisions VMs using external JSON config

# Paths
$vmPath     = "P:\BaselineVM\VMs"
$isoPath    = "P:\BaselineVM\ISOs"
$logPath    = "P:\BaselineVM\Logs"
$switchName = "Lab-External Switch"
$configFile = "P:\BaselineVM\Configs\vm-config.json"

# Ensure Logs folder exists
if (-not (Test-Path $logPath)) {
    New-Item -ItemType Directory -Path $logPath | Out-Null
}

# Start transcript logging
Start-Transcript -Path "$logPath\CustomProvisionLog.txt" -Append

# Load VM config from JSON
if (-not (Test-Path $configFile)) {
    Write-Error "Config file not found: $configFile"
    Stop-Transcript
    return
}

$vmList = Get-Content $configFile | ConvertFrom-Json

# Provision loop
foreach ($vm in $vmList) {
    $vmName   = $vm.Name
    $vmISO    = Join-Path $isoPath $vm.ISO
    $vmMemory = $vm.MemoryMB
    $vmDisk   = $vm.DiskGB
    $vmVHD    = Join-Path $vmPath "$vmName.vhdx"

    Write-Host "Provisioning VM: $vmName"

    if (-not (Test-Path $vmISO)) {
        Write-Warning "ISO not found: $vmISO — skipping $vmName"
        continue
    }

    New-VM -Name $vmName -MemoryStartupBytes ($vmMemory * 1MB) -Generation 2 -SwitchName $switchName -Path $vmPath
    New-VHD -Path $vmVHD -SizeBytes ($vmDisk * 1GB) -Dynamic
    Add-VMHardDiskDrive -VMName $vmName -Path $vmVHD
    Set-VMDvdDrive -VMName $vmName -Path $vmISO
    Set-VMFirmware -VMName $vmName -EnableSecureBoot Off
}

Write-Host "Custom provisioning complete."
Stop-Transcript
