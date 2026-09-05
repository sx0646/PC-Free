# PC-Free — One-Click Browser PC

A lightweight Linux desktop that launches automatically inside GitHub Codespaces and opens in your browser through noVNC.

> **Important:** GitHub Codespaces cannot reliably provide nested Windows/KVM virtualization. PC-Free therefore uses XFCE Linux for the browser-PC experience instead of pretending a Windows 10 VM is guaranteed.

## 🚀 One Click

### Open PC-Free in Codespaces

**[▶️ LAUNCH PC-FREE](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=1281239488)**

After Codespaces opens:

1. Wait for the container to finish building.
2. The `🖥️ PC-Free Browser PC` port opens automatically.
3. You are in the browser desktop.

If GitHub does not automatically open the browser tab, open the **Ports** panel and click the forwarded port **6080**.

> On an existing Codespace, rebuild the container after pulling the latest `.devcontainer` changes.

## 🖥️ What You Get

- XFCE graphical desktop
- Browser-accessible noVNC session
- Firefox
- XFCE Terminal
- Thunar file manager
- Mousepad text editor
- Automatic Xvfb + XFCE + x11vnc + noVNC startup
- 1440×900 desktop resolution
- No VirtualBox or VMware required
- Works without requiring `/dev/kvm`

## 🔧 How It Works

```text
GitHub Codespaces
       ↓
  Dev Container
       ↓
     Xvfb
       ↓
     XFCE
       ↓
    x11vnc
       ↓
    noVNC
       ↓
   Browser :6080
```

GitHub Codespaces can automatically forward a port and open it in a browser. citeturn0search0turn0search8

## 🔐 Security

The forwarded port is private by default. Keep port 6080 private unless you intentionally want other people with the forwarded URL to access the desktop. citeturn0search2turn0search7

## 🛠️ Troubleshooting

### Browser does not open

Open the Codespace **Ports** panel and open port **6080**.

### Old Codespace still shows the previous setup

Rebuild the Codespace container so the updated `.devcontainer` configuration is applied. GitHub notes that existing Codespaces need to be rebuilt after configuration changes. citeturn0search1

### Check desktop services

Run:

```bash
/opt/pc-free/pc-free-status.sh
```

## 📁 Main Components

```text
.devcontainer/
├── Dockerfile
├── devcontainer.json
├── supervisord.conf
├── supervisor.conf
├── start-desktop.sh
├── pc-free-status.sh
├── novnc/
│   └── index.html
├── xfce/
│   ├── xfce4-panel.xml
│   ├── xsettings.xml
│   └── xfwm4.xml
└── desktop/
    └── README.txt
```

## ⚠️ Windows VM Note

The original project description claimed that a Windows 10 VM would run inside Codespaces using Docker/KVM. That is not a reliable Codespaces capability, so this version intentionally provides the most practical browser-PC setup instead: a full Linux GUI desktop in the browser.

For a real Windows VM, use a machine/host where hardware virtualization is actually available.

## License

MIT
