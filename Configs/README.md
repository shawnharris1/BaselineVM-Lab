# VM Configuration Files

This folder contains reusable configuration files for provisioning virtual machines using `Provision-CustomVMs.ps1`.  
Each config file defines VM names, ISO mappings, memory, and disk size—making it easy to customize your lab setup without modifying script logic.

---

## Config Philosophy

These config files are designed to separate logic from data—making your lab setup modular, reusable, and beginner-friendly.

---

## Sample: `vm-config.json`

```json
[
  {
    "Name": "CustomClient01",
    "ISO": "Win11_Enterprise.iso",
    "MemoryMB": 4096,
    "DiskGB": 60
  },
  {
    "Name": "CustomServer01",
    "ISO": "WinServer2022_Eval.iso",
    "MemoryMB": 8192,
    "DiskGB": 100
  }
]
```

---
**Usage:**

To provision VMs using this config:

```powershell
.\Provision-CustomVMs.ps1
```

- The script will read from `Configs/vm-config.json` by default. 
- See [`Scripts/Provision-CustomVMs.ps1`](../Scripts/Provision-CustomVMs.ps1) for script details
- You can modify this file to define your own VM specs.

---

## Customization Tips

- Name: Choose any VM name (avoid spaces or special characters)
- **ISO**: Must match the filename of your local ISO in the `ISOs/` folder 
- ISO files are not included in this repo—users must supply their own Windows installation media.
- MemoryMB: RAM in megabytes (e.g., 4096 = 4 GB)
- DiskGB: VHD size in gigabytes
- Ensure your JSON file uses proper syntax—commas between objects, double quotes around keys and values, and no trailing commas.

You can define as many VMs as needed—just add more objects to the array.

---

## Best Practices

- Keep your `ISOs/` folder local and outside version control (see `.gitignore`)  
- Do not upload ISO files to the repo—this project references them by filename only
- Use descriptive VM names for clarity
- Validate config syntax before running the script (use `ConvertFrom-Json` in PowerShell)
- Test your config file with `Get-Content .\vm-config.json | ConvertFrom-Json` to catch formatting issues before provisioning

---

## Future Options

- Alternate config paths via -ConfigFile parameter (planned)
- Role-based presets and templates
- Interactive config builder via MenuLauncher.ps1