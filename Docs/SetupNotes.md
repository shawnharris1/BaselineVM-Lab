.NOTES
Author: Shawn
Last Updated: 2025-09-30

> See `ROADMAP.md` for planned features and automation goals

# Setup Notes

This document tracks all manual configuration steps applied to baseline VMs after provisioning. Update this file after each lab session to maintain reproducibility and clarity.

---

## Initial Configuration Tasks (All VMs)

- [ ] Set static IP addresses
- [ ] Rename computer names to match VM names
- [ ] Join domain (if applicable)
- [ ] Enable Remote Desktop
- [ ] Install Hyper-V integration services (if not already present)

---

## Host Configuration (Pre-VM Provisioning)

- [ ] Disable Large Send Offload v2 (IPv4 and IPv6) on Hyper-V adapters
- [ ] Confirm Hyper-V Default Switch is active
- [ ] Validate host meets Windows 11 VM requirements (Secure Boot, TPM support)
- [ ] Run `scripts/HostPrep.ps1` to automate host tweaks (e.g., disable LSO v2, validate Hyper-V switch)


> For known VM and network issues, see [Troubleshooting.md](./Troubleshooting.md)

---

## Windows 11 VM (`Baseline-Win11`)

- [ ] Install OS from `Win11_Enterprise.iso`
- [ ] Enable Secure Boot and TPM (Gen 2 VM)
- [ ] Disable Cortana and unnecessary startup apps
- [ ] Configure Windows Defender exclusions for lab tools
- [ ] Create local admin account with known credentials
- [ ] Apply SC-300 baseline hardening (see `CertPrep/SC-300-Hardening.md`)

---

## Server 2022 VM (`Baseline-Server2022`)

- [ ] Install **Datacenter (Desktop Experience)** from `WinServer2022_Eval.iso`
- [ ] Enable Secure Boot and TPM (Gen 2 VM)
- [ ] Promote to domain controller (if needed)
- [ ] Configure DNS and DHCP roles
- [ ] Apply security baseline via Group Policy
- [ ] Enable auditing and logging

---

# Domain Setup Overview

## Goal

Provision a Domain Controller (DC), promote it to Active Directory, and join the Windows 11 Client to the domain.

---

# Step-by-Step: Domain Controller Setup

## Provision the DC VM

- Use Provision-CustomVMs.ps1 or clone from DC-Template
- Recommended specs: 4096 MB RAM, 60 GB disk, WinServer2022_Eval.iso

---

## Install AD DS Role

Install-WindowsFeature -Name AD-Domain-Services


---

## Promote to Domain controller

```powershell
Import-Module ADDSDeployment
Install-ADDSForest -DomainName "Lab.local" -SafeModeAdministratorPassword (ConvertTo-SecureString "P@ssw0rd!" -AsPlainText -Force)
```

Import-Module ADDSDeployment
Install-ADDSForest -DomainName "Lab.local" -SafeModeAdministratorPassword (ConvertTo-SecureString "P@ssw0rd!" -AsPlainText -Force)


---

## Reboot and verify domain services

- Confirm DNS and AD DS are running
- Optional: take a clean snapshot here

---

# Step-by-Step: Join Win 11 Client to Domain

## Provision the Client VM

- Use Provision-BaselineVMs.ps1 or clone from Client-Template

---

## Configure networking

- Ensure both VMs are on the same virtual switch (e.g., Lab-External Switch)
- Set DNS on the client to point to the DC’s IP

## Join the domain

```powershell
Add-Computer -DomainName "Lab.local" -Credential Lab\Administrator -Restart
```

---

## Verify domain join
- Log in with domain credentials
- Confirm domain membership via System Properties or whoami

---

## Notes & Best Practices

- Use snapshots before major changes
- Record any deviations from the clean baseline
- Document all changes to maintain reproducibility
- Document IP settings and DNS configuration in Docs/SetupNotes.md
- Avoid hardcoding passwords—use secure strings or prompt-based input
- Validate domain join with Test-ComputerSecureChannel
- Reference `Docs/CleanBaseline.md` for snapshot hygiene
