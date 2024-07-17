#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
# color declare
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

clear 
echo -e "${IGreen}   ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "${IGreen}   ┃       ${ICyan}MENU AUTO-BACKUP${NC}"
echo -e "${IGreen}   ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e "${IGreen}   ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
echo -e "${IGreen}   ┃  ${ICyan} 1. Total Bandwith Tersisa${NC}"
echo -e "${IGreen}   ┃  ${ICyan} 2. Setiap 5 Menit${NC}"
echo -e "${IGreen}   ┃  ${ICyan} 3. Setiap Jam${NC}"
echo -e "${IGreen}   ┃  ${ICyan} 4. Setiap Hari${NC}"
echo -e "${IGreen}   ┃  ${ICyan} 5. Setiap Bulan${NC}"
echo -e "${IGreen}   ┃  ${ICyan} 6. Setiap Tahun${NC}"
echo -e "${IGreen}   ┃  ${ICyan} 7. Tertinggi${NC}"
echo -e "${IGreen}   ┃  ${ICyan} 8. Setiap Jam${NC}"
echo -e "${IGreen}   ┃  ${ICyan} 9. Penggunaan Aktif Saat Ini${NC}"
echo -e "${IGreen}   ┃  ${ICyan} 10.Trafik Penggunaan Aktif Saat Ini [5s]${NC}"
echo -e "${IGreen}   ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e "" 
read -p " Select menu : " opt
echo -e ""
case $opt in
1)
clear 
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e "\E[40;1;37m • TOTAL BANDWITH SERVER TERSISA • \e[0m"
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e ""

vnstat

echo -e ""
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

2)
clear 
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e "\E[40;1;37m • TOTAL BANDWITH SETIAP 5 MENIT • \e[0m"
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e ""

vnstat -5

echo -e ""
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

3)
clear 
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e "\E[40;1;37m   • TOTAL BANDWITH SETIAP JAM •   \e[0m"
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e ""

vnstat -h

echo -e ""
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

4)
clear 
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e "\E[40;1;37m  • TOTAL BANDWITH SETIAP HARI •   \e[0m"
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e ""

vnstat -d

echo -e ""
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

5)
clear 
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e "\E[40;1;37m  • TOTAL BANDWITH SETIAP BULAN •  \e[0m"
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e ""

vnstat -m

echo -e ""
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

6)
clear 
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e "\E[40;1;37m  • TOTAL BANDWITH SETIAP TAHUN •  \e[0m"
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e ""

vnstat -y

echo -e ""
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

7)
clear 
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e "\E[40;1;37m    • TOTAL BANDWITH TERTINGGI •   \e[0m"
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e ""

vnstat -t

echo -e ""
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

8)
clear 
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e "\E[40;1;37m • STATISTIK TERPAKAI SETIAP JAM • \e[0m"
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e ""

vnstat -hg

echo -e ""
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

9)
clear 
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e "\E[40;1;37m     • LIVE BANDWITH SAAT INI •    \e[0m"
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e   " Press [ Ctrl+C ] • To-Exit"
echo -e ""

vnstat -l

echo -e ""
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

10)
clear 
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e "\E[40;1;37m• LIVE TRAFIK PENGGUNAAN BANDWITH •\e[0m"
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e ""

vnstat -tr

echo -e ""
echo -e "\e[33m──────────────────────────────────\033[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

0)
sleep 1
menu
;;
x)
exit
;;
*)
echo -e ""
echo -e "Anda salah tekan"
sleep 1
bw
;;
esac
