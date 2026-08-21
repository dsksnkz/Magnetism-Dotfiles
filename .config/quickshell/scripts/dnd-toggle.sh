#!/usr/bin/env bash
set -euo pipefail

state="$(swaync-client --skip-wait -d)"
if [[ "${state}" == "true" ]]; then
    notify-send "Magnetism" "Do Not Disturb enabled"
else
    notify-send "Magnetism" "Do Not Disturb disabled"
fi
