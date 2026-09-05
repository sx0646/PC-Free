#!/usr/bin/env bash
set -u

printf '\n=== PC-Free Browser PC ===\n'
printf 'Desktop: XFCE\n'
printf 'Display: %s\n' "${DISPLAY:-:1}"
printf 'Browser port: 6080\n'
printf 'KVM device: '
if [[ -e /dev/kvm ]]; then printf 'available\n'; else printf 'not available (normal for many Codespaces)\n'; fi
printf 'Docker socket: '
if [[ -S /var/run/docker.sock ]]; then printf 'available\n'; else printf 'not mounted\n'; fi
printf 'noVNC: '
if (echo > /dev/tcp/127.0.0.1/6080) >/dev/null 2>&1; then printf 'running\n'; else printf 'not listening yet\n'; fi
printf '=========================\n\n'
