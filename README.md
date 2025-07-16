# webtop
✅ Ubuntu 22.04 ✅ XFCE desktop ✅ x11vnc + noVNC på port 6080 ✅ Java (OpenJDK 11) ✅ Google Chrome ✅ xdotool, cron ✅ Supervisor för enkel hantering

# 🖥️ Pico Webtop

**Pico Webtop** är en lättviktsbaserad Linux-desktop i Docker med noVNC och XFCE4, optimerad för att köra Java-baserade program via webbläsare – t.ex. för att administrera ett passersystem.

Tillgänglig direkt via Tailscale eller LAN på port `6080`.
Öppna webbläsaren och surfa till `http://<server-ip>:6080` för att komma åt noVNC.

SKA INTE KÖRAS ONLINE! BARA LOKALT! Tailscale är att rekommendera

---

## 🚀 Funktioner

✅ Ubuntu 22.04  
✅ XFCE4 skrivbordsmiljö  
✅ x11vnc + noVNC (åtkomst via webbläsare)  
✅ Java (OpenJDK 11)  
✅ Google Chrome
✅ xdotool (för GUI-automation)  
✅ cron (för framtida automatisering)  
✅ Ingen VNC-lösenkod i webbläsaren (enkel åtkomst)
✅ Inget lösenord krävs vid start

---

## 🌐 Åtkomst

📍 Gå till `http://<server-ip>:6080`
(eller `http://<tailscale-IP>:6080` om du kör via Tailscale)

Containern körs som root som standard. Ingen inloggning eller lösenord behövs.
