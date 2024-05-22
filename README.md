<br>
<img src="https://raw.githubusercontent.com/JerrySBG/SBG2/blob/main/menu%20premium.jpg">
</br>

Nunca tener instalado nada...VPS LIMPIA
<br>
- Si instala el script dos veces, deberá reconstruir el VPS a la configuración de fábrica, en el panel del proveedor de VPS.<br>
- DOMAIN (MUST) / Random<br>
- DEBIAN 9/10<br>
- Ubuntu 18/20 LTS<br>
- CPU MIN 1 CORE<br>
- RAM 1GB<br>
- (Recommendation) Ubuntu 18 / 20 LTS (STABLE to use)
<br>

<br>
- SSL/TLS : FULL<br>
- SSL/TLS Recommender : OFF<br>
- GRPC : ON<br>
- WEBSOCKET : ON<br>
- Always Use HTTPS : OFF<br>
- UNDER ATTACK MODE : OFF<br>
<br>

# INSTALADOR
```
apt update && apt upgrade -y --fix-missing && update-grub && sleep 2 && apt -y install xxd && apt install -y bzip2 && apt install -y wget && apt install -y curl && reboot
```

# Actualizacion Manual
```
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/setup.sh bash setup.sh
```
## SERVICIOS Y PUERTOS
<br>
- OpenSSH                  : 22<br>
- SSH Websocket            : 80<br>
- SSH SSL Websocket        : 443<br>
- Stunnel4                 : 222, 777<br>
- Dropbear                 : 109, 143<br>
- Badvpn                   : 7100-7900<br>
- Nginx                    : 86<br>
- Vmess WS TLS             : 443<br>
- Vless WS TLS             : 443<br>
- Trojan WS TLS            : 443<br>
- Shadowsocks WS TLS       : 443<br>
- Vmess WS none TLS        : 80<br>
- Vless WS none TLS        : 80<br>
- Trojan WS none TLS       : 80<br>
- Shadowsocks WS none TLS  : 80<br>
- Vmess gRPC               : 443<br>
- Vless gRPC               : 443<br>
- Trojan gRPC              : 443<br>
- Shadowsocks gRPC         : 443<br>
<br>
