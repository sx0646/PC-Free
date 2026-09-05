PC-Free Browser Desktop
========================

This Codespace automatically starts a lightweight Linux desktop and exposes it through noVNC.

BOOT
----
1. Create/open a Codespace from this repository.
2. Wait for the container to finish building.
3. GitHub automatically forwards port 6080.
4. Open the forwarded "PC-Free Browser PC" port in your browser.

The desktop is intentionally Linux-based because this is the most reliable graphical PC experience that GitHub Codespaces can provide without requiring nested Windows virtualization.

TOOLS
-----
- XFCE desktop
- Firefox browser
- XFCE Terminal
- Thunar file manager
- Mousepad text editor

DIAGNOSTICS
-----------
Run this from the Codespace terminal:
    /opt/pc-free/pc-free-status.sh

The desktop is disposable at the container level, but files committed to the repository remain in GitHub. Do not treat the Codespace filesystem as permanent storage unless you have verified your Codespaces persistence settings.

SECURITY
--------
The forwarded port is private by default. Do not make it public unless you deliberately want anyone with the URL to reach the desktop service.
