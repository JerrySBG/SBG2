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
echo -e "$COLOR1│${NC} ${COLBG1}             • SYSTEM MENU •                   ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -e "${COLOR1} [01]${NC} Panel Domain          $NC" 
echo -e "${COLOR1} [02]${NC} Speedtest VPS         $NC" 
echo -e "${COLOR1} [03]${NC} Set Auto Reboot       $NC"
echo -e "${COLOR1} [04]${NC} Restart All Service   $NC"
echo -e "${COLOR1} [05]${NC} Cek Bandwith          $NC"
echo -e "${COLOR1} [06]${NC} Install TCP BBR       $NC"
echo -e "${COLOR1} [07]${NC} DNS CHANGER           $NC"
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e   ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo -e   ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; m-domain ; exit ;;
2) clear ; speedtest ; exit ;;
3) clear ; auto-reboot ; exit ;;
4) clear ; restart ; exit ;;
5) clear ; bw ; exit ;;
6) clear ; m-tcp ; exit ;;
7) clear ; m-dns ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo -e "" ; echo "Anda salah tekan" ; sleep 1 ; m-system ;;
esac
