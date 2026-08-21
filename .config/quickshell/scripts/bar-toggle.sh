#!/usr/bin/env bash
set -euo pipefail

if quickshell list --json 2>/dev/null | grep -q '"id"'; then
    quickshell kill
else
    quickshell --daemonize
fi
