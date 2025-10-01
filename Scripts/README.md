# scripts/

This folder contains PowerShell automation tools used throughout the lab lifecycle. Each script is modular, reproducible, and aligned with certification-grade lab hygiene.

---

## Script Philosophy

These scripts are built for clarity, reproducibility, and real learning.  
Each one is modular, beginner-friendly, and aligned with certification-grade lifecycle hygiene.  
Whether you're provisioning your first VM or automating teardown across dozens, this toolkit is designed to teach through transparency.


## Available Scripts

### `HostPrep.ps1`
Automates host-side configuration before VM provisioning.

**Tasks performed:**
- Disables Large Send Offload v2 (IPv4/IPv6)
- Validates presence of Hyper-V Default Switch
- Supports dry-run mode via `-WhatIf`

**Usage:**

```powershell
.\HostPrep.ps1
```

---

### `Provision-BaselineVMs.ps1
Creates baseline virtual machines with clean snapshots and cert-aligned configurations.

**Tasks performed:**

- Provisions Generation 2 VMs with Windows 11 ISO
- Applies Secure Boot and TPM settings
- Takes initial snapshot after OS install

**Usage:**

```powershell
.\Provision-BaselineVMs.ps1
```

---

### `Teardown.ps1
Performs full lifecycle cleanup of lab resources.

**Tasks performed:**

- Deletes VMs and associated checkpoints
- Removes virtual hard disks and switches
- Logs teardown actions for auditability

**Usage:**

```powershell
.\Teardown.ps1
```

---

## Best Practices

- Run scripts from an elevated PowerShell session
- Use snapshots before applying irreversible changes
- Reference [`SetupNotes.md`](../SetupNotes.md) and [`Troubleshooting.md`](../docs/Troubleshooting.md) for context

---

## Coming Soon

- SnapshotCleaner.ps1 — Automate snapshot hygiene and retention
- MenuLauncher.ps1 — Interactive launcher for modular script execution
- LogRotate.ps1 — Rotate and archive logs for long-running labs

---
