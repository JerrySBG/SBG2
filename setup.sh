#!/bin/bash
function CEKIP () {
MYIP=$(curl -sS ipv4.icanhazip.com)
IPVPS=$(curl -sS https://raw.githubusercontent.com/JerrySBG/SBG2/main/ip | grep $MYIP | awk '{print $4}')
if [[ $MYIP == $IPVPS ]]; then
domain
Casper2
else
  domain
  Casper2
fi
}
clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
BIBlue='\033[1;94m'       # Blue
BGCOLOR='\e[1;97;101m'    # WHITE RED
tyblue='\e[1;36m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
cd /root
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
secs_to_human() {
echo "TIEMPO DE INSTALACION : $(( ${1} / 3600 )) horas $(( (${1} / 60) % 60 )) minutos $(( ${1} % 60 )) segundos"
}
rm -rf /etc/rmbl
mkdir -p /etc/rmbl
mkdir -p /etc/rmbl/theme
mkdir -p /var/lib/ >/dev/null 2>&1
echo "IP=" >> /var/lib/ipvps.conf
clear
echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ ${BGCOLOR}           INTRODUZCA SU NOMBRE         ${NC}${BIBlue} │${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo " "
until [[ $name =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Introduce tu nombre aquí sin espacios : " -e name
done
rm -rf /etc/profil
echo "$name" > /etc/profil
echo ""
clear
author=$(cat /etc/profil)
echo ""
echo ""

function key2(){
clear
echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ ${BGCOLOR} Por Favor Seleccione su Opción         ${BIBlue} │${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│  [ 1 ]  \033[1;37mPRUEBA DE 1 DÍA      ${NC}"
echo -e "${BIBlue}│  [ 2 ]  \033[1;37mUSUARIO YA COMPRADO     ${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
until [[ $key =~ ^[12]+$ ]]; do 
read -p "   Por favor seleccione los números 1 o 2 : " key
done
if [[ $key == "1" ]]; then
MYIP=$(curl -sS ipv4.icanhazip.com)
rm -rf /etc/github
mkdir /etc/github
curl -s https://pastebin.com/raw/t3aaqcej > /etc/github/api
curl -s https://pastebin.com/raw/cfivDKk2 > /etc/github/email
curl -s https://pastebin.com/raw/bSskAgjw > /etc/github/username
clear
APIGIT=$(cat /etc/github/api)
EMAILGIT=$(cat /etc/github/email)
USERGIT=$(cat /etc/github/username)
hhari=$(date -d "1 days" +"%Y-%m-%d")
mkdir /root/casper
cd /root/casper
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/ip >/dev/null 2>&1
echo "### $author $hhari $MYIP @trial" >> ipmini
sleep 1
rm -rf .git
git config --global user.email "${EMAILGIT}" >/dev/null 2>&1
git config --global user.name "${USERGIT}" >/dev/null 2>&1
git init >/dev/null 2>&1
git add ipmini 
git commit -m register >/dev/null 2>&1
git branch -M main >/dev/null 2>&1
git remote add origin https://github.com/${USERGIT}/permission >/dev/null 2>&1
git push -f https://${APIGIT}@github.com/${USERGIT}/permission >/dev/null 2>&1
sleep 1
rm -rf /root/rmbl
rm -rf /etc/github
clear
fi
if [[ $key == "2" ]]; then
clear
echo -e  "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e  "${BIBlue}│    INTRODUZCA LA CLAVE DE LA LICENCIA    │${NC}"
echo -e  "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo " "
read -rp "Introduce tu clave aquí (Ctrl + C = Exit) : " -e kode

if [ -z $kode ]; then
echo -e "CÓDIGO EQUIVOCADO POR FAVOR VUELVA A INGRESAR EL CÓDIGO"
key2
fi
LIST=$(curl -sS https://raw.githubusercontent.com/RMBL-VPN/license/main/key | grep $kode | awk '{print $2}')
Key=$(curl -sS https://raw.githubusercontent.com/RMBL-VPN/license/main/key | grep $kode | awk '{print $3}')
KEY2=$(curl -sS https://raw.githubusercontent.com/RMBL-VPN/license/main/key | grep $kode | awk '{print $4}')
ADMIN=$(curl -sS https://raw.githubusercontent.com/RMBL-VPN/license/main/key | grep $kode | awk '{print $5}')
TOTALIP=$(curl -sS https://raw.githubusercontent.com/RMBL-VPN/license/main/key | grep $kode | awk '{print $6}')
cd
if [[ $kode == "RMBLVIP" ]]; then
MYIP=$(curl -sS ipv4.icanhazip.com)
rm -rf /etc/github
mkdir /etc/github
curl -s https://pastebin.com/raw/t3aaqcej > /etc/github/api
curl -s https://pastebin.com/raw/cfivDKk2 > /etc/github/email
curl -s https://pastebin.com/raw/bSskAgjw > /etc/github/username
clear
APIGIT=$(cat /etc/github/api)
EMAILGIT=$(cat /etc/github/email)
USERGIT=$(cat /etc/github/username)
hhari=$(date -d "30 days" +"%Y-%m-%d")
mkdir /root/rmbl
cd /root/rmbl
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/ip >/dev/null 2>&1

echo "### $author $hhari $MYIP @RMBL" >> ipmini

sleep 0.5
rm -rf .git
git config --global user.email "${EMAILGIT}" >/dev/null 2>&1
git config --global user.name "${USERGIT}" >/dev/null 2>&1
git init >/dev/null 2>&1
git add ipmini 
git commit -m register >/dev/null 2>&1
git branch -M main >/dev/null 2>&1
git remote add origin https://github.com/${USERGIT}/permission >/dev/null 2>&1
git push -f https://${APIGIT}@github.com/${USERGIT}/permission >/dev/null 2>&1
sleep 0.5
rm ipmini
elif [[ $kode == "RMBLVVIP" ]]; then
MYIP2=$(curl -sS ipv4.icanhazip.com)
author2=$(cat /etc/profil)
rm -rf /etc/github
mkdir /etc/github
curl -s https://pastebin.com/raw/t3aaqcej > /etc/github/api
curl -s https://pastebin.com/raw/cfivDKk2 > /etc/github/email
curl -s https://pastebin.com/raw/bSskAgjw > /etc/github/username
clear
APIGIT=$(cat /etc/github/api)
EMAILGIT=$(cat /etc/github/email)
USERGIT=$(cat /etc/github/username)
hhari2=$(date -d "999 days" +"%Y-%m-%d")
mkdir /root/rmbl
cd /root/rmbl
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/ip >/dev/null 2>&1

sed -i "/# VIP/a ### ${author2} ${hhari2} ${MYIP2} ON 999 VIP" /root/rmbl/ipmini

sleep 0.5
rm -rf .git
git config --global user.email "${EMAILGIT}" >/dev/null 2>&1
git config --global user.name "${USERGIT}" >/dev/null 2>&1
git init >/dev/null 2>&1
git add ipmini 
git commit -m register >/dev/null 2>&1
git branch -M main >/dev/null 2>&1
git remote add origin https://github.com/${USERGIT}/permission >/dev/null 2>&1
git push -f https://${APIGIT}@github.com/${USERGIT}/permission >/dev/null 2>&1
sleep 0.5
rm ipmini
elif [[ $kode == "SFADMIN" ]]; then
MYIP3=$(curl -sS ipv4.icanhazip.com)
author3=$(cat /etc/profil)
rm -rf /etc/github
mkdir /etc/github
curl -s https://pastebin.com/raw/t3aaqcej > /etc/github/api
curl -s https://pastebin.com/raw/cfivDKk2 > /etc/github/email
curl -s https://pastebin.com/raw/bSskAgjw > /etc/github/username
clear
APIGIT=$(cat /etc/github/api)
EMAILGIT=$(cat /etc/github/email)
USERGIT=$(cat /etc/github/username)
hhari3=$(date -d "999 days" +"%Y-%m-%d")
mkdir /root/rmbl
cd /root/rmbl
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/ip >/dev/null 2>&1

sed -i "/# RESELLER/a ### ${author3} ${hhari3} ${MYIP3} ON 999" /root/rmbl/ipmini

sleep 0.5
rm -rf .git
git config --global user.email "${EMAILGIT}" >/dev/null 2>&1
git config --global user.name "${USERGIT}" >/dev/null 2>&1
git init >/dev/null 2>&1
git add ipmini 
git commit -m register >/dev/null 2>&1
git branch -M main >/dev/null 2>&1
git remote add origin https://github.com/${USERGIT}/permission >/dev/null 2>&1
git push -f https://${APIGIT}@github.com/${USERGIT}/permission >/dev/null 2>&1
sleep 0.5
rm ipmini
elif [[ $kode == $Key ]]; then
MYIP=$(curl -sS ipv4.icanhazip.com)
rm -rf /etc/github
mkdir /etc/github
curl -s https://pastebin.com/raw/t3aaqcej > /etc/github/api
curl -s https://pastebin.com/raw/cfivDKk2 > /etc/github/email
curl -s https://pastebin.com/raw/bSskAgjw > /etc/github/username
clear
APIGIT=$(cat /etc/github/api)
EMAILGIT=$(cat /etc/github/email)
USERGIT=$(cat /etc/github/username)
hhari=$(date -d "$KEY2 days" +"%Y-%m-%d")
mkdir /root/rmbl
cd /root/rmbl
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/ip >/dev/null 2>&1
if [ "$ADMIN" = "ON" ]; then
sed -i "/# RESELLER/a ### ${author} ${hhari} ${MYIP} ${ADMIN} ${TOTALIP}" /root/rmbl/ipmini
else
echo "### $author $hhari $MYIP @$LIST" >> ipmini
fi

sleep 0.5
rm -rf .git
git config --global user.email "${EMAILGIT}" >/dev/null 2>&1
git config --global user.name "${USERGIT}" >/dev/null 2>&1
git init >/dev/null 2>&1
git add ipmini 
git commit -m register >/dev/null 2>&1
git branch -M main >/dev/null 2>&1
git remote add origin https://github.com/${USERGIT}/permission >/dev/null 2>&1
git push -f https://${APIGIT}@github.com/${USERGIT}/permission >/dev/null 2>&1
sleep 0.5
rm ipmini
wget https://raw.githubusercontent.com/RMBL-VPN/license/main/key >/dev/null 2>&1
if [ "$ADMIN" = "ON" ]; then
sed -i "/^### $LIST $Key $KEY2 $ADMIN $TOTALIP/d" /root/rmbl/key
else
sed -i "/^### $LIST $Key $KEY2/d" /root/rmbl/key
fi
sleep 0.5
rm -rf .git
git config --global user.email "${EMAILGIT}" >/dev/null 2>&1
git config --global user.name "${USERGIT}" >/dev/null 2>&1
git init >/dev/null 2>&1
git add key
git commit -m register >/dev/null 2>&1
git branch -M main >/dev/null 2>&1
git remote add origin https://github.com/${USERGIT}/license >/dev/null 2>&1
git push -f https://${APIGIT}@github.com/${USERGIT}/license >/dev/null 2>&1
rm -rf /root/rmbl
rm -rf /etc/github
clear
else
echo -e "CÓDIGO EQUIVOCADO POR FAVOR VUELVA A INGRESAR EL CÓDIGO"
sleep 1
key2
fi
fi
}
function domain(){
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mActualizando Dominio.. \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mActualizando Dominio... \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m Con Exito !\033[1;37m"
    tput cnorm
}
res1() {
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/rmbl.sh && chmod +x rmbl.sh && ./rmbl.sh
clear
}
res2() {
wget https://raw.githubusercontent.com/RMBL-VPN/v1/main/install/r1.sh && chmod +x cr1.sh && ./per1.sh
clear
}
res3() {
wget https://raw.githubusercontent.com/RMBL-VPN/v1/main/install/c2.sh && chmod +x c2.sh && ./cr2.sh
clear
}
res4() {
wget https://raw.githubusercontent.com/RMBL-VPN/v1/main/install/r3.sh && chmod +x r3.sh && ./r3.sh
clear
}
clear
cd  
echo -e "${BIBlue}╭══════════════════════════════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│             \033[1;37mSeleccione Opcion para Configurar Dominio            ${BIBlue}│${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════════════════════════════╯${NC}"
echo -e "${BIBlue}╭══════════════════════════════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│  [ 1 ]  \033[1;37mTu propio Dominio Y SlowDNS Aletorio      ${NC}"
echo -e "${BIBlue}│  [ 2 ]  \033[1;37mDominios que tiene el Script y SlowDNS aleatorio  ${NC}"
#echo -e "${BIBlue}│  [ 3 ]  \033[1;37mTu propio Dominio y tu Propio Dominio SlowDNS    ${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════════════════════════════╯${NC}"
until [[ $domain =~ ^[1-2]+$ ]]; do 
read -p "   Por favor seleccione los números 1 o 2 : " domain
done
if [[ $domain == "1" ]]; then
clear 
echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│            \033[1;37mDOMINIO O SUBDOMINIO          ${BIBlue}│${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo -e  "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e  "${BIBlue}│               \033[1;37mGRACIAS POR                ${BIBlue}│${NC}"
echo -e  "${BIBlue}│        \033[1;37mUSAR MI AUTOSCRIPT PREMIUM        ${BIBlue}│${NC}"
echo -e  "${BIBlue}│                \033[1;37mBY JERRY 2024             ${BIBlue}│${NC}"
echo -e  "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo " "
until [[ $dnss =~ ^[a-zA-Z0-9_.-]+$ ]]; do 
read -rp "Introduce tu Sub/Dominio aquí : " -e dnss
done
rm -rf /etc/xray
rm -rf /etc/v2ray
rm -rf /etc/nsdomain
rm -rf /etc/per
mkdir -p /etc/xray
mkdir -p /etc/v2ray
mkdir -p /etc/nsdomain
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/slwdomain
touch /etc/v2ray/scdomain
echo "$dnss" > /root/domain
echo "$dnss" > /root/scdomain
echo "$dnss" > /etc/xray/scdomain
echo "$dnss" > /etc/v2ray/scdomain
echo "$dnss" > /etc/xray/domain
echo "$dnss" > /etc/v2ray/domain
echo "IP=$dnss" > /var/lib/ipvps.conf
echo ""
clear
fi
if [[ $domain == "2" ]]; then
clear
echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ \033[1;37mSeleccione Opcion para Configurar Dominio${BIBlue}│${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│  [ 1 ]  \033[1;37mDominio xxx.tepllovpn.eu.org          ${NC}"  
echo -e "${BIBlue}│  [ 2 ]  \033[1;37mDominio xxx.vpnvip.app                ${NC}"  
echo -e "${BIBlue}│  [ 3 ]  \033[1;37mDominio xxx.slowapp.cfd               ${NC}"  
echo -e "${BIBlue}│  [ 4 ]  \033[1;37mDominio xxx.slowapp.dev               ${NC}"  
echo -e "${BIBlue}│  [ 5 ]  \033[1;37mDominio xxx.vipnvip.tech              ${NC}"                                        
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
until [[ $domain2 =~ ^[1-5]+$ ]]; do 
read -p "   Por favor seleccione los números 1 al 1 : " domain2
done
fi
if [[ $domain2 == "1" ]]; then
clear
echo -e  "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e  "${BIBlue}│  \033[1;37mEjemplo de subdominio xxx.tepllovpn.eu.org   ${BIBlue}│${NC}"
echo -e  "${BIBlue}│    \033[1;37mxxx Entonces tu Subdominio            ${BIBlue}│${NC}"
echo -e  "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo " "
until [[ $dn1 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Ingresa tu Subdominio aquí sin Espacios : " -e dn1
done
rm -rf /etc/xray
rm -rf /etc/v2ray
rm -rf /etc/nsdomain
rm -rf /etc/per
mkdir -p /etc/xray
mkdir -p /etc/v2ray
mkdir -p /etc/nsdomain
mkdir -p /etc/per
touch /etc/per/id
touch /etc/per/token
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/slwdomain
touch /etc/v2ray/scdomain
echo "$dn1" > /root/subdomainx
cd
sleep 1
fun_bar 'res1'
clear
rm /root/subdomainx
elif [[ $domain2 == "2" ]]; then
clear
echo -e  "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e  "${BIBlue}│  \033[1;37mEjemplo de subdominio xxx.vpnvip.app         ${BIBlue}│${NC}"
echo -e  "${BIBlue}│    \033[1;37mxxx Entonces tu Subdominio            ${BIBlue}│${NC}"
echo -e  "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo " "
until [[ $dn2 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Ingresa tu Subdominio aquí sin Espacios : " -e dn2
done
rm -rf /etc/xray
rm -rf /etc/v2ray
rm -rf /etc/nsdomain
rm -rf /etc/per
mkdir -p /etc/xray
mkdir -p /etc/v2ray
mkdir -p /etc/nsdomain
mkdir -p /etc/per
touch /etc/per/id
touch /etc/per/token
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/slwdomain
touch /etc/v2ray/scdomain
echo "$dn2" > /root/subdomainx
cd
sleep 1
fun_bar 'res2'
clear
rm /root/subdomainx
elif [[ $domain2 == "3" ]]; then
clear
echo -e  "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e  "${BIBlue}│  \033[1;37mEjemplo de subdominio xxx.slowapp.cfd        ${BIBlue}│${NC}"
echo -e  "${BIBlue}│    \033[1;37mxxx Entonces tu Subdominio            ${BIBlue}│${NC}"
echo -e  "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo " "
until [[ $dn3 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Ingresa tu Subdominio aquí sin Espacios : " -e dn3
done
rm -rf /etc/xray
rm -rf /etc/v2ray
rm -rf /etc/nsdomain
rm -rf /etc/per
mkdir -p /etc/xray
mkdir -p /etc/v2ray
mkdir -p /etc/nsdomain
mkdir -p /etc/per
touch /etc/per/id
touch /etc/per/token
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/slwdomain
touch /etc/v2ray/scdomain
echo "$dn3" > /root/subdomainx
cd
sleep 1
fun_bar 'res3'
clear
rm /root/subdomainx
elif [[ $domain2 == "4" ]]; then
clear
echo -e  "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e  "${BIBlue}│  \033[1;37mEjemplo de subdominio xxx.slowapp.dev        ${BIBlue}│${NC}"
echo -e  "${BIBlue}│    \033[1;37mxxx Entonces tu Subdominio            ${BIBlue}│${NC}"
echo -e  "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo " "
until [[ $dn4 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Ingresa tu Subdominio aquí sin Espacios : " -e dn4
done
rm -rf /etc/xray
rm -rf /etc/v2ray
rm -rf /etc/nsdomain
rm -rf /etc/per
mkdir -p /etc/xray
mkdir -p /etc/v2ray
mkdir -p /etc/nsdomain
mkdir -p /etc/per
touch /etc/per/id
touch /etc/per/token
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/slwdomain
touch /etc/v2ray/scdomain
echo "$dn4" > /root/subdomainx
cd
sleep 1
fun_bar 'res4'
clear
rm /root/subdomainx
elif [[ $domain2 == "5" ]]; then
clear
echo -e  "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e  "${BIBlue}│  \033[1;37mEjemplo de subdominio xxx.vipnvip.tech       ${BIBlue}│${NC}"
echo -e  "${BIBlue}│    \033[1;37mxxx Entonces tu Subdominio            ${BIBlue}│${NC}"
echo -e  "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo " "
until [[ $dn4 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Ingresa tu Subdominio aquí sin Espacios : " -e dn5
done
rm -rf /etc/xray
rm -rf /etc/v2ray
rm -rf /etc/nsdomain
rm -rf /etc/per
mkdir -p /etc/xray
mkdir -p /etc/v2ray
mkdir -p /etc/nsdomain
mkdir -p /etc/per
touch /etc/per/id
touch /etc/per/token
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/slwdomain
touch /etc/v2ray/scdomain
echo "$dn5" > /root/subdomainx
cd
sleep 1
fun_bar 'res5'
fi
if [[ $domain == "3" ]]; then
clear
echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│            \033[1;37mDOMINIO O SUBDOMINIO          ${BIBlue}│${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo -e  "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e  "${BIBlue}│               \033[1;37mGRACIAS POR                ${BIBlue}│${NC}"
echo -e  "${BIBlue}│        \033[1;37mUSAR MI AUTOSCRIPT PREMIUM        ${BIBlue}│${NC}"
echo -e  "${BIBlue}│                \033[1;37mBY JERRY 2024             ${BIBlue}│${NC}"
echo -e  "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo " "
until [[ $dns1 =~ ^[a-zA-Z0-9_.-]+$ ]]; do 
read -rp "Introduce tu dominio aquí : " -e dns1
done
echo ""
mkdir -p /etc/xray
mkdir -p /etc/v2ray
touch /etc/xray/domain
touch /etc/v2ray/domain
echo "$dns1" > /etc/xray/domain
echo "$dns1" > /etc/v2ray/domain
echo "IP=$dns1" > /var/lib/ipvps.conf
clear
echo ""
echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│            \033[1;37mDOMINIO O SUBDOMINIO          ${BIBlue}│${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo -e  "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e  "${BIBlue}│               \033[1;37mGRACIAS POR                ${BIBlue}│${NC}"
echo -e  "${BIBlue}│        \033[1;37mUSAR MI AUTOSCRIPT PREMIUM        ${BIBlue}│${NC}"
echo -e  "${BIBlue}│                \033[1;37mBY JERRY 2024             ${BIBlue}│${NC}"
echo -e  "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo " "
until [[ $dns2 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Ingrese su dominio SlowDNS aquí : " -e dns2
done
mkdir -p /etc/xray
touch /etc/xray/nsdomain
echo "$dns2" > /etc/xray/nsdomain
echo "$dns2" >/etc/xray/dns
fi
}
cat <<EOF>> /etc/rmbl/theme/green
BG : \E[40;1;42m
TEXT : \033[0;32m
EOF
cat <<EOF>> /etc/rmbl/theme/yellow
BG : \E[40;1;43m
TEXT : \033[0;33m
EOF
cat <<EOF>> /etc/rmbl/theme/red
BG : \E[40;1;41m
TEXT : \033[0;31m
EOF
cat <<EOF>> /etc/rmbl/theme/blue
BG : \E[40;1;44m
TEXT : \033[0;34m
EOF
cat <<EOF>> /etc/rmbl/theme/magenta
BG : \E[40;1;45m
TEXT : \033[0;35m
EOF
cat <<EOF>> /etc/rmbl/theme/cyan
BG : \E[40;1;46m
TEXT : \033[0;36m
EOF
cat <<EOF>> /etc/rmbl/theme/lightgray
BG : \E[40;1;47m
TEXT : \033[0;37m
EOF
cat <<EOF>> /etc/rmbl/theme/darkgray
BG : \E[40;1;100m
TEXT : \033[0;90m
EOF
cat <<EOF>> /etc/rmbl/theme/lightred
BG : \E[40;1;101m
TEXT : \033[0;91m
EOF
cat <<EOF>> /etc/rmbl/theme/lightgreen
BG : \E[40;1;102m
TEXT : \033[0;92m
EOF
cat <<EOF>> /etc/rmbl/theme/lightyellow
BG : \E[40;1;103m
TEXT : \033[0;93m
EOF
cat <<EOF>> /etc/rmbl/theme/lightblue
BG : \E[40;1;104m
TEXT : \033[0;94m
EOF
cat <<EOF>> /etc/rmbl/theme/lightmagenta
BG : \E[40;1;105m
TEXT : \033[0;95m
EOF
cat <<EOF>> /etc/rmbl/theme/lightcyan
BG : \E[40;1;106m
TEXT : \033[0;96m
EOF
cat <<EOF>> /etc/rmbl/theme/color.conf
lightcyan
EOF
function Casper2(){
cd
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1
clear
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/tools.sh &> /dev/null
chmod +x tools.sh 
bash tools.sh
clear
start=$(date +%s)
ln -fs /usr/share/zoneinfo/America/Mexico_City /etc/localtime
apt install git curl -y >/dev/null 2>&1
apt install python -y >/dev/null 2>&1
}
function Casper3(){
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mEspera, Instalando archivos \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mEspera, Instalando archivos \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m Con Exito !\033[1;37m"
    tput cnorm
}


res2() {
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
clear
} 

res3() {
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
clear
}

res4() {
#wget https://raw.githubusercontent.com/warouhh/new/main/sshws/insshws.sh && chmod +x insshws.sh && ./insshws.sh
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/sshws/insshws.sh && chmod +x insshws.sh && ./insshws.sh
clear
}

res5() {
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/set-br.sh && chmod +x set-br.sh && ./set-br.sh
clear
}

res6() {
#wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/sshws/ohp.sh && chmod +x ohp.sh && ./ohp.sh
clear
}

res7() {
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/menu/update.sh && chmod +x update.sh && ./update.sh
clear
}

res8() {
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/slowdns/installsl.sh && chmod +x installsl.sh && bash installsl.sh
clear
}

res9() {
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/udp-custom.sh && chmod +x udp-custom.sh && bash udp-custom.sh
clear
}
res10() {
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/noobz/noobzvpns.zip
unzip noobzvpns.zip
chmod +x noobzvpns/*
cd noobzvpns
bash install.sh
rm -rf noobzvpns
systemctl restart noobzvpns
clear
}

res11() {
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/bin/limit.sh && chmod +x limit.sh && ./limit.sh
clear
}

res12() {
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/ins-trgo.sh && chmod +x ins-trgo.sh && bash ./ins-trgo.sh
clear
}

echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ ${BGCOLOR}  PROCESANDO A INSTALAR SSH & OVVPN     ${NC}${BIBlue} │${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
fun_bar 'res2'

echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ ${BGCOLOR}       PROCESANDO A INSTALAR XRAY       ${NC}${BIBlue} │${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
fun_bar 'res3'

echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ ${BGCOLOR}     PROCESANDO A INSTALAR WEBSOCKET SSH${NC}${BIBlue} │${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
fun_bar 'res4'

echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ ${BGCOLOR}     PROCESANDO A INSTALAR BACKUP MENU  ${NC}${BIBlue} │${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
fun_bar 'res5'

echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ ${BGCOLOR}        PROCESANDO A INSTALAR OHP       ${NC}${BIBlue} │${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
fun_bar 'res6'

echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ ${BGCOLOR}         DESCARGANDO EXTRA MENU         ${NC}${BIBlue} │${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
fun_bar 'res7'

echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ ${BGCOLOR}         DESCARGANDO SLOW DNS           ${NC}${BIBlue} │${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
fun_bar 'res8'

echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ ${BGCOLOR}         DESCARGANDO UDP COSTUM         ${NC}${BIBlue} │${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
fun_bar 'res9'

echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ ${BGCOLOR}    PROCESANDO A INSTALAR NOOBZVPNS     ${NC}${BIBlue} │${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
fun_bar 'res10'

echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ ${BGCOLOR}    PROCESANDO A INSTALAR LIMIT XRAY    ${NC}${BIBlue} │${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
fun_bar 'res11'
echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ ${BGCOLOR}    PROCESANDO A INSTALAR TROJAN-GO     ${NC}${BIBlue} │${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
fun_bar 'res12'
}

function iinfo(){
domain=$(cat /etc/xray/domain)
TIMES="10"
CHATID="833821933"
KEY="5340711015:AAEgC3JCrQZ2fkFqfV40UyqLfyzMmXX9BZI"
URL="https://api.telegram.org/bot$KEY/sendMessage"
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
domain=$(cat /etc/xray/domain) 
TIME=$(date +'%d-%m-%Y %h:%M:%S')
RAMMS=$(free -m | awk 'NR==2 {print $2}')
MODEL2=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
MYIP=$(curl -sS ipv4.icanhazip.com)
IZIN=$(curl -sS https://raw.githubusercontent.com/JerrySBG/SBG2/main/ip | grep $MYIP | awk '{print $3}' )
d1=$(date -d "$IZIN" +%s)
d2=$(date -d "$today" +%s)
EXP=$(( (d1 - d2) / 86400 ))

TEXT="
<code>━━━━━━━━━━━━━━━━━━━━</code>
<code>⚠️ AUTOSCRIPT PREMIUM ⚠️</code>
<code>━━━━━━━━━━━━━━━━━━━━</code>
<code>NOMBRE   : </code><code>${author}</code>
<code>FECHA    : </code><code>${TIME} HORA</code>
<code>DOMINIO  : </code><code>${domain}</code>
<code>IP VPS   : </code><code>${MYIP}</code>
<code>ISP      : </code><code>${ISP} $CITY</code>
<code>S.Op     : </code><code>${MODEL2}</code>
<code>RAM      : </code><code>${RAMMS} MB</code>
<code>EXP SC   : </code><code>$EXP Dias</code>
<code>━━━━━━━━━━━━━━━━━━━━</code>
<i> Notificacion de Instalacion Script...</i>
"'&reply_markup={"inline_keyboard":[[{"text":"ᴏʀᴅᴇʀ","url":"https://t.me/Jerry_SBG"},{"text":"Contack","url":"https://wa.me/+529241293310"}]]}'
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
}

CEKIP
Casper3
cat> /root/.profile << END
if [ "$BASH" ]; then
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
fi
mesg n || true
clear
menu
END
chmod 644 /root/.profile
if [ -f "/root/log-install.txt" ]; then
rm /root/log-install.txt > /dev/null 2>&1
fi
if [ -f "/etc/afak.conf" ]; then
rm /etc/afak.conf > /dev/null 2>&1
fi
if [ ! -f "/etc/log-create-user.log" ]; then
echo "Log All Account " > /etc/log-create-user.log
fi
history -c
serverV=$( curl -sS https://raw.githubusercontent.com/JerrySBG/SBG2/main/versi  )
echo $serverV > /opt/.ver
aureb=$(cat /home/re_otm)
b=11
if [ $aureb -gt $b ]
then
gg="PM"
else
gg="AM"
fi
cd
curl -sS ifconfig.me > /etc/myipvps
curl -s ipinfo.io/city?token=75082b4831f909 >> /etc/xray/city
curl -s ipinfo.io/org?token=75082b4831f909  | cut -d " " -f 2-10 >> /etc/xray/isp
rm /root/setup.sh >/dev/null 2>&1
rm /root/slhost.sh >/dev/null 2>&1
rm /root/ssh-vpn.sh >/dev/null 2>&1
rm /root/ins-xray.sh >/dev/null 2>&1
rm /root/insshws.sh >/dev/null 2>&1
rm /root/set-br.sh >/dev/null 2>&1
#rm /root/ohp.sh >/dev/null 2>&1
rm /root/update.sh >/dev/null 2>&1
rm /root/installsl.sh >/dev/null 2>&1
rm /root/slowdns.sh >/dev/null 2>&1
rm -rf /etc/noobz
mkdir -p /etc/noobz
echo "" > /etc/xray/noob
iinfo

secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt
sleep 3
echo  ""
cd
rm -rf * 
echo -e "${BIBlue}╭════════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│${BGCOLOR}    INSTALACION DEL SCRIPT FINALIZADO..     ${NC}${BIBlue}│${NC}"
echo -e "${BIBlue}╰════════════════════════════════════════════╯${NC}"
echo  ""
sleep 4
echo -e "[ ${yell}ADVERTENCIA${NC} ] ¿Quieres Reiniciar Ahora? ? (s/n)? "; read answer
if [ "$answer" == "${answer#[Ss]}" ] ;then
echo " "
exit 0
else
reboot
fi
