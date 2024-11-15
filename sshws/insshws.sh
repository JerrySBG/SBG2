#!/bin/bash
# Proxy For Edukasi & Imclass
# SL
# ==========================================

# Link Hosting Kalian
JerrySBG="raw.githubusercontent.com/JerrySBG/SBG2/main/sshws"

# Getting Proxy Template
wget -q -O /usr/local/bin/ws-dropbear3 https://${JerrySBG}/websocket3.py
chmod +x /usr/local/bin/ws-dropbear3

# Installing Service
cat > /etc/systemd/system/ws-dropbear3.service << END
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
ExecStart=/usr/bin/python -O /usr/local/bin/ws-dropbear3 8090
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

# Getting Proxy Template
wget -O /usr/local/bin/ws-stunnel https://${JerrySBG}/ws-stunnel.txt
chmod +x /usr/local/bin/ws-stunnel

# Installing Service
cat > /etc/systemd/system/ws-stunnel.service << END
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
ExecStart=/usr/bin/python -O /usr/local/bin/ws-stunnel
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

# Getting Proxy Template
wget -O /usr/local/bin/ws-ovpn https://${JerrySBG}/ws-ovpn.py
chmod +x /usr/local/bin/ws-ovpn

# Installing Service
cat > /etc/systemd/system/ws-ovpn.service << END
[Unit]
Description=Python Proxy Mod By JERRY
Documentation=https://t.me/Jerry_SBG
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-ovpn
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload
systemctl enable ws-dropbear3.service
systemctl start ws-dropbear3.service
systemctl restart ws-dropbear3.service
systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service
systemctl enable ws-ovpn.service
systemctl start ws-ovpn.service
systemctl restart ws-ovpn.service