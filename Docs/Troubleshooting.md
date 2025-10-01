# Troubleshooting Guide

This guide documents known issues and their resolutions across the lab lifecycle—from provisioning to teardown. Each fix is reproducible, beginner-friendly, and mapped to real-world scenarios.

---

## Windows 11 ISO Compatibility Error

If you see “This PC can’t run Windows 11” during VM setup:

### Fix: Enable Required VM Features

- Use Generation 2 VM  
- In VM settings → Security:  
  1. Enable Secure Boot  
  2. Enable Trusted Platform Module (TPM)

### Optional: Bypass Setup Checks

1. Press `Shift + F10` at the error screen  
2. Run `regedit`  
3. Navigate to:  

```
 HKEY_LOCAL_MACHINE\SYSTEM\Setup
```

4. Create a new key:

```
LabConfig
```

5. Add these DWORD values:
```
BypassTPMCheck = 1
BypassSecureBootCheck = 1
BypassRAMCheck = 1
```

---

## Hyper-V Network Lag or VM Slowness

If your VM experiences sluggish networking or packet loss:

### Fix: Disable Large Send Offload (LSO v2) on Host

1. Open Network and Sharing Center  
2. Go to Change adapter settings  
3. Right-click `vEthernet (Default Switch)` → Properties  
4. Click Configure → Advanced  
5. Set:  
- Large Send Offload v2 (IPv4) → Disabled  
- Large Send Offload v2 (IPv6) → Disabled

---

## PowerShell Automation

Run `scripts/HostPrep.ps1` to automate this tweak:

```powershell
.\HostPrep.ps1
```

## Related Docs
- [Setup Notes](./SetupNotes.md)
- [ROADMAP.md](./ROADMAP.md)
