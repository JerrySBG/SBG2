#!/bin/bash
# Proxy For NO TLS
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
NC='\e[0m'
echo "Installing SSH Websocket By Jerry " | lolcat
echo "Progress..." | lolcat
sleep 3

# Getting Proxy Template
wget -q -O /usr/local/bin/ws https://raw.githubusercontent.com/JerrySBG/SBG2/main/sshws/ws.py
chmod +x /usr/local/bin/ws

# Installing Service
cat > /etc/systemd/system/ws.service << END
[Unit]
Description=Python Proxy Mod By Jerry
Documentation=https://t.me/Jerry_SBG
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws 701
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ws
systemctl start ws
systemctl restart ws