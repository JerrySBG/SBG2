#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"

clear
echo -e "\e[33m┌───────────────────────────────────────┐\033[0m"
echo -e "\E[40;1;37m    • CHANGE PORT SERVICE •        \E[0m"
echo -e "\e[33m└───────────────────────────────────────┘\033[0m"
echo -e ""
echo -e " [\e[36m•1\e[0m] Change Port Stunnel4"
echo -e " [\e[36m•2\e[0m] Change Port OpenVPN"
echo -e " [\e[36m•3\e[0m] Change Port Trojan"
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo -e   ""
echo -e "\e[33m└────────────────────────────────────────┘\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; port-ssl ; exit ;;
2) clear ; port-ovpn ; exit ;;
3) clear ; port-tr ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo -e "" ; echo "Presionaste MAL ." ; sleep 1 ; port-change ;;
esac
