#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

# https://raw.githubusercontent.com/hokagelegend2023/ijinpremium/main/ijin 
MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/JerrySBG/SBG2/main/izin | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/JerrySBG/SBG2/main/izin | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}

clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
cd /root
#System version number
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi

localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi
mkdir -p /etc/xray

echo -e "[ ${tyblue}NOTES${NC} ] Before we go.. "
sleep 1
echo -e "[ ${tyblue}NOTES${NC} ] Check the HEADER first"
sleep 2
echo -e "[ ${green}INFO${NC} ] Checking headers is not enabled"
sleep 1

secs_to_human() {
    echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minute's $(( ${1} % 60 )) seconds"
}
start=$(date +%s)
ln -fs /usr/share/zoneinfo/America/Denver /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1

coreselect=''
cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
END
chmod 644 /root/.profile

echo -e "[ ${green}INFO${NC} ] Preparing the install file"
apt install git curl -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Aight good ... installation file is ready"
sleep 2
echo -ne "[ ${green}INFO${NC} ] Checking permission : "

PERMISSION
if [ -f /home/needupdate ]; then
red "Your script need to update first !"
exit 0
elif [ "$res" = "Permission Accepted..." ]; then
green "Permission Accepted!"
else
red "Permission Denied!"
rm setup.sh > /dev/null 2>&1
sleep 10
exit 0
fi
sleep 3

mkdir -p /etc/phantomshield
mkdir -p /etc/phantomshield/theme
mkdir -p /var/lib/phantomshield-pro >/dev/null 2>&1
mkdir -p /etc/v2ray >/dev/null 2>&1
mkdir -p /var/lib/phantom >/dev/null 2>&1
echo "IP=" >> /var/lib/phantom/ipvps.conf


if [ -f "/etc/xray/domain" ]; then
echo ""
echo -e "[ ${green}INFO${NC} ] Script Already Installed"
echo -ne "[ ${yell}WARNING${NC} ] Do you want to install again ? (y/n)? "
read answer
if [ "$answer" == "${answer#[Yy]}" ] ;then
rm setup.sh
sleep 10
exit 0
else
clear
fi
fi

echo ""

rm dependencies.sh
clear

yellow "Add Domain for vmess/vless/trojan dll"
echo " "
read -rp "Input ur domain : " -e pp
echo "$pp" > /root/domain
echo "$pp" > /root/scdomain
echo "$pp" > /etc/xray/domain
echo "$pp" > /etc/xray/scdomain
echo "$pp" > /etc/v2ray/domain
echo "IP=" >> /var/lib/phantom/ipvps.conf
echo "IP=$pp" > /var/lib/phantomshield-pro/ipvps.conf


