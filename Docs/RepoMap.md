# RepoMap: Folder Purpose and Lifecycle Roles

This document maps the purpose of each folder in the `BaselineVM` repo, aligned with provisioning, teardown, and certification prep workflows.

## Core Folders

| Folder         | Purpose                                                  |
|----------------|----------------------------------------------------------|
| Scripts        | PowerShell automation for provisioning and teardown      |
| Templates      | Role-based provisioning templates and README scaffolding |
| Configs        | VM specs, provisioning parameters, and role definitions  |
| Docs           | Setup notes, lifecycle diagrams, troubleshooting logs    |

## Lifecycle & Logging

| Folder         | Purpose                                                  |
|----------------|----------------------------------------------------------|
| Snapshots      | Metadata or notes about Hyper-V checkpoints              |
| TeardownLogs   | Logs from teardown runs, useful for auditing             |
| Exports        | Exported configs or assets for sharing or rollback       |

## Cert Prep & Learning

| Folder         | Purpose                                                  |
|----------------|----------------------------------------------------------|
| CertPrep       | SC-300 exercises, artifacts, and certification prep      |

## Scaffolded (Currently Empty)

| Folder         | Purpose                                                  |
|----------------|----------------------------------------------------------|
| Backups        | Manual or scripted config/script backups (not VMs)       |
| Logs           | Provisioning logs and rotation history                   |
| Staging        | Temporary files or pre-deployment assets                 |

---

## Notes

- VM and ISO files are excluded from the repo for size and lifecycle hygiene.  
- See [./RepoHygiene.md] (`./RepoHygiene.md`) for backup strategy and `.gitignore` logic.  
- For changelog and milestone tracking, see [CHANGELOG.md](`../CHANGELOG.md`) in the root folder.

