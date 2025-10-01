# Changelog

- This changelog tracks all major milestones, documentation updates, and lifecycle improvements for the BaselineVM lab. 
- This format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and adheres to semantic versioning.

---

## v0.4.0 — Snapshot Hygiene, Template Clarity, and Lifecycle Docs - 2025-09-30 Author: Shawn

### Highlights

- Finalized Docs/CleanBaseline.md to document snapshot hygiene and baseline preservation
- Refined Docs/Templates.md with usage scenarios, naming conventions, and lifecycle best practices
- Scaffolded Templates/README.md to support modular provisioning and template reuse
- Updated Docs/ROADMAP.md with focused goals and revised cert scope (SC-300 only)
- Created Docs/Troubleshooting.md to track known issues and reproducible fixes
- Verified .gitignore and Docs/gitcommands.md for repo hygiene and contributor clarity
- Reviewed and validated Docs/SetupNotes.md for configuration tracking and hardening prep
- Finalized README.md with full lifecycle mapping, folder structure, and educational goals

## Repo Hygiene

- Snapshot naming convention standardized: [VMName]-CleanBaseline-[YYYYMMDD]
- Sensitive data reminders added to all relevant docs
- Folder structure and script usage fully documented
- All Markdown files verified for clarity, reproducibility, and beginner-friendliness

---

## [v0.3.0] - 2025-10-01 Author: Shawn

### Added
- `Configs/README.md` with sample `vm-config.json` and customization tips
- Script documentation entries for `HostPrep.ps1`, `Provision-BaselineVMs.ps1`, `Provision-CustomVMs.ps1`, and `Teardown.ps1`
- Cross-links and lifecycle flowchart in main README

### Updated
- Main `README.md` with script philosophy, contributing section, and lifecycle clarity
- `.gitignore` to exclude `ISOs/`, `VMs/`, and sensitive folders

### Validated
- Verified script usage examples and lifecycle flow
- Confirmed reproducibility and snapshot hygiene across provisioning and teardown
- Ensured all documentation reflects actual script behavior and folder structure

---

## [v0.2.0] - 2025-09-30 Author: Shawn

### Added
- Rebuilt `README.md` with modular lifecycle framing, script philosophy, and cert-grade quickstart
- Documented core scripts:
  - `HostPrep.ps1` for host-side optimization
  - `Provision-BaselineVMs.ps1` for standard VM setup
  - `Provision-CustomVMs.ps1` for JSON-driven provisioning
  - `Teardown.ps1` for full lifecycle cleanup
- Created `Configs/README.md` with sample `vm-config.json`, customization tips, and best practices
- Added lifecycle flowchart and folder structure map to main README
- Introduced contributing section to invite collaboration

### Updated
- Standardized folder path formatting for cross-platform clarity (`/` instead of `\`)
- Improved internal linking and markdown consistency across all documentation
- Clarified ISO handling—filenames must match, but media is not included in the repo
- Reinforced `.gitignore` usage to exclude `ISOs/`, `VMs/`, and other sensitive folders

### Validated
- Verified script usage examples and lifecycle flow
- Confirmed reproducibility and snapshot hygiene across provisioning and teardown
- Ensured all documentation reflects actual script behavior and folder structure

---

## [v0.1.0] - 2025-09-15 Author: Shawn

### Added
- Initial PowerShell scripts for VM provisioning and teardown
- Basic folder structure for `Scripts/`, `ISOs/`, and `VMs/`
- Early draft of `README.md` with setup notes and usage examples

### Known Limitations
- No modular config support
- No snapshot hygiene or teardown logging
- ISO handling and lifecycle documentation incomplete

