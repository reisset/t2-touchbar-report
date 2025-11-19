T2 Touch Bar Report

This repository contains logs and observations for the Touch Bar issue on MacBookPro16,1 (2019 15-inch) running Ubuntu 24.04.03 with T2-enabled kernels (6.17.x variants).

Purpose

The goal is to provide logs, system outputs, and a temporary workaround to help developers debug the Touch Bar HID enumeration problem.

Temporary Workaround

If you’re facing the same issue, the following systemd one-shot service can keep the Touch Bar alive:
```bash
sudo systemctl start t2-touchbar-reprobe-strong.service
```
⚠️ This is a workaround, not a permanent fix.

Logs

The tarball touchbar-logs.tgz includes combined journalctl and dmesg outputs and can be downloaded here:
Download touchbar-logs.tgz
