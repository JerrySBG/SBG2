#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com);
echo "Checking VPS"
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m         • RESTART MENU •          \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e " [\e[36m•1\e[0m] Restart All Services"
echo -e " [\e[36m•2\e[0m] Restart OpenSSH"
echo -e " [\e[36m•3\e[0m] Restart Dropbear"
echo -e " [\e[36m•4\e[0m] Restart Stunnel4"
echo -e " [\e[36m•5\e[0m] Restart OpenVPN"
echo -e " [\e[36m•6\e[0m] Restart Squid"
echo -e " [\e[36m•7\e[0m] Restart Nginx"
echo -e " [\e[36m•8\e[0m] Restart Badvpn"
echo -e " [\e[36m•9\e[0m] Restart XRAY"
echo -e " [\e[36m10\e[0m] Restart WEBSOCKET"
echo -e " [\e[36m11\e[0m] Restart Trojan Go"
echo -e " [\e[36m12\e[0m] Restart UDP-Costum"
echo -e " [\e[36m13\e[0m] Restart SlowDns"
echo -e " [\e[36m14\e[0m] Restart PPTP"
echo -e " [\e[36m15\e[0m] Restart L2TP"
echo -e " [\e[36m16\e[0m] Restart SSTP"
echo -e " [\e[36m17\e[0m] Restart WIREGUARD"
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e   ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo -e   ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu : " Restart
echo -e ""
sleep 1
clear
case $Restart in
                1)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[0;100;33m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
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
                echo -e "[ \033[32mok\033[0m ] Restarting xray Service (via systemctl) "
                sleep 0.5
                systemctl restart xray
                systemctl restart xray.service
                echo -e "[ \033[32mok\033[0m ] Restarting UDP-Costum (via systemctl) "
                sleep 0.5
                systemctl restart udp-custom
                echo -e "[ \033[32mok\033[0m ] Restarting SlowDns (via systemctl) "
                sleep 0.5
                systemctl restart client-sldns
                systemctl restart server-sldns
                echo -e "[ \033[32mok\033[0m ] Restarting IPSEC PPTP L2TP SSTP WIREGUARD (via systemctl) "
                sleep 0.5
				systemctl restart pptpd
                systemctl restart xl2tpd
				systemctl restart accel-ppp
				systemctl restart wg-quick@wg0
                echo -e "[ \033[32mok\033[0m ] Restarting badvpn Service (via systemctl) "
                sleep 0.5
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
                sleep 0.5
                echo -e "[ \033[32mok\033[0m ] Restarting Trojan Go Service (via systemctl) "
                sleep 0.5 
                echo -e "[ \033[32mInfo\033[0m ] ALL Service Restarted"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                2)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[0;100;33m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                /etc/init.d/ssh restart
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] SSH Service Restarted"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                3)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[0;100;33m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                /etc/init.d/dropbear restart
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Dropbear Service Restarted"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                4)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[0;100;33m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                /etc/init.d/stunnel4 restart
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Stunnel4 Service Restarted"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                5)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[0;100;33m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                /etc/init.d/openvpn restart
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Openvpn Service Restarted"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                6)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[0;100;33m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                /etc/init.d/squid restart
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Squid Service Restarted"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                7)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[0;100;33m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                /etc/init.d/nginx restart
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Nginx Service Restarted"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                8)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[0;100;33m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                echo -e "[ \033[32mok\033[0m ] Restarting badvpn Service (via systemctl) "
                screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Badvpn Service Restarted"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                9)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[0;100;33m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                echo -e "[ \033[32mok\033[0m ] Restarting xray Service (via systemctl) "
                systemctl restart xray
                systemctl restart xray.service
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] XRAY Service Restarted"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                10)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[0;100;33m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
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
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;
                11)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[0;100;33m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                echo -e "[ \033[32mok\033[0m ] Restarting Trojan Go Service (via systemctl) "
                sleep 0.5
                systemctl restart trojan-go.service
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] Trojan Go Service Restarted"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;     
                12)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[0;100;33m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                echo -e "[ \033[32mok\033[0m ] Restarting UDP-Costum (via systemctl) "
                sleep 0.5
                systemctl restart udp-custom
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] UDP-COSTUM RESTART"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;  
                13)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[0;100;33m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                echo -e "[ \033[32mok\033[0m ] Restarting SlowDns (via systemctl) "
                sleep 0.5
                systemctl status server-sldns
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] SLowDns Restart"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;  
                14)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[0;100;33m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                echo -e "[ \033[32mok\033[0m ] Restarting SlowDns (via systemctl) "
                sleep 0.5
                systemctl restart pptpd
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] RSTART PPTP"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;   
                15)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[0;100;33m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                echo -e "[ \033[32mok\033[0m ] Restarting L2TP (via systemctl) "
                sleep 0.5
                systemctl restart xl2tpd
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] L2TP RESTART"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;;       
                16)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[0;100;33m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                echo -e "[ \033[32mok\033[0m ] Restarting SSTP (via systemctl) "
                sleep 0.5
                systemctl enable accel-ppp
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] SSTP RESTART"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;; 
                17)
                clear
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e "\E[0;100;33m         • RESTART MENU •          \E[0m"
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo -e ""
                echo -e "[ \033[32mInfo\033[0m ] Restart Begin"
                sleep 1
                echo -e "[ \033[32mok\033[0m ] Restarting WIREGUARD (via systemctl) "
                sleep 0.5
                systemctl restart wg-quick@wg0
                sleep 0.5
                echo -e "[ \033[32mInfo\033[0m ] WIREGUARD RESTART"
                echo ""
                echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
                echo ""
                read -n 1 -s -r -p "Press any key to back on system menu"
                restart
                ;; 				
                0)
                m-system
                exit
                ;;
                x)
                clear
                exit
                ;;
                *) echo -e "" ; echo "Invalid Input" ; sleep 1 ; restart ;;               
        esac
