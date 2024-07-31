<br>
<img src="https://github.com/Z0nure/PhantomShield/blob/main/menu%20premium.jpg">
</br>

  
# Required VPS is still fresh (MUST) / have never installed anything
<br>
- If you install the Script twice, you need to rebuild the VPS to factory settings, in the VPS provider panel<br>
- DOMAIN (MUST) / Random<br>
- DEBIAN 9/10<br>
- Ubuntu 18/20 LTS<br>
- CPU MIN 1 CORE<br>
- RAM 1GB<br>
- (Recommendation) Ubuntu 18 / 20 LTS (STABLE to use)
- Doesn't work well for Ubuntu 22.0, lots of bugs and errors.
<br>

<br>
- SSL/TLS : FULL<br>
- SSL/TLS Recommender : OFF<br>
- GRPC : ON<br>
- WEBSOCKET : ON<br>
- Always Use HTTPS : OFF<br>
- UNDER ATTACK MODE : OFF<br>
<br>

# Installation

Type command :

```
apt update && apt upgrade -y && cd /usr/bin/ && wget -O vpnpremium "https://raw.githubusercontent.com/Z0nure/PhantomShield/main/setup.sh" && chmod +x vpnpremium && ./vpnpremium
```
- Wait for the installation process to finish (5-10 mins)

# AFTER INSTALLATION, PERFORM AN UPDATE BY FOLLOWING THESE STEPS :

Type command :

```
cd /usr/bin/ && wget -O vpnpremium "https://raw.githubusercontent.com/Z0nure/update/main/vpnpremium.sh" && chmod +x vpnpremium && ./vpnpremium
```

After that, perform an update from the update menu.

## Service & Port:
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
  
## Feature
- Speedtest® by [Ookla®](https://speedtest.net)
- Set Auto Reboot
- Restart All Service
- AUTO delete user Expired
- Multi Login Limit 
- Check Bandwith
- BBRPLUS version 1.4.0 by [Chikage0o0](https://github.com/Chikage0o0) What is BBR [Search now BBR](https://www.google.com/search?q=what+bbr+in+linux)
- DNS CHANGER
- no auto backup? which... is permanently removed
- Just accept the existing features / you can add them yourself manually
- Additional Features (Optional) skipper (NOTE) install after [Step Install] is complete
- Optional [install OpenVPN + Slowdns +](https://github.com/givpn/AutoScriptXray/tree/master/udp-custom) UDP-Custom by [Exe302](https://gitlab.com/Exe302) + Slowdns by [SL](https://github.com/fisabiliyusri)
- Optional [install Panel Webmin + ADS Block](https://github.com/givpn/AutoScriptXray/tree/master/helium) Helium version 3.0 by [Abi Darwish](https://github.com/abidarwish)
- Optional [install Bot Telegram Xolpanel](https://github.com/givpn/AutoScriptXray/tree/master/bot%20telegram%20panel) by [XolvaID](https://github.com/XolvaID)
  


# SCRIPT FOR AUTO INSTALLING VPS ON UBUNTU & DEBIAN

- Step 2 for (ubuntu) directly install

```
sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget https://raw.githubusercontent.com/Z0nure/PhantomShield/main/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && screen -S setup ./setup.sh
```


# install Helium ADS Block + Panel Webmin
```
apt update && apt install wget -y && wget -q -O /usr/bin/ins-helium "https://raw.githubusercontent.com/Z0nure/alpha3/main/helium/ins-helium.sh" && chmod +x /usr/bin/ins-helium && ins-helium
```


# Gaining Root Access :

- The first step is to log in to the VPS.
- Then enter the command code below.
```
sudo su && cd && nano /etc/ssh/sshd_config
```

- ----  Change 'PermitRootLogin' to 'prohibit-password
  PermitRootLogin yes

- ------ Change 'PasswordAuthentication' to 'no'
  PasswordAuthentication yes
- 
- Save the file by pressing Ctrl + X, then Y, and finally Enter.
  
- Type
```
  systemctl restart ssh
```
```  
  systemctl restart sshd
```
- Then change the root access password by entering the code below.
  
- Type 
```
  passwd root
```

- Enter the password.
  
- Type the command.

```
  service ssh restart
```
```
  service sshd restart
```

# FOR CLOUD HOST ID, USE DEBIAN 10

<P>
</p> 
<p align="center"><img src="https://img.shields.io/static/v1?style=for-the-badge&logo=debian&label=Debian%209&message=Stretch&color=purple"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=debian&label=Debian%2010&message=Buster&color=purple">
</P>


  # BEFORE INSTALLING ON DEBIAN 9

  - Change the repository first, type the command below.
  - 
```
nano /etc/apt/sources.list
```

Enter the following line into the repository. :

```
deb http://http.us.debian.org/debian/ testing non-free contrib main
```

- Then press Ctrl + X.
- Type Y and press Enter.
- Perform the update & upgrade as usual.
- Then reboot the system, and after the reboot, install as usual.

  # Once installed, please type 100 for the initial update.

# Passed the Debian 11.07 test.
- Please note that SSTP needs to be reconfigured.
- If slow DNS is not active, then enter the following command and insert your DOMAIN name inside.
  ```
  sudo sed -i 's|\(ExecStart=/etc/slowdns/sldns-server -udp :5300 -privkey-file /etc/slowdns/server.key\)\(.*\)|\1 -nameserver example.com:53\2|' /etc/systemd/system/server-sldns.service
```
- Then restart all services.

# TESTING UBUNTU 22
- sshws is not active
- xray is running normally

