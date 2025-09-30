Purpose: Outlines planned features, certification modules, and long-term goals for the lab.

# Project Roadmap

This document outlines planned features, certification modules, and long-term goals for the BaselineVM lab.

## Near-Term Goals

- Finalize modular folder structure and clean provisioning scripts
- Validate teardown and snapshot hygiene across all VM types
- Scaffold `CertPrep/` with SC-300-aligned exercises and artifacts
- Document common errors and fixes in `Docs/README.md`
- Ensure all logs are human-readable and stored in `TeardownLogs/`

## Mid-Term Goals

- Add menu-driven launcher for provisioning and teardown
- Create reusable VM templates for common roles (DC, client, file server)
- Integrate lifecycle logging with timestamps and summaries
- Expand `SetupNotes.md` with tuning and hardening steps
- Add markdown-based walkthroughs for each cert module

## Long-Term Goals

- Build a full-featured toolkit for SC-300, CCSP, and related certs
- Support community contributions and modular extensions
- Create a versioned release system for lab snapshots and exports
- Publish educational guides and video walkthroughs
- Foster a learning environment that’s inclusive, repeatable, and cert-grade

## Philosophy

This lab is built for real learning. Every folder, script, and doc is designed to support reproducibility, teardown hygiene, and clarity for learners at all levels.
