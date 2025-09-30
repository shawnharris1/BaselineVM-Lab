# Setup Notes

This document tracks configuration steps and manual adjustments made to baseline VMs after provisioning.

## Initial Configuration Tasks

- Set static IPs for each VM
- Rename computer names to match VM names
- Join domain (if applicable)
- Enable Remote Desktop
- Install Hyper-V integration services (if not already present)

## Windows 11 VM

- Disable Cortana and unnecessary startup apps
- Configure Windows Defender exclusions for lab tools
- Set up local admin account with known credentials
- Apply SC-300 baseline hardening (see `CertPrep/`)

## Server 2022 VM

- Promote to domain controller (if needed)
- Configure DNS and DHCP roles
- Apply security baseline via Group Policy
- Enable auditing and logging

## Notes

- Record any deviations from the clean baseline
- Use snapshots before major changes
- Update this doc after each lab session to maintain reproducibility
