#!/bin/sh
REPO="https://raw.githubusercontent.com/JerrySBG/SBG2/main/"
cd

slowsbg() {  
echo -e "${BIBlue}╭═══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│\033[1;37m Seleccione Opcion para Configurar Dominio ${BIBlue}│${NC}"
echo -e "${BIBlue}╰═══════════════════════════════════════════╯${NC}"
echo -e "${BIBlue}╭═══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│  [ 1 ]  \033[1;37mPropio Dominio SlowDNS                ${NC}"  
echo -e "${BIBlue}│  [ 2 ]  \033[1;37mDominio Aletorio By JERRY              ${NC}"                                        
echo -e "${BIBlue}╰═══════════════════════════════════════════╯${NC}"
until [[ $domain =~ ^[1-2]+$ ]]; do 
read -p "   Seleccione los Números 1 o 2 Cualquier Botón (Aleatorio) : " slow
echo ""
if [[ $slow == "1" ]]; then
clear
echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│            \033[1;37mDOMINIO O SUBDOMINIO          ${BIBlue}│${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo -e  "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e  "${BIBlue}│               \033[1;37mGRACIAS POR                ${BIBlue}│${NC}"
echo -e  "${BIBlue}│        \033[1;37mUSAR MI AUTOSCRIPT PREMIUM        ${BIBlue}│${NC}"
echo -e  "${BIBlue}│                \033[1;37mBY JERRY 2024             ${BIBlue}│${NC}"
echo -e  "${BIBlue}╰══════════════════════════════════════════╯${NC}"
echo " "
until [[ $dns2 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Ingrese su dominio SlowDNS aquí : " -e dns2
done
mkdir -p /etc/xray
touch /etc/xray/nsdomain
echo "$dns2" > /etc/xray/nsdomain
echo "$dns2" >/etc/xray/dns
echo ""
clear
fi
if [[ $slow == "2" ]]; then
#install slowdns
wget ${REPO}slowdns/slowdns.sh && chmod +x slowdns.sh && ./slowdns.sh
rm -f /root/slowdns.sh
clear
else
print_install "Se utiliza Subdominio/Dominio Aleatorio"
clear
    fi
}
slowsbg
exit
