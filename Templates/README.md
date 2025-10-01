# Templates

Reusable VM templates for common roles (e.g., domain controller, client, file server).  
Designed to support rapid provisioning and consistent lab setups.

---

## Purpose

This folder contains preconfigured VM templates that can be cloned, exported, or adapted for specific lab roles.  
Templates help reduce setup time, enforce consistency, and support repeatable certification workflows.

---

## Usage

Templates are typically used in one of three ways:

1. **Clone for New VMs**  
   Use Hyper-V's "Export" and "Import" features to duplicate a template for a new lab role.

2. **Reference in Provisioning Scripts**  
   Future modules (e.g., `MenuLauncher.ps1`) may support launching VMs directly from templates.

3. **Customize and Save**  
   Modify a template VM (e.g., install roles, configure networking), then export it back to `Templates/` for reuse.

---

## Best Practices

- Name templates clearly (e.g., `DC-Template`, `Client-Template`, `FileServer-Template`)
- Keep templates updated with patches and baseline configuration
- Avoid committing exported VMs to the repo—store them locally and reference by filename
- Document template purpose and setup in `Docs/Templates.md` or per-template notes

---

## Future Support

- Template launcher via `MenuLauncher.ps1`
- Role-based provisioning from templates
- Snapshot rotation and versioning for template hygiene
