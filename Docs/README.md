Purpose: Troubleshooting guide and walkthrough for common setup issues and lab misconfigurations.

markdown
# Troubleshooting Guide

This document outlines common issues encountered during lab setup and teardown, along with recommended fixes.

## Common Errors

### 1. VM Fails to Boot from ISO

**Cause:** ISO path is incorrect or file is missing  
**Fix:** Ensure ISO files are named exactly:
- `Win11_Enterprise.iso`
- `WinServer2022_Eval.iso`  
And placed in:
P:\BaselineVM\ISOs\


### 2. Virtual Switch Not Found

**Cause:** `Lab-External Switch` does not exist  
**Fix:** Open Hyper-V Manager → Create a new external switch named `Lab-External Switch`

### 3. PowerShell Access Denied

**Cause:** Script run without elevated privileges  
**Fix:** Right-click PowerShell → Run as Administrator

### 4. VHD Not Found During Teardown

**Cause:** VHD was manually deleted or renamed  
**Fix:** Update `Teardown.ps1` to reflect current VHD paths or re-provision the VM

### 5. Snapshot Conflicts

**Cause:** Snapshot exists from previous session  
**Fix:** Delete old snapshots before re-provisioning or restore to clean baseline

## Logging and Reflection

- All teardown actions are logged to `TeardownLogs/DecommissionLog.md`
- Use `Docs/CleanBaseline.md` to maintain snapshot hygiene
- Update `Docs/SetupNotes.md` after manual configuration changes

## Tips

- Always teardown before re-provisioning
- Keep ISO names and paths consistent
- Document changes for reproducibility