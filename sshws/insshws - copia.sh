#!/bin/bash
#installer Websocker tunneling 
url="https://raw.githubusercontent.com/JerrySBG/SBG2/main"
cd

#Install Script Websocket-SSH Python
wget -O /usr/local/bin/edu-proxy ${url}/sshws/https.py
wget -O /usr/local/bin/ws-dropbear ${url}/sshws/dropbear-ws.py.txt
wget -O /usr/local/bin/ws-dropbear2 ${url}/sshws/dropbear-ws2.py.txt
wget -O /usr/local/bin/ws-dropbear3 ${url}/sshws/dropbear-ws3.py.txt
wget -O /usr/local/bin/ws-stunnel ${url}/sshws/ws-stunnel.txt

#izin permision
chmod +x /usr/local/bin/edu-proxy
chmod +x /usr/local/bin/ws-dropbear
chmod +x /usr/local/bin/ws-dropbear2
chmod +x /usr/local/bin/ws-dropbear3
chmod +x /usr/local/bin/ws-stunnel
#chmod +x /usr/local/bin/edu-proxyovpn
#chmod +x /usr/local/bin/ws-openssh

#System Direcly dropbear Websocket-SSH Python
wget -O /etc/systemd/system/edu-proxy.service ${url}/sshws/http.service && chmod +x /etc/systemd/system/edu-proxy.service

#System Dropbear Websocket-SSH Python
wget -O /etc/systemd/system/ws-dropbear.service ${url}/sshws/service-wsdropbear.txt && chmod +x /etc/systemd/system/ws-dropbear.service
wget -O /etc/systemd/system/ws-dropbear2.service ${url}/sshws/service-wsdropbear2.txt && chmod +x /etc/systemd/system/ws-dropbear2.service
wget -O /etc/systemd/system/ws-dropbear3.service ${url}/sshws/service-wsdropbear3.txt && chmod +x /etc/systemd/system/ws-dropbear3.service


#System SSL/TLS Websocket-SSH Python
wget -O /etc/systemd/system/ws-stunnel.service ${url}/sshws/ws-stunnel.service.txt && chmod +x /etc/systemd/system/ws-stunnel.service

#restart service
systemctl daemon-reload

#Enable & Start & Restart directly dropbear
#systemctl daemon-reload
systemctl enable edu-proxy.service
systemctl start edu-proxy.service
systemctl restart edu-proxy.service

#Enable & Start & Restart ws-dropbear service
systemctl enable ws-dropbear.service
systemctl start ws-dropbear.service
systemctl restart ws-dropbear.service

#Enable & Start & Restart ws-stunnel service
systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service
clear
