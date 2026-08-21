#!/usr/bin/env bash
set -euo pipefail

query="$(rofi -dmenu -p 'Search the web')"
[[ -n "${query}" ]] || exit 0
encoded="$(python3 -c 'import sys, urllib.parse; print(urllib.parse.quote_plus(sys.stdin.read().strip()))' <<< "${query}")"
xdg-open "https://duckduckgo.com/?q=${encoded}" >/dev/null 2>&1 &
