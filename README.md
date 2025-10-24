# Raspberry Pi System Cleaner
**Author:** [Tutwidi](https://github.com/tutwidi)  
**Script Name:** `clean-raspi.sh`  
**Language:** Bash (Raspbian / Debian Compatible)

---

## Overview
`clean-raspi.sh` is a simple yet powerful **maintenance script** for Raspberry Pi (and other Debian-based systems) designed to:

- Remove old, temporary, and unused files  
- Clean package cache, logs, and system debris  
- Free up valuable SD card space  
- Repair broken dependencies  
- Improve system performance  

This script is **safe**, **lightweight**, and specifically built to **preserve important working directories** 

---

## Features

✅ Cleans system caches (`apt`, `var`, `tmp`, etc.)  
✅ Removes unnecessary logs and old packages  
✅ Deletes man pages, localization files, and docs (optional)  
✅ Repairs broken packages automatically  
✅ Displays disk usage before and after cleanup  
✅ Skips critical folders like `~/MMDVM_HS`  

---

## Installation

### Download the script
Clone this repository or copy the script manually:
```bash
git clone https://github.com/tutwidi/clean-raspi.sh.git
cd clean-raspi.sh.git

## Make it executable
chmod +x clean-raspi.sh

## Run the cleaner
sudo ./clean-raspi.sh

## Output
Cleaning Raspberry Pi system...
Disk space before cleaning:
Filesystem      Size  Used Avail Use% Mounted on
/dev/root        15G   11G  3.5G  76% /
----------------------------------------------------
 Cleaning APT package cache...
 Removing old log files...
 Removing caches in /var...
 Removing temporary files...
 Removing user cache...
 Removing old documentation...
 Fixing broken dependencies...
----------------------------------------------------
 Disk space after cleaning:
Filesystem      Size  Used Avail Use% Mounted on
/dev/root        15G  8.9G  6.2G  59% /
 Cleaning complete — ~/MMDVM_HS folder remains intact.
 It is recommended to reboot for best performance.


## Safety Notes
The script will not delete:

/boot, /lib, /usr/bin, or system-critical directories
Requires sudo for full cleanup
Tested on Raspberry Pi OS (Bullseye, Bookworm), Ubuntu Server, and Debian 12

## Troubleshooting

If you encounter permission denied or read-only file system errors:
sudo mount -o remount,rw /

Then re-run the script:
sudo ./clean-raspi.sh

## Optional Customization
You can comment out or remove these lines if you want to keep documentation:

sudo rm -rf /usr/share/man/*
sudo rm -rf /usr/share/locale/*
sudo rm -rf /usr/share/doc/*

## Contributing

Pull requests are welcome!
If you’d like to improve logging, add argument options (e.g., --light or --deep), feel free to fork and modify.

## License

This project is open-source under the MIT License.
See the LICENSE
 file for details.

## Support

If this script saved your SD card space — don’t forget to give it a on GitHub!
