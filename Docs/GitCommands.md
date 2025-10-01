# Git Commands for Lab Management

This guide documents the essential Git commands used to manage, clean, and sync the BaselineVM-Lab repo. It supports reproducibility, backup hygiene, and collaborative learning.

## Status & Inspection
```
git status              # Check current changes and staging state
git log                 # View commit history
git diff                # See unstaged changes
git show <commit>       # Inspect a specific commit

```
## Staging & Committing
```
git add <file>          # Stage a specific file
git add .               # Stage all changes
git commit -m "Message" # Commit staged changes with a message

```
## Pushing & Syncing
```
git push origin main    # Push commits to GitHub
git pull origin main    # Pull latest changes from GitHub

```
## Cleanup & Hygiene
```
git rm --cached <file>  # Untrack a file (e.g., ISO or VHD)
git reset HEAD <file>   # Unstage a file
git clean -n            # Preview untracked files to be removed
git clean -f            # Remove untracked files (use with caution)

```
## Repo History & Rewrite (Advanced)
```
git rev-parse --show-toplevel   # Confirm repo root
git filter-branch --tree-filter # Rewrite history (legacy)
git reflog                      # View recent HEAD movements

```

## Git Ignore & Hygiene

Example `.gitignore` rules:

```plaintext
# Ignore ISO files and installation media
ISOs/
*.iso

# Ignore VM folders and virtual disks
VMs/
*.vhd
*.vhdx

# Ignore logs and teardown artifacts
Logs/
TeardownLogs/
Exports/
Snapshots/

# Ignore PowerShell-generated temp files
*.log
*.tmp

# Ignore system files
Thumbs.db
.DS_Store
```

## Verification Checklist

```plaintext
git status → No ISO/VHD/log files listed
.gitignore present and committed
Repo size under 10 MB (du -sh .)
README.md links resolve correctly
Docs/ folder contains all learning artifacts
```

Tip for Learners
Use this guide to stay clean, reproducible, and cert-grade. Every commit tells a story—make yours readable, purposeful, and helpful to future contributors.