#!/usr/bin/env bash
set -euo pipefail

minutes="$(printf '5\n10\n15\n25\n45\n60' | rofi -dmenu -p 'Timer minutes')"
[[ "${minutes}" =~ ^[0-9]+$ ]] || exit 0
(( minutes > 0 && minutes <= 1440 )) || exit 0
unit="magnetism-timer-$(date +%s)"
systemd-run --user --unit="${unit}" --on-active="${minutes}m" \
    notify-send -u critical "Magnetism Timer" "${minutes} minute timer finished" >/dev/null
notify-send "Magnetism Timer" "Started for ${minutes} minutes"
