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

# Installera Chromium via Snap
RUN apt-get update && \
    apt-get install -y snapd && \
    snap install chromium

# Skapa loggkatalog
RUN mkdir -p /var/log/supervisor

# Kopiera supervisor config
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Exponera port 80
EXPOSE 80

# Starta supervisord
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
