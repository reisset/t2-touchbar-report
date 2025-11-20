T2 Touch Bar Report

This repository contains logs and observations for the Touch Bar issue on MacBookPro16,1 (2019 15-inch) running Ubuntu 24.04.03 with T2-enabled kernels (6.17.x variants).

Purpose

The goal is to provide logs, system outputs, and a temporary workaround to help developers debug the Touch Bar HID enumeration problem.

This project includes a **custom systemd service** and **helper script** I created locally to reprobe the T2 Touch Bar devices on a MacBookPro16,1 running Ubuntu 24.04.03.  
Ubuntu does **not** ship these files by default — they are a community-created workaround to reload the `apple_bce` / `hid_appletb_*` stack and re-enumerate the Touch Bar.
Files (present on my machine):
- `/etc/systemd/system/t2-touchbar-reprobe-strong.service` — systemd unit that runs the reprobe script.
- `/usr/local/bin/t2-touchbar-reprobe-strong.sh` — the reprobe script (uses `modprobe`, PCI rescan, optional `tiny-dfr` restart).

If you’re facing the same issue, manually start the following systemd one-shot service to keep the Touch Bar alive:

```bash
sudo systemctl start t2-touchbar-reprobe-strong.service
```

Logs/files

The tarball touchbar-logs.tgz includes combined journalctl and dmesg outputs. The .service file contents are also included in this repo.
