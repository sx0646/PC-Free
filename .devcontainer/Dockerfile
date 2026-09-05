FROM mcr.microsoft.com/devcontainers/base:ubuntu

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:1

USER root

RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    xfce4-terminal \
    dbus-x11 \
    x11-xserver-utils \
    x11vnc \
    xvfb \
    novnc \
    websockify \
    supervisor \
    docker.io \
    docker-compose-v2 \
    curl \
    wget \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/supervisor/conf.d

RUN cat > /etc/supervisor/conf.d/desktop.conf <<'EOF'
[supervisord]
nodaemon=true
user=root

[program:xvfb]
command=/usr/bin/Xvfb :1 -screen 0 1280x720x24 -ac
priority=10
autorestart=true
stdout_logfile=/var/log/xvfb.log
stderr_logfile=/var/log/xvfb-error.log

[program:xfce]
command=/bin/bash -c "sleep 2 && su - codespace -c 'DISPLAY=:1 dbus-launch --exit-with-session startxfce4'"
environment=DISPLAY=":1",HOME="/home/codespace",USER="codespace"
priority=20
autorestart=true
stdout_logfile=/var/log/xfce.log
stderr_logfile=/var/log/xfce-error.log

[program:x11vnc]
command=/bin/bash -c "sleep 5 && x11vnc -display :1 -forever -shared -nopw -rfbport 5900"
priority=30
autorestart=true
stdout_logfile=/var/log/x11vnc.log
stderr_logfile=/var/log/x11vnc-error.log

[program:novnc]
command=/bin/bash -c "sleep 6 && websockify --web=/usr/share/novnc/ 6080 localhost:5900"
priority=40
autorestart=true
stdout_logfile=/var/log/novnc.log
stderr_logfile=/var/log/novnc-error.log
EOF

RUN mkdir -p /home/codespace/.config/xfce4/xfconf/xfce-perchannel-xml \
    && chown -R codespace:codespace /home/codespace

EXPOSE 6080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
