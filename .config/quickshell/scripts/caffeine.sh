#!/usr/bin/env bash
set -euo pipefail

if pgrep -x hypridle >/dev/null; then
    systemctl --user stop magnetism-hypridle.service 2>/dev/null || pkill -x hypridle
    notify-send "Magnetism" "Caffeine enabled — automatic locking is paused"
else
    systemd-run --user --unit=magnetism-hypridle --collect hypridle >/dev/null
    notify-send "Magnetism" "Caffeine disabled — automatic locking is active"
fi
