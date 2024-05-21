#!/bin/bash
# pewarna hidup
BGreen='\e[1;32m'
BYellow='\e[1;33m'
BBlue='\e[1;34m'
BPurple='\e[1;35m'
NC='\e[0m'
MYIP=$(wget -qO- ipv4.icanhazip.com);
echo "Checking VPS"
clear
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e "\e[1;34m                 BANDWITH MONITOR                 \e[0m"
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e "" 
echo -e "\e[1;35m 1 \e[0m Check the remaining total bandwidth."
echo -e "\e[1;35m 2 \e[0m Table of usage every 5 minutes"
echo -e "\e[1;35m 3 \e[0m Table of usage every Hour"
echo -e "\e[1;35m 4 \e[0m Table of usage every Day"
echo -e "\e[1;35m 5 \e[0m Table of usage every Month"
echo -e "\e[1;35m 6 \e[0m Table of usage every Year"
echo -e "\e[1;35m 7 \e[0m Highest Usage Table"
echo -e "\e[1;35m 8 \e[0m Usage statistics every hour."
echo -e "\e[1;35m 9 \e[0m View current active usage."
echo -e "\e[1;35m 10 \e[0m Lihat View Current Active Usage Traffic [5s]"
echo -e "" 
echo -e "\e[1;34m 0 BACK TO MENU \e[0m"
echo -e "\e[1;34m x Exit \e[0m"
echo -e "" 
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1)
clear 
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e "\e[1;34m           TOTAL BANDWITH SERVER REMAINING          \e[0m"
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e ""

vnstat

echo -e ""
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

2)
clear 
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e "\e[1;34m            TOTAL BANDWITH EVERY 5 MINUTES        \e[0m"
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e ""

vnstat -5

echo -e ""
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

3)
clear 
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e "\e[1;34m              TOTAL BANDWITH EVERY HOUR           \e[0m"
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e ""

vnstat -h

echo -e ""
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

4)
clear 
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e "\e[1;34m            TOTAL BANDWITH EVERY DAY            \e[0m"
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e ""

vnstat -d

echo -e ""
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

5)
clear 
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e "\e[1;34m            TOTAL BANDWITH EVERY MONTH •         \e[0m"
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e ""

vnstat -m

echo -e ""
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

6)
clear 
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e "\e[1;34m            TOTAL BANDWITH EVERY YEAR           \e[0m"
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e ""

vnstat -y

echo -e ""
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

7)
clear 
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e "\e[1;34m              HIGHEST TOTAL BANDWITH            \e[0m"
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e ""

vnstat -t

echo -e ""
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

8)
clear 
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e "\e[1;34m           USAGE STATISTIC EVERY HOUR          \e[0m"
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e ""

vnstat -hg

echo -e ""
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

9)
clear 
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e "\e[1;34m               CURRENT BANDWITH LIVE             \e[0m"
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e "\e[1;34m Press [ Ctrl+C ] To-Exit \e[0m"
echo -e ""

vnstat -l

echo -e ""
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

10)
clear 
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e "\e[1;34m           LIVE BANDWIDTH USAGE TRAFFIC      \e[0m"
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e ""

vnstat -tr

echo -e ""
echo -e "\e[1;33m -------------------------------------------------\e[0m"
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
bw
;;

0)
sleep 1
m-system
;;
x)
exit
;;
*)
echo -e ""
echo -e "Invalid Input"
sleep 1
bw
;;
esac
