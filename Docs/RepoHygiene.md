# Repo Hygiene and Lifecycle Discipline

This document explains the rationale behind excluded assets, folder separation, and lifecycle hygiene in the `BaselineVM` lab.

> This file lives in `Docs/`. All relative links assume that path.

## Excluded Assets

To maintain clarity, performance, and version control safety, the following are **excluded** from the repo:

- **VMs/** – Active VM folders and `.vhdx` files are large, volatile, and not suitable for Git tracking.
- **ISOs/** – Installation media is versioned externally and should be referenced, not stored.
- **Logs/** – Rotating logs are excluded unless explicitly captured for teardown auditing.
- **Backups/** – VM backups are stored outside the repo (`P:\VM-Backups\BaselineVM\v0.4.0`) to avoid bloating and accidental commits.

## Folder Separation

Each folder serves a distinct lifecycle role. See [`RepoMap.md`](./RepoMap.md) for a full breakdown.

## .gitignore Strategy

The `.gitignore` file excludes:

```gitignore
# Volatile assets
VMs/
ISOs/
*.vhdx
*.iso
*.zip
*.log

# Backup artifacts
Backups/
```

> This ensures only reproducible, cert-aligned assets are tracked.

---

## Backup Strategy

Backups are stored outside the repo in structured folders like:

P:\VM-Backups\BaselineVM\v0.4.0

This supports rollback, auditability, and lifecycle hygiene without polluting the repo.

---

## Validation

Each milestone is validated with:

- git status → clean working tree
- Compress-Archive → repo-only zip
- CHANGELOG.md → semantic versioning
- [`SetupNotes.md`](./SetupNotes.md) → updated walkthrough
- [`RepoMap.md`](./RepoMap.md) → folder clarity

> This hygiene model supports clarity, reproducibility, and contributor confidence. All future changes should preserve this discipline.

