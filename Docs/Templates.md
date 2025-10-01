# VM Templates Overview

This document provides guidance on creating, maintaining, and using reusable VM templates for common lab roles.  
Templates help streamline provisioning, enforce consistency, and support repeatable certification workflows.

---

## Purpose

Templates are preconfigured virtual machines designed to represent specific roles in your lab environment, such as:

- Domain Controller (DC)
- Windows Client
- File Server
- Web Server
- Certificate Authority

They reduce setup time and ensure consistent baselines across lab scenarios.

---

## Usage Scenarios

Templates are ideal for:

- Rapid provisioning of lab roles (e.g., DC, Client, CA)
- Testing role-based configurations without rebuilding from scratch
- Teaching repeatable setup workflows in certification prep

---

## Template Creation Workflow

1. **Provision a baseline VM**
2. **Install required roles or features**
3. **Apply updates and configure networking**
4. **Take a clean snapshot (optional)**
5. **Export the VM to `Templates/` folder**
6. **Document its purpose and setup here**

---

## Naming Convention

Use clear, role-based names for templates:

- `DC-Template`
- `Client-Template`
- `FileServer-Template`
- `WebServer-Template`

Include versioning if needed (e.g., `DC-Template-v1`).

---

## Maintenance Tips

- Keep templates patched and updated
- Avoid committing exported VMs to the repo
- Store templates locally and reference by filename
- Document any manual steps or role-specific configs
- Before exporting a template, ensure no sensitive credentials or lab secrets are stored in plaintext.

---

## Related Docs

- See `Docs/SetupNotes.md` and `Docs/CleanBaseline.md` for snapshot hygiene and baseline configuration.

---

## Future Integration

- Launch templates via `MenuLauncher.ps1`
- Role-based provisioning from templates
- Snapshot rotation and hygiene tracking
