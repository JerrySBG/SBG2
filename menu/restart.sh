#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export ORANGE='\033[0;91m'
export NC='\033[0m'


clear 
echo -e "${YELLOW}   ╔ ——————————————————————————————————— ╗${NC}"
echo -e "${ORANGE}           MENU RESTAR SERVICE{NC}"
echo -e "${YELLOW}   ╚ ——————————————————————————————————— ╝${NC}"
echo -e "${GREEN}      1. Restart All Services"
echo -e "${GREEN}      2. Restart OpenSSH"
echo -e "${GREEN}      3. Restart Dropbear"
echo -e "${GREEN}      4. Restart Stunnel4"
echo -e "${GREEN}      5. Restart OpenVPN"
echo -e "${GREEN}      6. Restart Squid"
echo -e "${GREEN}      7. Restart Nginx"
echo -e "${GREEN}      8. Restart Badvpn"
echo -e "${GREEN}      9. Restart XRAY"
echo -e "${GREEN}      10. Restart WEBSOCKET"
echo -e "${GREEN}      11. Restart Trojan Go"
echo -e "${YELLOW}   ╚ ——————————————————————————————————— ╝${NC}"
echo -e ""
read -p " Select menu : " Restart
echo -e ""
sleep 1
clear
case $Restart in
                1)
                clear
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo -e "\E[40;1;37m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                /etc/init.d/ssh restart
                /etc/init.d/dropbear restart
                /etc/init.d/stunnel4 restart
                /etc/init.d/openvpn restart
                /etc/init.d/fail2ban restart
                /etc/init.d/cron restart
                /etc/init.d/nginx restart
                /etc/init.d/squid restart
                echo -e "[ \033[32mok\033[0m ] Restarting xray Service (via systemctl) "
                sleep 0.5
                systemctl restart xray
                systemctl restart xray.service
                echo -e "[ \033[32mok\033[0m ] Restarting badvpn Service (via systemctl) "
                sleep 0.5
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
                sleep 0.5
                echo -e "[ \033[32mok\033[0m ] Restarting websocket Service (via systemctl) "
                sleep 0.5
                systemctl restart sshws.service
                systemctl restart ws-dropbear.service
                systemctl restart ws-stunnel.service
                sleep 0.5
                echo -e "[ \033[32mok\033[0m ] Restarting Trojan Go Service (via systemctl) "
                sleep 0.5
                systemctl restart trojan-go.service 
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] ALL Service Restarted"
                echo ""
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                2)
                clear
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo -e "\E[40;1;37m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                /etc/init.d/ssh restart
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] SSH Service Restarted"
                echo ""
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                3)
                clear
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo -e "\E[40;1;37m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                /etc/init.d/dropbear restart
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Dropbear Service Restarted"
                echo ""
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                4)
                clear
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo -e "\E[40;1;37m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                /etc/init.d/stunnel4 restart
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Stunnel4 Service Restarted"
                echo ""
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                5)
                clear
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo -e "\E[40;1;37m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                /etc/init.d/openvpn restart
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Openvpn Service Restarted"
                echo ""
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                6)
                clear
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo -e "\E[40;1;37m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                /etc/init.d/squid restart
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Squid Service Restarted"
                echo ""
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                7)
                clear
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo -e "\E[40;1;37m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                /etc/init.d/nginx restart
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Nginx Service Restarted"
                echo ""
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                8)
                clear
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo -e "\E[40;1;37m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                echo -e "[ \033[32mok\033[0m ] Restarting badvpn Service (via systemctl) "
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Badvpn Service Restarted"
                echo ""
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                9)
                clear
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo -e "\E[40;1;37m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                echo -e "[ \033[32mok\033[0m ] Restarting xray Service (via systemctl) "
                systemctl restart xray
                systemctl restart xray.service
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] XRAY Service Restarted"
                echo ""
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                10)
                clear
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo -e "\E[40;1;37m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                echo -e "[ \033[32mok\033[0m ] Restarting websocket Service (via systemctl) "
                sleep 0.5
                systemctl restart sshws.service
                systemctl restart ws-dropbear.service
                systemctl restart ws-stunnel.service
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] WEBSOCKET Service Restarted"
                echo ""
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                11)
                clear
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo -e "\E[40;1;37m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                echo -e "[ \033[32mok\033[0m ] Restarting Trojan Go Service (via systemctl) "
                sleep 0.5
                systemctl restart trojan-go.service
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Trojan Go Service Restarted"
                echo ""
                echo -e "\e[33m───────────────────────────────\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;                                                                         
                0)
                menu
                exit
                ;;
                x)
                clear
                exit
                ;;
                *) echo -e "" ; echo "maaf, anda salah tekan" ; sleep 1 ; restart ;;               
        esac
