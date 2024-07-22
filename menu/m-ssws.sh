#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/phantomshield/theme/color.conf)
export NC="\e[0m"
export YELLOW='\033[0;33m';
export RED="\033[0;31m" 
export COLOR1="$(cat /etc/phantomshield/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
export COLBG1="$(cat /etc/phantomshield/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"                    
###########- END COLOR CODE -##########
MYIP=$(wget -qO- ipv4.icanhazip.com);
echo "Checking VPS"
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}       • SHADOWSHOCK ACCOUNT •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -e "${COLOR1} [01]${NC} Create Account Shadowsocks      $NC"
echo -e "${COLOR1} [02]${NC} Create Trial Shadowsocks        $NC"
echo -e "${COLOR1} [03]${NC} Extending Account Shadowsocks   $NC"
echo -e "${COLOR1} [04]${NC} Delete Account Shadowsocks      $NC"
echo -e "${COLOR1} [05]${NC} User list created Account       $NC"
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e   ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; add-ssws ;;
2) clear ; trialssws ;;
3) clear ; renew-ssws ;;
4) clear ; del-ssws ;;
5) clear ; cat /etc/log-create-shadowsocks.log ; exit ;;
0) clear ; menu ;;
x) exit ;;
*) echo "salah tekan" ; sleep 1 ; m-ssws ;;
esac
