This repository contains logs and observations for the Touch Bar issue on MacBookPro16,1 (2019 15-inch) running Ubuntu 24.04.03 with T2-enabled kernels (6.17.x variants).  

The goal is to provide logs, system outputs, and a temporary workaround to help developers debug the Touch Bar HID enumeration problem.

If you’re facing the same issue, the following systemd one-shot service can keep the Touch Bar alive:

```bash
sudo systemctl start t2-touchbar-reprobe-strong.service

```markdown

⚠️ This is a workaround, not a permanent fix.

The tarball touchbar-logs.tgz includes combined journalctl and dmesg outputs.

Kernels: 6.17.8-x64v3-t2-noble-xanmod1, 6.17.8-1-t2-noble, 6.12.58-1-t2-noble

Contributions

If you have patches, insights, or suggestions, feel free to open issues or PRs.