#THEME RED
cat <<EOF>> /etc/phantomshield/theme/red
BG : \E[40;1;41m
TEXT : \033[0;31m
EOF
#THEME BLUE
cat <<EOF>> /etc/phantomshield/theme/blue
BG : \E[40;1;44m
TEXT : \033[0;34m
EOF
#THEME GREEN
cat <<EOF>> /etc/phantomshield/theme/green
BG : \E[40;1;42m
TEXT : \033[0;32m
EOF
#THEME YELLOW
cat <<EOF>> /etc/phantomshield/theme/yellow
BG : \E[40;1;43m
TEXT : \033[0;33m
EOF
#THEME MAGENTA
cat <<EOF>> /etc/phantomshield/theme/magenta
BG : \E[40;1;43m
TEXT : \033[0;33m
EOF
#THEME CYAN
cat <<EOF>> /etc/phantomshield/theme/cyan
BG : \E[40;1;46m
TEXT : \033[0;36m
EOF
#THEME CONFIG
cat <<EOF>> /etc/phantomshield/theme/color.conf
blue
EOF

curl -o /usr/bin/wlc https://raw.githubusercontent.com/JerrySBG/SBG2/main/backup/wlc

# Fetch the raw content of the 'info' file and save it to /usr/bin as info
curl -o /etc/update-motd.d/69-wlc https://raw.githubusercontent.com/JerrySBG/SBG2/main/backup/info2
dos2unix /etc/update-motd.d/69-wlc

# Set permissions for the downloaded files
chmod +x /usr/bin/wlc
chmod +x /etc/update-motd.d/69-wlc

# Add the content of 'info' file to the bottom of ~/.bashrc

#install ssh ovpn
echo -e "\e[33m-----------------------------------\033[0m"
echo -e "$BGreen   Install Suport System           $NC"
echo -e "\e[33m-----------------------------------\033[0m"
sleep 0.5
clear
wget -q https://raw.githubusercontent.com/JerrySBG/SBG2/main/dependencies.sh;chmod +x dependencies.sh;./dependencies.sh
rm dependencies.sh
clear
#install ssh ovpn
echo -e "\e[33m-----------------------------------\033[0m"
echo -e "$BGreen      Install SSH Websocket           $NC"
echo -e "\e[33m-----------------------------------\033[0m"
sleep 0.5
clear
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/ssh/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
rm ssh-vpn.sh
clear
#
#Instal Xray
echo -e "\e[33m-----------------------------------\033[0m"
echo -e "$BGreen          Install XRAY              $NC"
echo -e "\e[33m-----------------------------------\033[0m"
sleep 0.5
clear
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/xray/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
rm ins-xray.sh
clear
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/sshws/insshws.sh && chmod +x insshws.sh && ./insshws.sh
rm insshws.sh
clear
sleep 0.5
#
#install ssh IPSEC
echo -e "\e[33m-----------------------------------\033[0m"
echo -e "$BGreen      Install SSH IPSEC           $NC"
echo -e "\e[33m-----------------------------------\033[0m"
sleep 0.5
clear
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/ipsec/ipsec.sh && chmod +x ipsec.sh && ./ipsec.sh
rm ipsec.sh
clear
#
#install ssh SSTP
echo -e "\e[33m-----------------------------------\033[0m"
echo -e "$BGreen      Install SSH SSTP           $NC"
echo -e "\e[33m-----------------------------------\033[0m"
sleep 0.5
clear
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/sstp/sstp.sh && chmod +x sstp.sh && ./sstp.sh
rm sstp.sh
clear
#install ssh WIREGUARD
echo -e "\e[33m-----------------------------------\033[0m"
echo -e "$BGreen      Install SSH WIREGUARD          $NC"
echo -e "\e[33m-----------------------------------\033[0m"
sleep 0.5
clear
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/wireguard/wg.sh && chmod +x wg.sh && ./wg.sh
rm wg.sh
clear
#Instal UDP & Slow Dns
echo -e "\e[33m-----------------------------------\033[0m"
echo -e "$BGreen  INSTALL SLOWDNS & UDP             $NC"
echo -e "\e[33m-----------------------------------\033[0m"
sleep 0.5
clear
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/udp-custom/udp.sh && chmod +x udp.sh && ./udp.sh
rm udp.sh
clear
#Instal UDP & Slow Dns
echo -e "\e[33m-----------------------------------\033[0m"
echo -e "$BGreen  INSTALL SLOWDNS & UDP             $NC"
echo -e "\e[33m-----------------------------------\033[0m"
sleep 0.5
clear
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/backup/set-br.sh && chmod +x set-br.sh && ./set-br.sh
rm set-br.sh
clear
#Instal menu
echo -e "\e[33m-----------------------------------\033[0m"
echo -e "$BGreen     Install MENU UPDATE           $NC"
echo -e "\e[33m-----------------------------------\033[0m"
sleep 0.5
clear
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/update/updatemenu.sh && chmod +x updatemenu.sh && ./updatemenu.sh
rm updatemenu.sh
clear
cd /usr/bin/
wget https://raw.githubusercontent.com/Z0nure/update/main/vpnpremium.sh && chmod +x vpnpremium.sh && ./vpnpremium.sh
sleep 2
chmod +x vpnpremium
sleep 2
cd
cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
menu
END
chmod 644 /root/.profile

if [ -f "/root/log-install.txt" ]; then
rm /root/log-install.txt > /dev/null 2>&1
fi
if [ -f "/etc/afak.conf" ]; then
rm /etc/afak.conf > /dev/null 2>&1
fi
if [ ! -f "/etc/log-create-ssh.log" ]; then
echo "Log SSH Account " > /etc/log-create-ssh.log
fi
if [ ! -f "/etc/log-create-vmess.log" ]; then
echo "Log Vmess Account " > /etc/log-create-vmess.log
fi
if [ ! -f "/etc/log-create-vless.log" ]; then
echo "Log Vless Account " > /etc/log-create-vless.log
fi
if [ ! -f "/etc/log-create-trojan.log" ]; then
echo "Log Trojan Account " > /etc/log-create-trojan.log
fi
if [ ! -f "/etc/log-create-shadowsocks.log" ]; then
echo "Log Shadowsocks Account " > /etc/log-create-shadowsocks.log
fi
history -c
serverV=$( curl -sS https://raw.githubusercontent.com/Z0nure/authpremium/main/.ver )
echo $serverV > /opt/.ver
aureb=$(cat /home/re_otm)
b=11
if [ $aureb -gt $b ]
then
gg="PM"
else
gg="AM"
fi
curl -sS ipv4.icanhazip.com > /etc/myipvps
echo ""
echo "=================================================================="  | tee -a log-install.txt
echo "=================================================================="  | tee -a log-install.txt 
echo "                     PHANTOM SHIELD VPN PREMIUM                    "  | tee -a log-install.txt
echo "                     SCRIPT VPS PREMIUM UPDATE                    "  | tee -a log-install.txt
echo "------------------------------------------------------------------"  | tee -a log-install.txt
echo "=================================================================="  | tee -a log-install.txt
echo ""
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                  : 22"  | tee -a log-install.txt
echo "   - Slow DNS                 : ALL PORT OPEN"  | tee -a log-install.txt
echo "   - SSH Websocket            : 80" | tee -a log-install.txt
echo "   - SSH SSL Websocket        : 443" | tee -a log-install.txt
echo "   - Stunnel4                 : 222, 777" | tee -a log-install.txt
echo "   - Dropbear                 : 109, 143" | tee -a log-install.txt
echo "   - Badvpn                   : 7100-7900" | tee -a log-install.txt
echo "   - Nginx                    : 81" | tee -a log-install.txt
echo "   - Vmess WS TLS             : 443" | tee -a log-install.txt
echo "   - Vless WS TLS             : 443" | tee -a log-install.txt
echo "   - Trojan WS TLS            : 443" | tee -a log-install.txt
echo "   - Shadowsocks WS TLS       : 443" | tee -a log-install.txt
echo "   - Vmess WS none TLS        : 80" | tee -a log-install.txt
echo "   - Vless WS none TLS        : 80" | tee -a log-install.txt
echo "   - Trojan WS none TLS       : 80" | tee -a log-install.txt
echo "   - Shadowsocks WS none TLS  : 80" | tee -a log-install.txt
echo "   - Vmess gRPC               : 443" | tee -a log-install.txt
echo "   - Vless gRPC               : 443" | tee -a log-install.txt
echo "   - Trojan gRPC              : 443" | tee -a log-install.txt
echo "   - Shadowsocks gRPC         : 443" | tee -a log-install.txt
echo ""
echo "=============================Contact==============================" | tee -a log-install.txt
echo "---------------------------PHANTOM SHIELD--------------------------" | tee -a log-install.txt
echo "------------------------Telegram : @TeamPegasus-------------------" | tee -a log-install.txt
echo "==================================================================" | tee -a log-install.txt
echo -e ""
echo ""
echo "" | tee -a log-install.txt
rm /root/setup.sh >/dev/null 2>&1
rm /root/ins-xray.sh >/dev/null 2>&1
rm /root/insshws.sh >/dev/null 2>&1
secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt
echo -e ""
echo " Auto reboot in 10 Seconds "
sleep 10
rm -rf setup.sh
reboot
