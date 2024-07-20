clear
echo Installing Websocket-SSH Python
sleep 1
echo Sila Tunggu Sebentar...
sleep 0.5
cd

# // GIT USER
GitUser="JerrySBG"
namafolder="websocket-python"

# // SYSTEM WEBSOCKET HTTPS 443
cat <<EOF> /etc/systemd/system/ws-https.service
[Unit]
Description=Python Proxy
Documentation=https://github.com/JerrySBG/
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
Restart=on-failure
ExecStart=/usr/bin/python -O /usr/local/bin/ws-https

[Install]
WantedBy=multi-user.target
EOF

# // SYSTEM WEBSOCKET HTTP 80
cat <<EOF> /etc/systemd/system/ws-http.service
[Unit]
Description=Python Proxy
Documentation=https://github.com/JerrySBG/
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-http
Restart=on-failure
[Install]
WantedBy=multi-user.target
EOF

# // SYSTEM WEBSOCKET HTTP 8001
cat <<EOF> /etc/systemd/system/ws-http2.service
[Unit]
Description=Python Proxy
Documentation=https://github.com/JerrySBG/
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-http2 8001
Restart=on-failure
[Install]
WantedBy=multi-user.target
EOF

# // SYSTEM WEBSOCKET HTTP 8080
cat <<EOF> /etc/systemd/system/ws-http3.service
[Unit]
Description=Python Proxy
Documentation=https://github.com/JerrySBG/
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-http3 8080
Restart=on-failure
[Install]
WantedBy=multi-user.target
EOF

# // SYSTEM WEBSOCKET HTTP 8280
cat <<EOF> /etc/systemd/system/ws-http4.service
[Unit]
Description=Python Proxy
Documentation=https://github.com/JerrySBG/
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-http4 8280
Restart=on-failure
[Install]
WantedBy=multi-user.target
EOF

# // SYSTEM WEBSOCKET OVPN
cat <<EOF> /etc/systemd/system/ws-ovpn.service
[Unit]
Description=Python Proxy
Documentation=https://github.com/JerrySBG/
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-ovpn 2097
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

# // PYTHON WEBSOCKET TLS && NONE
wget -q -O /usr/local/bin/ws-https https://raw.githubusercontent.com/${GitUser}/SBG2/main/${namafolder}/ws-https; chmod +x /usr/local/bin/ws-https

# // PYTHON WEBSOCKET DROPBEAR
wget -q -O /usr/local/bin/ws-http https://raw.githubusercontent.com/${GitUser}/SBG2/main/${namafolder}/ws-http; chmod +x /usr/local/bin/ws-http
wget -q -O /usr/local/bin/ws-http https://raw.githubusercontent.com/${GitUser}/SBG2/main/${namafolder}/ws-http; chmod +x /usr/local/bin/ws-http2
wget -q -O /usr/local/bin/ws-http https://raw.githubusercontent.com/${GitUser}/SBG2/main/${namafolder}/ws-http; chmod +x /usr/local/bin/ws-http3
wget -q -O /usr/local/bin/ws-http https://raw.githubusercontent.com/${GitUser}/SBG2/main/${namafolder}/ws-http; chmod +x /usr/local/bin/ws-http4

# // PYTHON WEBSOCKET OVPN
wget -q -O /usr/local/bin/ws-ovpn https://raw.githubusercontent.com/${GitUser}/SBG2/main/${namafolder}/ws-ovpn; chmod +x /usr/local/bin/ws-ovpn

# // RESTART && ENABLE SSHVPN WEBSOCKET TLS 
systemctl daemon-reload
systemctl enable ws-https
systemctl restart ws-https
systemctl enable ws-http
systemctl restart ws-http
systemctl enable ws-http2
systemctl restart ws-http2
systemctl enable ws-http3
systemctl restart ws-http3
systemctl enable ws-http4
systemctl restart ws-http4
systemctl enable ws-ovpn
systemctl restart ws-ovpn
