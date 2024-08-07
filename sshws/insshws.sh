#!/bin/bash
#installer Websocker tunneling 
url="https://raw.githubusercontent.com/JerrySBG/SBG2/main"
cd

#Install Script Websocket-SSH Python
wget -O /usr/local/bin/edu-proxy ${url}/sshws/https.py
#wget -O /usr/local/bin/edu-proxy2 ${url}/sshws/https2.py
#wget -O /usr/local/bin/edu-proxy3 ${url}/sshws/https3.py
wget -O /usr/local/bin/ws-dropbear ${url}/sshws/dropbear-ws.py
wget -O /usr/local/bin/ws-stunnel ${url}/sshws/ws-stunnel.py

#izin permision
chmod +x /usr/local/bin/edu-proxy
chmod +x /usr/local/bin/ws-dropbear
chmod +x /usr/local/bin/ws-stunnel
#chmod +x /usr/local/bin/edu-proxyovpn
#chmod +x /usr/local/bin/ws-openssh

#System Direcly dropbear Websocket-SSH Python
wget -O /etc/systemd/system/edu-proxy.service ${url}/sshws/http.service && chmod +x /etc/systemd/system/edu-proxy.service
#wget -O /etc/systemd/system/edu-proxy2.service ${url}/sshws/http2.service && chmod +x /etc/systemd/system/edu-proxy2.service
#wget -O /etc/systemd/system/edu-proxy3.service ${url}/sshws/http3.service && chmod +x /etc/systemd/system/edu-proxy3.service

#System Dropbear Websocket-SSH Python
wget -O /etc/systemd/system/ws-dropbear.service ${url}/sshws/service-wsdropbear && chmod +x /etc/systemd/system/ws-dropbear.service

#System SSL/TLS Websocket-SSH Python
wget -O /etc/systemd/system/ws-stunnel.service ${url}/sshws/ws-stunnel.service && chmod +x /etc/systemd/system/ws-stunnel.service


#restart service
systemctl daemon-reload

#Enable & Start & Restart directly dropbear
systemctl enable edu-proxy.service
systemctl start edu-proxy.service
systemctl restart edu-proxy.service
#systemctl enable proxy2.service
#systemctl start proxy2.service
#systemctl restart proxy2.service
#systemctl enable proxy3.service
#systemctl start proxy3.service
#systemctl restart proxy3.service

#Enable & Start & Restart ws-dropbear service
systemctl enable ws-dropbear.service
systemctl start ws-dropbear.service
systemctl restart ws-dropbear.service

#Enable & Start & Restart ws-stunnel service
systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service
clear
