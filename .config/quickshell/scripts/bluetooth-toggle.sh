#!/usr/bin/env bash
set -euo pipefail

if bluetoothctl show | grep -q 'Powered: yes'; then
    bluetoothctl power off >/dev/null
    notify-send "Magnetism" "Bluetooth disabled"
else
    bluetoothctl power on >/dev/null
    notify-send "Magnetism" "Bluetooth enabled"
fi
