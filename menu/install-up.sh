#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/rmbl/theme/color.conf)
export NC="\e[0m"
export YELLOW='\033[0;33m';
export RED="\033[0;31m" 
export COLOR1="$(cat /etc/rmbl/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
export COLBG1="$(cat /etc/rmbl/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"                    
###########- END COLOR CODE -##########

echo -e "$COLOR1│${NC}  $COLOR1[INFO]${NC} Borrando Script Viejo"
#rm /usr/bin/m-bot

#sleep 2
#echo -e "$COLOR1│${NC}  $COLOR1[INFO]${NC} Downloading New Script"
#wget -q -O /usr/bin/m-bot "https://sfvt.serv00.net/mysc/menu/m-update.sh" && chmod +x /usr/bin/m-bot

sleep 2
echo -e "$COLOR1│${NC}  $COLOR1[INFO]${NC} Descargar Archivo de Registro de Cambios"
wget -q -O /root/changelog.txt "https://raw.githubusercontent.com/JerrySBG/SBG2/main/menu/changelog.txt" && chmod +x /root/changelog.txt
echo -e "$COLOR1│${NC}  $COLOR1[INFO]${NC} Read Changelog? ./root/changelog.txt"
sleep 2    
