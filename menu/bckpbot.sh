#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/rmbl/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m"
COLOR1="$(cat /etc/rmbl/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/rmbl/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
###########- END COLOR CODE -##########

ipsaya=$(curl -sS ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/JerrySBG/SBG2/main/ip"
checking_sc() {
    useexp=$(curl -sS $data_ip | grep $ipsaya | awk '{print $3}')
    if [[ $date_list < $useexp ]]; then
        echo -ne
    else
        echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
        echo -e "$COLOR1 ${NC} ${COLBG1}          ${WH}• AUTOSCRIPT PREMIUM •               ${NC} $COLOR1 $NC"
        echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
        echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "                        ${RED}PERMISO DENEGADO !${NC}"
echo -e "   \033[0;33mTU VPS${NC} $ipsaya \033[0;33mACABA DE SER BANEADA${NC}"
echo -e "          \033[0;33mCOMPRA ACCESO AL SCRIPT POR FAVOR${NC}"
echo -e "                \033[0;33mCONTACTA AL ADMIN ${NC}"
echo -e "                \033[0;33mTELEGRAM: @Jerry_SBG ${NC}"
echo -e "                \033[0;33mWHATSAPP: 0529241293310 ${NC}"
        echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
        exit
    fi
}
checking_sc

clear
echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "${tyblue}  Seleccione un tipo de Bot a Continuación  ${NC}"
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}"
echo -e "${tyblue}┌──────────────────────────────────────────┐${NC}"
echo -e "${tyblue}   [ 1 ]  Crear una Base de Datos BOT       ${NC}"
echo -e "${tyblue}   [ 2 ]  No Crear una Base de Datos BOT    ${NC}"
echo -e "${tyblue}└──────────────────────────────────────────┘${NC}"
read -p "   Seleccione los números 1-2 o Cualquier Botón para Pasar al Siguiente Paso. : " bot
echo ""
if [[ $bot == "1" ]]; then
clear
rm -f /usr/bin/token
rm -f /usr/bin/idchat
echo -e "[ ${green}INFO${NC} ] Crear Base de Datos"
read -rp "Introduce Tu Token (Crear En @BotFather) : " -e token2
echo "$token2" >> /usr/bin/token
read -rp "Introduce Tu Id (Crear En @userinfobot)  : " -e idchat
echo "$idchat" >> /usr/bin/idchat
sleep 1
bottelegram
elif [[ $bot == "2" ]]; then
bottelegram
fi