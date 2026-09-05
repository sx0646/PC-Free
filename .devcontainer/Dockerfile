FROM mcr.microsoft.com/devcontainers/base:ubuntu

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:1
ENV HOME=/home/codespace

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
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
    firefox \
    mousepad \
    thunar-archive-plugin \
    file-roller \
    fonts-noto-core \
    fonts-noto-cjk \
    curl \
    wget \
    git \
    ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/supervisor/conf.d /opt/pc-free /opt/pc-free/novnc /var/log/pc-free \
    /home/codespace/.config/xfce4/xfconf/xfce-perchannel-xml \
    /home/codespace/Desktop

COPY start-desktop.sh /opt/pc-free/start-desktop.sh
COPY pc-free-status.sh /opt/pc-free/pc-free-status.sh
COPY supervisor.conf /etc/supervisor/conf.d/pc-free.conf
COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY novnc/index.html /opt/pc-free/novnc/index.html
COPY xfce/xfce4-panel.xml /home/codespace/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
COPY xfce/xsettings.xml /home/codespace/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml
COPY xfce/xfwm4.xml /home/codespace/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml
COPY desktop/README.txt /home/codespace/Desktop/README.txt

RUN chmod +x /opt/pc-free/start-desktop.sh /opt/pc-free/pc-free-status.sh \
    && chown -R codespace:codespace /home/codespace /opt/pc-free /var/log/pc-free

EXPOSE 6080

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
