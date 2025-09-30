# Baseline VM Lab for SC-300 and Beyond

A modular, reproducible Hyper-V lab designed for security certification prep, enterprise simulation, and beginner-friendly learning. This project was rebuilt from the ground up to support clean provisioning, full teardown, and lifecycle hygiene—with clear documentation and step-by-step guidance.

---

## Quickstart (3 Steps)

1. **Prepare your external SSD**
   - Format it clean (NTFS recommended)
   - Create a root folder called `BaselineVM`

2. **Copy ISOs**
   - Place your Windows 11 Enterprise and Windows Server 2022 Eval ISOs into:
     ```
     P:\BaselineVM\ISOs\
     ```

3. **Run the provisioning script**
   - Open PowerShell as Administrator
   - Navigate to `P:\BaselineVM\Scripts`
   - Run:
     ```powershell
     .\Provision-BaselineVMs.ps1
     ```

---

## Before You Begin

- Hyper-V must be enabled
- A virtual switch named `Lab-External Switch` must exist
- ISO files must be named:
  - `Win11_Enterprise.iso`
  - `WinServer2022_Eval.iso`
- PowerShell must be run as Administrator

---

## Lab Lifecycle

This lab supports a full learning lifecycle: **Provision → Snapshot → Configure → Teardown → Reflect**

- **Provisioning**: [`Scripts/Provision-BaselineVMs.ps1`](./Scripts/Provision-BaselineVMs.ps1)
- **Snapshot**: Documented in [`Docs/CleanBaseline.md`](./Docs/CleanBaseline.md)
- **Configuration**: Tracked in [`Docs/SetupNotes.md`](./Docs/SetupNotes.md)
- **Teardown**: [`Scripts/Teardown.ps1`](./Scripts/Teardown.ps1)
- **Reflection**: Summarized in [`TeardownLogs/DecommissionLog.md`](./TeardownLogs/DecommissionLog.md)

---

## Folder Structure

| Folder           | Purpose                                                  |
|------------------|----------------------------------------------------------|
| `Scripts`        | Provisioning and teardown scripts                        |
| `ISOs`           | Windows installation media                               |
| `VMs`            | Active VM folders and VHDs                               |
| `Logs`           | Provisioning logs and rotation history                   |
| `TeardownLogs`   | Teardown logs and human-readable summaries               |
| `Docs`           | Setup notes, snapshots, cert prep documentation          |
| `Configs`        | Exported VM config files or custom settings              |
| `Snapshots`      | Manual or exported Hyper-V checkpoints                   |
| `Backups`        | Manual or scripted VM backups                            |
| `Staging`        | Temporary files or pre-deployment assets                 |
| `Exports`        | Exported VMs for sharing or rollback                     |
| `Templates`      | Reusable VM templates or preconfigured roles             |
| `CertPrep`       | SC-300 exercises and artifacts                           |

---

## Educational Goals

- Build a repeatable lab for SC-300 and related certification prep
- Practice provisioning, teardown, snapshotting, and export workflows
- Learn PowerShell scripting through real-world automation
- Share modular, beginner-friendly tools with others
- Model lifecycle hygiene and reproducibility for enterprise simulation

---

## Common Errors & Fixes

See [`Docs/README.md`](./Docs/README.md) for a full walkthrough and troubleshooting guide.

---

## Project Roadmap

See [`Docs/ROADMAP.md`](./Docs/ROADMAP.md) for planned features, cert prep modules, and long-term goals.

---

## Lab Philosophy

This lab is built for real learning. It supports a full lifecycle approach to virtual machines including provisioning snapshot configuration teardown and reflection  
The goal is to create a space where you can experiment safely and repeat steps with confidence. Every folder and script is designed to help you understand what you're doing and why it matters  
I'm using this lab to learn too. I'm working through SC-300 and related certifications and rebuilt this from scratch to make it cleaner and easier to teach. I document mistakes and fixes so others can follow along and learn from them  
If you're new to PowerShell Hyper-V or certification prep this lab is for you. If you're experienced and want to contribute or adapt it you're welcome here too

---

## Lifecycle Flowchart

![VM Lifecycle Flowchart](./Docs/vm-lifecycle.png)
