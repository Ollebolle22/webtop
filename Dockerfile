FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV USER=ubuntu
ENV PASSWORD=secret

# Uppdatera och installera alla paket
RUN apt-get update && apt-get install -y \
    xfce4 xfce4-goodies \
    x11vnc \
    novnc websockify \
    openjdk-11-jre \
    xdotool \
    cron \
    xvfb \
    wget curl gnupg2 software-properties-common \
    sudo supervisor net-tools unzip \
    && apt-get clean

# Installera Google Chrome (stable)
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/google-chrome.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && apt-get install -y google-chrome-stable

# Skapa användare
RUN useradd -m -s /bin/bash $USER && \
    echo "$USER:$PASSWORD" | chpasswd && \
    usermod -aG sudo $USER

# Skapa lösenord för x11vnc
RUN mkdir -p /home/$USER/.vnc && \
    x11vnc -storepasswd $PASSWORD /home/$USER/.vnc/passwd && \
    chown -R $USER:$USER /home/$USER/.vnc

# Kopiera startfiler
COPY startup.sh /startup.sh
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN chmod +x /startup.sh

EXPOSE 80

USER ubuntu
CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
