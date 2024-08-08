#!/bin/sh
REPO="https://raw.githubusercontent.com/JerrySBG/SBG2/main/"
cd

slowsbg() {  
echo -e "${BIBlue}╭═══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│\033[1;37m Seleccione Opcion para Configurar Dominio ${BIBlue}│${NC}"
echo -e "${BIBlue}╰═══════════════════════════════════════════╯${NC}"
echo -e "${BIBlue}╭═══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│  [ 1 ]  \033[1;37mPropio Dominio SlowDNS                ${NC}"  
echo -e "${BIBlue}│  [ 2 ]  \033[1;37mDominio Aletorio Free             ${NC}" 
echo -e "${BIBlue}│  [ 3 ]  \033[1;37mDominio Aletorio By JERRY             ${NC}"                                        
echo -e "${BIBlue}╰═══════════════════════════════════════════╯${NC}"
read -rp "   Por Favor Selecciona del 1 al 3 : " slow
echo ""
if [[ $slow == "1" ]]; then
echo -e "   \e[1;32mPor favor Ingrese su Subdominio SlowDNS$NC"
read -p "   Subdominio: " dns2
mkdir -p /etc/xray
touch /etc/xray/nsdomain
echo "$dns2" > /etc/xray/nsdomain
echo "$dns2" >/etc/xray/dns
clear
elif [[ $slow == "2" ]]; then
#install slowdns
wget ${REPO}slowdns/installsl2.sh && chmod +x installsl2.sh && ./installsl2.sh
rm -f /root/installsl2.sh
clear
elif [[ $slow == "3" ]]; then
#install slowdns
wget ${REPO}slowdns/slowdns.sh && chmod +x slowdns.sh && ./slowdns.sh
rm -f /root/slowdns.sh
print_install "Se utiliza Subdominio/Dominio Aleatorio"
clear
fi
}
slowsbg
exit
