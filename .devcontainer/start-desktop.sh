#!/usr/bin/env bash
set -euo pipefail

export DISPLAY="${DISPLAY:-:1}"
export HOME="/home/codespace"
export USER="codespace"
export XDG_RUNTIME_DIR="/tmp/runtime-codespace"
mkdir -p "$XDG_RUNTIME_DIR"
chmod 700 "$XDG_RUNTIME_DIR"

# Keep a small status file so the user can diagnose the browser PC without
# needing to understand the supervisor configuration.
status_file=/var/log/pc-free/status
mkdir -p "$(dirname "$status_file")"
printf 'PC-Free desktop starting\n' > "$status_file"
printf 'DISPLAY=%s\n' "$DISPLAY" >> "$status_file"
printf 'Resolution=%sx%s\n' "${BROWSER_PC_WIDTH:-1440}" "${BROWSER_PC_HEIGHT:-900}" >> "$status_file"

# Xvfb is managed by supervisor. Wait until its display socket exists.
for _ in {1..60}; do
  if [[ -S /tmp/.X11-unix/X1 ]]; then break; fi
  sleep 0.25
done

# Launch XFCE as the non-root Codespaces user. dbus-run-session avoids the
# common dbus-launch/session-bus problems seen in minimal containers.
exec su -s /bin/bash - codespace -c \
  "export DISPLAY=$DISPLAY HOME=$HOME XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR; \
   dbus-run-session -- startxfce4"
