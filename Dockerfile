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

# Installera Chrome
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' \
  && apt-get update \
  && apt-get install -y google-chrome-stable \
  && rm -rf /var/lib/apt/lists/*

# Skapa loggkatalog
RUN mkdir -p /var/log/supervisor

# Kopiera supervisor config
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Exponera port 80
EXPOSE 80

# Starta supervisord
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
