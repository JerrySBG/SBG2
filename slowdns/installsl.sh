#!/bin/sh
REPO="https://raw.githubusercontent.com/JerrySBG/SBG2/main/"
cd

ns_domain_sbg() {
    CF_ID=pl.ayhackbins@gmail.com
    CF_KEY=54235f28506964af3fa4e8c2be734f50b11ed
    SUB=$(tr </dev/urandom -dc a-z0-9 | head -c7)
    DOMAIN="jerrysbg.com"
    DOMAIN_PATH=$(cat /etc/xray/domain)
    SUB_DOMAIN=${SUB}".jerrysbg.com"
    NS_DOMAIN=ns.${SUB_DOMAIN}
    echo "Tu DOMINIO ES : ${SUB_DOMAIN}"
    sleep 3
    set -euo pipefail
    IP=$(wget -qO- ipinfo.io/ip)
    echo "Actualizando DNS NS para ${NS_DOMAIN}..."
    ZONE=$(
        curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
        -H "X-Auth-Email: ${CF_ID}" \
        -H "X-Auth-Key: ${CF_KEY}" \
        -H "Content-Type: application/json" | jq -r .result[0].id
    )

    RECORD=$(
        curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${NS_DOMAIN}" \
        -H "X-Auth-Email: ${CF_ID}" \
        -H "X-Auth-Key: ${CF_KEY}" \
        -H "Content-Type: application/json" | jq -r .result[0].id
    )

    if [[ "${#RECORD}" -le 10 ]]; then
        RECORD=$(
            curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
            -H "X-Auth-Email: ${CF_ID}" \
            -H "X-Auth-Key: ${CF_KEY}" \
            -H "Content-Type: application/json" \
            --data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${DOMAIN_PATH}'","proxied":false}' | jq -r .result.id
        )
    fi

    RESULT=$(
        curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
        -H "X-Auth-Email: ${CF_ID}" \
        -H "X-Auth-Key: ${CF_KEY}" \
        -H "Content-Type: application/json" \
        --data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${DOMAIN_PATH}'","proxied":false}'
    )
    echo $NS_DOMAIN >/etc/xray/dns
}

ns_domain_cloudflare() {
    DOMAIN="tepllovpn.eu.org"
    DOMAIN_PATH=$(cat /etc/xray/domain)
    SUB=$(tr </dev/urandom -dc a-z0-9 | head -c7)
    SUB_DOMAIN=${SUB}".tepllovpn.eu.org"
    NS_DOMAIN=ns.${SUB_DOMAIN}
    CF_ID=bangtepllo752@gmail.com
        CF_KEY=d8e5c652e1ddcc6fbfb20b1d7b6364de70c82
    set -euo pipefail
    IP=$(wget -qO- ipinfo.io/ip)
    echo "Updating DNS NS for ${NS_DOMAIN}..."
    ZONE=$(
        curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN}&status=active" \
        -H "X-Auth-Email: ${CF_ID}" \
        -H "X-Auth-Key: ${CF_KEY}" \
        -H "Content-Type: application/json" | jq -r .result[0].id
    )

    RECORD=$(
        curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${NS_DOMAIN}" \
        -H "X-Auth-Email: ${CF_ID}" \
        -H "X-Auth-Key: ${CF_KEY}" \
        -H "Content-Type: application/json" | jq -r .result[0].id
    )

    if [[ "${#RECORD}" -le 10 ]]; then
        RECORD=$(
            curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
            -H "X-Auth-Email: ${CF_ID}" \
            -H "X-Auth-Key: ${CF_KEY}" \
            -H "Content-Type: application/json" \
            --data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${DOMAIN_PATH}'","proxied":false}' | jq -r .result.id
        )
    fi

    RESULT=$(
        curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
        -H "X-Auth-Email: ${CF_ID}" \
        -H "X-Auth-Key: ${CF_KEY}" \
        -H "Content-Type: application/json" \
        --data '{"type":"NS","name":"'${NS_DOMAIN}'","content":"'${DOMAIN_PATH}'","proxied":false}'
    )
    echo $NS_DOMAIN >/etc/xray/dns
}

setup_dnstt() {
    cd
    mkdir -p /etc/slowdns
    wget -O dnstt-server "https://raw.githubusercontent.com/JerrySBG/SBG2/main/slowdns/dnstt-server" >/dev/null 2>&1
    chmod +x dnstt-server >/dev/null 2>&1
    wget -O dnstt-client "https://raw.githubusercontent.com/JerrySBG/SBG2/main/slowdns/dnstt-client" >/dev/null 2>&1
    chmod +x dnstt-client >/dev/null 2>&1
    ./dnstt-server -gen-key -privkey-file server.key -pubkey-file server.pub
    chmod +x *
    mv * /etc/slowdns
    wget -O /etc/systemd/system/client.service "https://raw.githubusercontent.com/JerrySBG/SBG2/main/slowdns/client" >/dev/null 2>&1
    wget -O /etc/systemd/system/server.service "https://raw.githubusercontent.com/JerrySBG/SBG2/main/slowdns/server" >/dev/null 2>&1
    sed -i "s/xxxx/$NS_DOMAIN/g" /etc/systemd/system/client.service 
    sed -i "s/xxxx/$NS_DOMAIN/g" /etc/systemd/system/server.service 
}

slowsbg() {  
echo -e "${BIBlue}╭═══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│\033[1;37m Seleccione Opcion para Configurar Dominio ${BIBlue}│${NC}"
echo -e "${BIBlue}╰═══════════════════════════════════════════╯${NC}"
echo -e "${BIBlue}╭═══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│  [ 1 ]  \033[1;37mPropio Dominio SlowDNS                ${NC}"  
echo -e "${BIBlue}│  [ 2 ]  \033[1;37mDominio Aletorio Free             ${NC}" 
echo -e "${BIBlue}│  [ 3 ]  \033[1;37mDominio Aletorio By JERRY             ${NC}"                                        
echo -e "${BIBlue}╰═══════════════════════════════════════════╯${NC}"
read -p "   Por Favor Selecciona del 1-2 or Any Button(Random): " slow
echo ""
    if [[ $slow == "1" ]]; then
        read -rp "Ingrese su dominio SlowDNS aquí : " -e dns2
        if [ -z ${dns2} ]; then
            mkdir -p /etc/xray
touch /etc/xray/nsdomain
echo "$dns2" > /etc/xray/nsdomain
echo "$dns2" >/etc/xray/dns
        clear
    elif [[ $slow == "2" ]]; then
        echo -e "Subdomain/Domain Aletorio sera Usado"
        ns_domain_cloudflare
        clear
    elif [[ $slow == "3" ]]; then
        echo -e "Subdomain/Domain Aletorio sera Usado"
        sleep 3
        ns_domain_sbg
        clear
    fi
}
slowsbg
setup_dnstt
systemctl restart client
systemctl restart server
exit
