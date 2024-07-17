#!/bin/bash
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
# // Exporting Language to UTF-8

export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'


# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export ORANGE='\033[0;33m'
export NC='\033[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"

clear
echo -e "${GREEN}  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "${GREEN}  ┃        ${CYAN}MENU SETTING${NC}"
echo -e "${GREEN}  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e "${GREEN}  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
echo -e "${GREEN}  ┃  ${CYAN} 1. Panel Domain      ${NC}"
echo -e "${GREEN}  ┃  ${CYAN} 2. Change Port All Account      ${NC}"
echo -e "${GREEN}  ┃  ${CYAN} 3. Webmin Menu      ${NC}"
echo -e "${GREEN}  ┃  ${CYAN} 4. Backup & restore${NC}"
echo -e "${GREEN}  ┃  ${CYAN} 5. Speedtest VPS   ${NC}"
echo -e "${GREEN}  ┃  ${CYAN} 6. About Script     ${NC}"
echo -e "${GREEN}  ┃  ${CYAN} 7. Set Auto Reboot   ${NC}"
echo -e "${GREEN}  ┃  ${CYAN} 8. Restart All Service${NC}"
echo -e "${GREEN}  ┃  ${CYAN} 9. Change Banner${NC}"
echo -e "${GREEN}  ┃  ${CYAN} 10. Cek Bandwith${NC}"
echo -e "${GREEN}  ┃  ${CYAN} 11. Setting Auto Reboot${NC}"
echo -e "${GREEN}  ┃  ${CYAN} 12. User Lock/Unlock${NC}"
echo -e "${GREEN}  ┃  ${CYAN} 13. Reboot${NC}"
echo -e "${GREEN}  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; menu-domain ; exit ;;
2) clear ; port-change ; exit ;;
3) clear ; menu-webmin ; exit ;;
4) clear ; menu-backup ; exit ;;
5) clear ; speedtest ; exit ;;
6) clear ; about ; exit ;;
7) clear ; auto-reboot ; exit ;;
8) clear ; restart ; exit ;;
9) clear ; nano /etc/issue.net ; exit ;; #ssh-vpn banner.conf
10) clear ; bw ; exit ;;
11) clear ; jam ; exit ;;
12) clear ; menu-lock ; exit ;;
13) clear ; reboot ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo -e "" ; echo "Anda salah tekan" ; sleep 1 ; menu-set ;;
esac
