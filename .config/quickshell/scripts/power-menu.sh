#!/usr/bin/env bash
set -euo pipefail

choice="$(printf 'Lock\nSuspend\nLog out\nReboot\nShut down' | rofi -dmenu -p 'Power')"
case "${choice}" in
    Lock) hyprlock ;;
    Suspend) systemctl suspend ;;
    "Log out") hyprctl dispatch exit ;;
    Reboot)
        confirm="$(printf 'Cancel\nReboot' | rofi -dmenu -p 'Confirm reboot')"
        [[ "${confirm}" == "Reboot" ]] && systemctl reboot
        ;;
    "Shut down")
        confirm="$(printf 'Cancel\nShut down' | rofi -dmenu -p 'Confirm shutdown')"
        [[ "${confirm}" == "Shut down" ]] && systemctl poweroff
        ;;
esac
