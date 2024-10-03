#!/bin/bash
clear
read -p "$( echo -e "Presiona ENTER para iniciar Instalacion") "
echo ""

apt install nodejs -y  >/dev/null 2>&1
systemctl disable ws
systemctl stop ws
wget -q -O /usr/local/bin/ws.js "https://raw.githubusercontent.com/JerrySBG/SBG2/main/ws.js" >/dev/null 2>&1
wget -q -O /etc/systemd/system/ws.service "https://raw.githubusercontent.com/JerrySBG/SBG2/main/ws-10015.service" >/dev/null 2>&1
chmod +x /usr/local/bin/*
systemctl daemon-reload
systemctl enable ws
systemctl restart ws
systemctl restart nginx
systemctl restart ws 
clear
read -p "$( echo " Done Update, Please Reboot Manual Your VPS") "
rm /root/ws-fix-sh
reboot
