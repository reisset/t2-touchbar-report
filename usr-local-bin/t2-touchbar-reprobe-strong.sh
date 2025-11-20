#!/bin/bash
END=$((SECONDS + 300))
LOG=/var/log/t2-touchbar-reprobe.log
echo "$(date) - starting re-probe" >> $LOG

while [ $SECONDS -lt $END ]; do
  # if any Apple HID device already present, we are done
  if ls /sys/bus/hid/devices 2>/dev/null | egrep -qi "05AC"; then
    echo "$(date) - found apple HID device, starting tiny-dfr if present" >> $LOG
    command -v tiny-dfr >/dev/null 2>&1 && sudo systemctl restart tiny-dfr || true
    exit 0
  fi

  echo "$(date) - attempt: unloading mods" >> $LOG
  /sbin/modprobe -r hid_appletb_kbd hid_appletb_bl apple_bce 2>/dev/null || true
  sleep 1

  echo "$(date) - pci rescan" >> $LOG
  echo 1 | sudo tee /sys/bus/pci/rescan >/dev/null || true
  sleep 1

  echo "$(date) - reloading BCE and touchbar mods" >> $LOG
  /sbin/modprobe apple_bce 2>/dev/null || true
  sleep 1
  /sbin/modprobe hid_appletb_kbd hid_appletb_bl 2>/dev/null || true
  sleep 2
done

# final check
if ls /sys/bus/hid/devices 2>/dev/null | egrep -qi "05AC"; then
  echo "$(date) - found apple HID device after retries" >> $LOG
  command -v tiny-dfr >/dev/null 2>&1 && sudo systemctl restart tiny-dfr || true
  exit 0
fi

echo "$(date) - failed to find apple HID device after retries" >> $LOG
exit 1
