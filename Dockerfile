FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Installera nödvändiga paket
RUN apt-get update && apt-get install -y \
  supervisor \
  xfce4 \
  x11vnc \
  xvfb \
  novnc \
  websockify \
  xdotool \
  openjdk-11-jdk \
  cron \
  wget \
  unzip \
  gnupg \
  && rm -rf /var/lib/apt/lists/*

# Installera Google Chrome via APT (ingen snap)
RUN apt-get update && \
    apt-get install -y --no-install-recommends wget gnupg ca-certificates && \
    install -m 0755 -d /etc/apt/keyrings && \
    wget -qO- https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /etc/apt/keyrings/google-linux.gpg && \
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/google-linux.gpg] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends google-chrome-stable fonts-liberation libasound2 && \
    ln -s /usr/bin/google-chrome /usr/local/bin/chrome && \
    apt-get clean && rm -rf /var/lib/apt/lists/*


# Skapa loggkatalog
RUN mkdir -p /var/log/supervisor

# Kopiera supervisor config
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Exponera port 80
EXPOSE 80

# Starta supervisord
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

# Starta Chrome automatiskt i desktop-sessionen
RUN install -d /etc/xdg/autostart && \
    printf "[Desktop Entry]\nType=Application\nName=Chrome\nExec=/usr/bin/google-chrome-stable --no-first-run --disable-dev-shm-usage\nX-GNOME-Autostart-enabled=true\n" > /etc/xdg/autostart/chrome.desktop

