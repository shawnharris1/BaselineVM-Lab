Purpose: Documents snapshot hygiene and how to preserve a clean baseline for repeatable lab use.

markdown
# Clean Baseline Snapshot Guide

This document outlines how to preserve a clean, reusable snapshot of your baseline VMs after provisioning.

## Why Snapshot?

Creating a snapshot immediately after provisioning allows you to:

- Roll back to a known-good state
- Avoid re-running setup scripts
- Maintain consistency across lab sessions

## When to Snapshot

Take a snapshot after:

- Running `Provision-BaselineVMs.ps1`
- Verifying VM boot and ISO installation
- Confirming network connectivity and switch assignment

## Snapshot Naming Convention

Use the following format:

[VMName]-CleanBaseline-[YYYYMMDD]


Example:

Baseline-Win11-CleanBaseline-20250929


## Snapshot Location

Snapshots are stored in Hyper-V and optionally exported to:

P:\BaselineVM\Snapshots\


## Exporting Snapshots (Optional)

To export a snapshot for backup or sharing:

1. Open Hyper-V Manager
2. Right-click the VM → Export
3. Choose `P:\BaselineVM\Snapshots\` as the destination

## Notes

- Snapshots are not substitutes for full backups
- Always teardown before re-provisioning to avoid conflicts
- Document changes in `Docs/SetupNotes.md` if modifying the baseline