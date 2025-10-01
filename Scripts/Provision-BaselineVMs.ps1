# Provision-BaselineVMs.ps1
# Creates baseline VMs for SC-300 lab using Windows 11 and Server 2022 ISOs

# Variables
$vmPath     = "P:\BaselineVM\VMs"
$isoPath    = "P:\BaselineVM\ISOs"
$logPath    = "P:\BaselineVM\Logs"
$switchName = "Lab-External Switch"

# Ensure Logs folder exists
if (-not (Test-Path $logPath)) {
    New-Item -ItemType Directory -Path $logPath | Out-Null
}

# Start transcript logging
Start-Transcript -Path "$logPath\ProvisionLog.txt" -Append

# VM definitions
$vmList = @(
    @{ Name = "Baseline-Win11";       ISO = "Win11_Enterprise.iso";     Memory = 4096 },
    @{ Name = "Baseline-Server2022";  ISO = "WinServer2022_Eval.iso";   Memory = 4096 }
)

# Create VMs
foreach ($vm in $vmList) {
    $vmName   = $vm.Name
    $vmISO    = Join-Path $isoPath $vm.ISO
    $vmMemory = $vm.Memory
    $vmVHD    = Join-Path $vmPath "$vmName.vhdx"

    Write-Host "Creating VM: $vmName"

    New-VM -Name $vmName -MemoryStartupBytes ($vmMemory * 1MB) -Generation 2 -SwitchName $switchName -Path $vmPath
    New-VHD -Path $vmVHD -SizeBytes 60GB -Dynamic
    Add-VMHardDiskDrive -VMName $vmName -Path $vmVHD
    Set-VMDvdDrive -VMName $vmName -Path $vmISO
    Set-VMFirmware -VMName $vmName -EnableSecureBoot Off
}

Write-Host "Provisioning complete."

# Stop transcript logging
Stop-Transcript
