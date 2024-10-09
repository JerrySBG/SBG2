#!/bin/bash
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
MYIP=$(wget -qO- ipinfo.io/ip)
colornow=$(cat /etc/rmbl/theme/color.conf)
export NC="\e[0m"
export yl='\033[0;33m';
export RED="\033[0;31m"
export COLOR1="$(cat /etc/rmbl/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
export COLBG1="$(cat /etc/rmbl/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
tram=$( free -h | awk 'NR==2 {print $2}' )
uram=$( free -h | awk 'NR==2 {print $3}' )
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
author=$(cat /etc/profil)
DAY=$(date +%A)
DATE=$(date +%Y-%m-%d)
DATE2=$(date -R | cut -d " " -f -5)
Fecha=$(date +"%A, %e de %B del %Y" -d "$data_server")
TIMEZONE=$(printf '%(%I:%M %p)T')
MYIP=$(wget -qO- ipinfo.io/ip)
Isadmin=$(curl -sS https://raw.githubusercontent.com/JerrySBG/permission/main/ip | grep $MYIP | awk '{print $5}')
Exp2=$(curl -sS https://raw.githubusercontent.com/JerrySBG/permission/main/ip | grep $MYIP | awk '{print $3}')
export RED='\033[0;31m'
export GREEN='\033[0;32m'
Name=$(curl -sS https://raw.githubusercontent.com/JerrySBG/permission/main/ip | grep $MYIP | awk '{print $6}')
ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/JerrySBG/permission/main/ip"
checking_sc() {
useexp=$(curl -sS $data_ip | grep $ipsaya | awk '{print $3}')
if [[ $date_list < $useexp ]]; then
echo -ne
else
systemctl stop nginx
echo -e "$COLOR1╭═════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│${NC}${COLBG1}          ${WH}• AUTOSCRIPT PREMIUM •                 ${NC}$COLOR1│ $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════╯${NC}"
echo -e "$COLOR1╭═════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│             ${RED}PERMISO DENEGADO !${NC}                  $COLOR1│"
echo -e "$COLOR1│   ${YELLOW}TU VPS${NC} $ipsaya \033[0;36mACABA DE SER BANEADA${NC}      $COLOR1│"
echo -e "$COLOR1│     ${YELLOW}COMPRA ACCESO AL SCRIPT POR FAVOR ${NC}          $COLOR1│"
echo -e "$COLOR1│             \033[0;32mTELEGRAM: @Jerry_SBG ${NC}               $COLOR1│"
echo -e "$COLOR1│             \033[0;32mWHATSAPP: 0529241293310 ${NC}            $COLOR1│"
echo -e "$COLOR1╰═════════════════════════════════════════════════╯${NC}"
fi
exit
}
checking_sc
cd
if [ ! -e /etc/per/id ]; then
mkdir -p /etc/per
echo "" > /etc/per/id
echo "" > /etc/per/token
elif [ ! -e /etc/perlogin/id ]; then
mkdir -p /etc/perlogin
echo "" > /etc/perlogin/id
echo "" > /etc/perlogin/token
elif [ ! -e /usr/bin/id ]; then
echo "" > /usr/bin/idchat
echo "" > /usr/bin/token
fi
if [ ! -e /etc/xray/ssh ]; then
echo "" > /etc/xray/ssh
elif [ ! -e /etc/xray/sshx ]; then
mkdir -p /etc/xray/sshx
elif [ ! -e /etc/xray/sshx/listlock ]; then
echo "" > /etc/xray/sshx/listlock
elif [ ! -e /etc/vmess ]; then
mkdir -p /etc/vmess
elif [ ! -e /etc/vmess/listlock ]; then
echo "" > /etc/vmess/listlock
elif [ ! -e /etc/vless ]; then
mkdir -p /etc/vless
elif [ ! -e /etc/vless/listlock ]; then
echo "" > /etc/vless/listlock
elif [ ! -e /etc/trojan ]; then
mkdir -p /etc/trojan
elif [ ! -e /etc/trojan/listlock ]; then
echo "" > /etc/trojan/listlock
elif [ ! -e /etc/xray/noob ]; then
echo "" > /etc/xray/noob
elif [ ! -e /etc/trojan-go/trgo ]; then
echo "" > /etc/trojan-go/trgo
fi
clear
MODEL2=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
LOADCPU=$(printf '%-0.00001s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
CORE=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
vnstat_profile=$(vnstat | sed -n '3p' | awk '{print $1}' | grep -o '[^:]*')
vnstat -i ${vnstat_profile} >/etc/t1
bulan=$(date +%b)
tahun=$(date +%y)
ba=$(curl -s https://pastebin.com/raw/0gWiX6hE)
today=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $8}')
todayd=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $8}')
today_v=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $9}')
today_rx=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $2}')
today_rxv=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $3}')
today_tx=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $5}')
today_txv=$(vnstat -i ${vnstat_profile} | grep today | awk '{print $6}')
if [ "$(grep -wc ${bulan} /etc/t1)" != '0' ]; then
bulan=$(date +%b)
month=$(vnstat -i ${vnstat_profile} | grep "$bulan $ba$tahun" | awk '{print $9}')
month_v=$(vnstat -i ${vnstat_profile} | grep "$bulan $ba$tahun" | awk '{print $10}')
month_rx=$(vnstat -i ${vnstat_profile} | grep "$bulan $ba$tahun" | awk '{print $3}')
month_rxv=$(vnstat -i ${vnstat_profile} | grep "$bulan $ba$tahun" | awk '{print $4}')
month_tx=$(vnstat -i ${vnstat_profile} | grep "$bulan $ba$tahun" | awk '{print $6}')
month_txv=$(vnstat -i ${vnstat_profile} | grep "$bulan $ba$tahun" | awk '{print $7}')
else
bulan2=$(date +%Y-%m)
month=$(vnstat -i ${vnstat_profile} | grep "$bulan2 " | awk '{print $8}')
month_v=$(vnstat -i ${vnstat_profile} | grep "$bulan2 " | awk '{print $9}')
month_rx=$(vnstat -i ${vnstat_profile} | grep "$bulan2 " | awk '{print $2}')
month_rxv=$(vnstat -i ${vnstat_profile} | grep "$bulan2 " | awk '{print $3}')
month_tx=$(vnstat -i ${vnstat_profile} | grep "$bulan2 " | awk '{print $5}')
month_txv=$(vnstat -i ${vnstat_profile} | grep "$bulan2 " | awk '{print $6}')
fi
if [ "$(grep -wc yesterday /etc/t1)" != '0' ]; then
yesterday=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $8}')
yesterday_v=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $9}')
yesterday_rx=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $2}')
yesterday_rxv=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $3}')
yesterday_tx=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $5}')
yesterday_txv=$(vnstat -i ${vnstat_profile} | grep yesterday | awk '{print $6}')
else
yesterday=NULL
yesterday_v=NULL
yesterday_rx=NULL
yesterday_rxv=NULL
yesterday_tx=NULL
yesterday_txv=NULL
fi
ssh_ssl=$( systemctl status ws-stunnel | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ssl == "running" ]]; then
status_ssl="${COLOR1}ON${NC}"
else
status_ssl="${RED}OFF${NC}"
fi
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
status_nginx="${COLOR1}ON${NC}"
else
status_nginx="${RED}OFF${NC}"
systemctl start nginx
fi
if [[ -e /usr/bin/kyt ]]; then
nginx=$( systemctl status kyt | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
echo -ne
else
systemctl start kyt
fi
fi
rm -rf /etc/status
xray=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $xray == "running" ]]; then
status_xray="${COLOR1}ON${NC}"
else
status_xray="${RED}OFF${NC}"
fi

#stat_noobz=$( systemctl status noobzvpns | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
#if [[ $stat_noobz == "running" ]]; then
#    stat_noobz="${COLOR1}ON${NC}"
#else
#    stat_noobz="${RED}OFF${NC}"
#    systemctl start noobzvpns
#fi

sshws=$( systemctl status ws-dropbear | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $sshws == "running" ]]; then
    status_ws="${COLOR1}ON${NC}"
else
    status_ws="${RED}OFF${NC}"
    systemctl start ws-dropbear2
fi

# // Dropbear
dropbear_status=$(/etc/init.d/dropbear status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $dropbear_status == "running" ]]; then
   status_beruangjatuh="${COLOR1}ON${NC}"
else
   status_beruangjatuh="${RED}OFF${NC}"
fi

udp_custom=$( systemctl status udp-custom | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $udp_custom == "running" ]]; then
    status_udp="${COLOR1}ON${NC}"
else
    status_udp="${RED}OFF${NC}"
    systemctl start udp-custom
fi

stat_trgo=$( systemctl status trojan-go | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $stat_trgo == "running" ]]; then
    stat_trgo="${COLOR1}ON${NC}"
else
    stat_trgo="${RED}OFF${NC}"
    systemctl start trojan-go
fi



# STATUS EXPIRED ACTIVE
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[4$below" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}(ACTIVO)${Font_color_suffix}"
Error="${Green_font_prefix}${Font_color_suffix}${Red_font_prefix}[EXPIRADO]${Font_color_suffix}"

today=$(date -d "0 days" +"%Y-%m-%d")
if [[ $today < $Exp2 ]]; then
    sts="${Info}"
else
    sts="${Error}"
fi
# TOTAL CREATE ACC VMESS
vmess=$(grep -c -E "^#vmg " "/etc/xray/config.json")
# TOTAL CREATE ACC VLESS
vless=$(grep -c -E "^#vlg " "/etc/xray/config.json")
# TOTAL CREATE ACC TROJAN
trtls=$(grep -c -E "^#trg " "/etc/xray/config.json")
# TOTAL CREATE ACC SSH
total_ssh=$(grep -c -E "^### " "/etc/xray/ssh")
# TOTAL CREATE ACC NOOBZ
jumlah_noobz=$(grep -c -E "^### " "/etc/xray/noob")
# TOTAL CREATE ACC TROJAN-GO
jumlah_trgo=$(grep -c -E "^### " "/etc/trojan-go/trgo")
# TOTAL CREATE ACC SHADOW
shadow=$(grep -c -E "^#ssgrpc " "/etc/xray/config.json")
function m-ip2(){
clear
m-ip
}
uphours=`uptime -p | awk '{print $2,$3}' | cut -d , -f1`
upminutes=`uptime -p | awk '{print $4,$5}' | cut -d , -f1`
uptimecek=`uptime -p | awk '{print $6,$7}' | cut -d , -f1`
cekup=`uptime -p | grep -ow "day"`
if [ "$Isadmin" = "ON" ]; then
uis="${COLOR1}Premium ADMIN VIP$NC"
else
uis="${COLOR1}Premium Version$NC"
fi
function m-bot2(){
clear
echo -e "$COLOR1╭══════════════════════════════════════════╮${NC}"
echo -e "$COLOR1  ${WH}Please select a Bot type below                 ${NC}"
echo -e "$COLOR1╰══════════════════════════════════════════╯${NC}"
echo -e "$COLOR1╭══════════════════════════════════════════╮${NC}"
echo -e "$COLOR1  [ 1 ] ${WH}Buat/Edit BOT INFO Multi Login SSH, XRAY & TRANSAKSI   ${NC}"
echo -e "$COLOR1  [ 2 ] ${WH}Buat/Edit BOT INFO Create User & Lain Lain    ${NC}"
echo -e ""
echo -e "$COLOR1  [ 3 ] ${WH}Buat/Edit BOT INFO Backup Telegram    ${NC}"
echo -e "$COLOR1╰══════════════════════════════════════════╯${NC}"
read -p "   Please select numbers 1-3 or Any Button(Random) to exit : " bot
echo ""
if [[ $bot == "1" ]]; then
clear
rm -rf /etc/perlogin
mkdir -p /etc/perlogin
cd /etc/perlogin
touch token
touch id
echo -e ""
echo -e "$COLOR1 [ INFO ] ${WH}Create for database Multi Login"
read -rp "Enter Token (Creat on @BotFather) : " -e token2
echo "$token2" > token
read -rp "Enter Your Id (Creat on @userinfobot)  : " -e idat
echo "$idat" > id
sleep 1
m-bot2
fi
if [[ $bot == "2" ]]; then
clear
rm -rf /etc/per
mkdir -p /etc/per
cd /etc/per
touch token
touch id
echo -e ""
echo -e "$COLOR1 [ INFO ] ${WH}Create for database Akun Dan Lain Lain"
read -rp "Enter Token (Creat on @BotFather) : " -e token3
echo "$token3" > token
read -rp "Enter Your Id (Creat on @userinfobot)  : " -e idat2
echo "$idat2" > id
sleep 1
m-bot2
fi
if [[ $bot == "3" ]]; then
clear
rm -rf /usr/bin/token
rm -rf /usr/bin/idchat
echo -e ""
echo -e "$COLOR1 [ INFO ] ${WH}Create for database Backup Telegram"
read -rp "Enter Token (Creat on @BotFather) : " -e token23
echo "$token23" > /usr/bin/token
read -rp "Enter Your Id (Creat on @userinfobot)  : " -e idchat
echo "$idchat" > /usr/bin/idchat
sleep 1
m-bot2
fi
menu
}
clear
clear && clear && clear
clear;clear;clear
echo -e " $COLOR1╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " $COLOR1│${NC} ${COLBG1}                 ${WH} • AUTOSCRIPT BY JERRY VIP •           ${NC} $COLOR1│ $NC"
echo -e " $COLOR1╰══════════════════════════════════════════════════════════╯${NC}"
echo -e " $COLOR1╭══════════════════════════════════════════════════════════╮${NC}"
echo -e " $COLOR1│$NC${WH} ❈ OS            ${COLOR1}: ${WH}$MODEL2${NC}"
echo -e " $COLOR1│$NC${WH} ❈ RAM           ${COLOR1}: ${WH}$tram / $uram MB${NC}"
echo -e " $COLOR1│$NC${WH} ❈ FECHA         ${COLOR1}: ${WH}$Fecha${NC}"
echo -e " $COLOR1│$NC${WH} ❈ HORA          ${COLOR1}: ${WH}$TIMEZONE${NC}"
echo -e " $COLOR1│$NC${WH} ❈ ACTIVO        ${COLOR1}: ${WH}$uphours $upminutes $uptimecek"
echo -e " $COLOR1│$NC${WH} ❈ ISP           ${COLOR1}: ${WH}$ISP${NC}"
echo -e " $COLOR1│$NC${WH} ❈ CIUDAD        ${COLOR1}: ${WH}$CITY${NC}"
echo -e " $COLOR1│$NC${WH} ❈ IP VPS        ${COLOR1}: ${WH}$MYIP${NC}"
echo -e " $COLOR1│$NC${WH} ❈ DOMINIO       ${COLOR1}: ${WH}$(cat /etc/xray/domain)"
#echo -e " $COLOR1│$NC${WH} ❈ DOMINIO SLOW  ${COLOR1}: ${WH}$(cat /etc/slowdns/infons)"
echo -e " $COLOR1│$NC${WH} ❈ DOMINIO SLOW  ${COLOR1}: ${WH}$(cat /etc/xray/dns)"
echo -e " $COLOR1╰══════════════════════════════════════════════════════════╯${NC}"
echo -e "    $COLOR1╭═════════════════ • ${NC}${WH}STATUS SERVER${NC}${COLOR1} • ═══════════════╮${NC}"
echo -e "     ${WH} SSH SSL : ${status_ssl} ${WH} XRAY : ${status_xray} ${WH} NGINX : ${status_nginx} ${WH} DROPBEAR : ${status_beruangjatuh}$NC"
echo -e "      ${WH} UDP CUSTOM : ${status_udp} ${WH} SSH WS : ${status_ws} ${WH} TROJAN-GO : ${stat_trgo} ${NC}"
echo -e "    $COLOR1╰═══════════════════════════════════════════════════╯${NC}"
echo -e "        $COLOR1╭════════════════════════════════════════════╮${NC}"
echo -e "                 $COLOR1$NC${WH}    LISTA CUENTAS PREMIUM ${NC}"
echo -e "        $COLOR1      ═════════════════════════════════ ${NC}"
printf "                \033[1;37m%-16s ${COLOR1}%-4s${NC} ${WH}%-5s\e[0m\n" " SSH/OPVPN   =" "$total_ssh" "ACCOUNT "
printf "                \033[1;37m%-16s ${COLOR1}%-4s${NC} ${WH}%-5s\e[0m\n" " VMESS/WS    =" "$vmess" "ACCOUNT "
printf "                \033[1;37m%-16s ${COLOR1}%-4s${NC} ${WH}%-5s\e[0m\n" " VLESS/WS    =" "$vless" "ACCOUNT "
printf "                \033[1;37m%-16s ${COLOR1}%-4s${NC} ${WH}%-5s\e[0m\n" " TROJAN/GRPC =" "$trtls" "ACCOUNT "
#printf "                \033[1;37m%-16s ${COLOR1}%-4s${NC} ${WH}%-5s\e[0m\n" " NOOBZVPNS   =" "$jumlah_noobz" "ACCOUNT "
printf "                \033[1;37m%-16s ${COLOR1}%-4s${NC} ${WH}%-5s\e[0m\n" " TROJAN-GO   =" "$jumlah_trgo" "ACCOUNT "
printf "                \033[1;37m%-16s ${COLOR1}%-4s${NC} ${WH}%-5s\e[0m\n" " SHADOW-SOCK =" "$shadow" "ACCOUNT "
echo -e "        $COLOR1╰════════════════════════════════════════════╯${NC}"
echo -e " $COLOR1╭═════════════════════ • ${WH}LISTA DE MENU${NC}${COLOR1} • ════════════════════╮${NC}"
echo -e " $COLOR1│$NC ${WH}[${COLOR1}01${WH}]${NC} ${COLOR1}• ${WH}SSH-WS       ${WH}[${COLOR1}Menu${WH}] ${NC} $COLOR1│${NC} ${WH}[${COLOR1}08${WH}]${NC} ${COLOR1}• ${WH}BOT PANEL       ${WH}[${COLOR1}Menu${WH}]$COLOR1│${NC}"
echo -e " $COLOR1│$NC ${WH}[${COLOR1}02${WH}]${NC} ${COLOR1}• ${WH}VMESS        ${WH}[${COLOR1}Menu${WH}] ${NC} $COLOR1│${NC} ${WH}[${COLOR1}09${WH}]${NC} ${COLOR1}• ${WH}BOT NOTIFICAC.  ${WH}[${COLOR1}Menu${WH}]$COLOR1│${NC}"    
echo -e " $COLOR1│$NC ${WH}[${COLOR1}03${WH}]${NC} ${COLOR1}• ${WH}VLESS        ${WH}[${COLOR1}Menu${WH}] ${NC} $COLOR1│${NC} ${WH}[${COLOR1}10${WH}]${NC} ${COLOR1}• ${WH}ACTUALIZAR SC.  ${WH}[${COLOR1}Menu${WH}]$COLOR1│${NC}"    
echo -e " $COLOR1│$NC ${WH}[${COLOR1}04${WH}]${NC} ${COLOR1}• ${WH}SHADOW-SOCK  ${WH}[${COLOR1}Menu${WH}] ${NC} $COLOR1│${NC} ${WH}[${COLOR1}89${WH}]${NC} ${COLOR1}  ${WH}EDITAR BANER    ${WH}[${COLOR1}MENU${WH}]$COLOR1│${NC}"   
echo -e " $COLOR1│$NC ${WH}[${COLOR1}05${WH}]${NC} ${COLOR1}• ${WH}TROJAN       ${WH}[${COLOR1}Menu${WH}] ${NC} $COLOR1│${NC} ${WH}[${COLOR1}11${WH}]${NC} ${COLOR1}• ${WH}OTRAS OPCIONES  ${WH}[${COLOR1}Menu${WH}]$COLOR1│${NC}" 
echo -e " $COLOR1│$NC ${WH}[${COLOR1}06${WH}]${NC} ${COLOR1}• ${WH}TROJAN-GO    ${WH}[${COLOR1}Menu${WH}] ${NC} $COLOR1│${NC} ${WH}[${COLOR1}12${WH}]${NC} ${COLOR1}• ${WH}RESPALDAR VPS   ${WH}[${COLOR1}Menu${WH}]$COLOR1│${NC}" 
echo -e " $COLOR1│$NC ${WH}[${COLOR1}07${WH}]${NC} ${COLOR1}• ${WH}FIX REINICIO ${WH}[${COLOR1}Menu${WH}] ${NC} $COLOR1│${NC} ${WH}[${COLOR1}13${WH}]${NC} ${COLOR1}• ${WH}REINICIAR VPS   ${WH}[${COLOR1}Menu${WH}]$COLOR1│${NC}" 
echo -e " $COLOR1│$NC ${WH}[${COLOR1}22${WH}]${NC} ${COLOR1}• ${WH}SERVICIOS ON ${WH}[${COLOR1}Menu${WH}] ${NC} $COLOR1│${NC} ${WH}[${COLOR1}23${WH}]${NC} ${COLOR1}• ${WH}RESET SERVICIOS ${WH}[${COLOR1}Menu${WH}]$COLOR1│${NC}"
echo -e " $COLOR1│$NC ${WH}[${COLOR1}24${WH}]${NC} ${COLOR1}• ${WH}INSTALAR UDP ${WH}[${COLOR1}Menu${WH}] ${NC} $COLOR1│${NC} ${WH}[${COLOR1}25${WH}]${NC} ${COLOR1}• ${WH}INSTALAR SlowDNS${WH}[${COLOR1}Menu${WH}]$COLOR1│${NC}"
echo -e " $COLOR1╰════════════════════════════════════════════════════════════╯${NC}"
if [ "$Isadmin" = "ON" ]; then
echo -e "$COLOR1╭══════════════════════ • ${WH}PANEL ADMIN VIP${NC}${COLOR1} • ══════════════════╮${NC}"
echo -e "$COLOR1│  ${WH}[${COLOR1}14${WH}]${NC} ${COLOR1}• ${WH}MENU KEY BOT ${WH}[${COLOR1}MENU${WH}] $COLOR1 $NC"
ressee="m-ip2"
bottt="m-bot"
echo -e "$COLOR1╰═════════════════════════════════════════════════════════════╯${NC}"
else
ressee="menu"
bottt="menu"
fi
echo -e "$COLOR1╭═════════════════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│$NC  ${WH}Total    $COLOR1│${NC}     ${WH}HOY         ${WH}AYER             ${WH}MES         ${NC}"
echo -e "$COLOR1│$NC ${WH}Bantwidth $COLOR1│${NC}   ${WH}$today_tx $today_txv     ${WH}$yesterday_tx $yesterday_txv      ${WH}$month_tx $month_txv$COLOR1${NC}"
echo -e "$COLOR1╰═════════════════════════════════════════════════════════════╯${NC}"
DATE=$(date +'%Y-%m-%d')
datediff() {
d1=$(date -d "$1" +%s)
d2=$(date -d "$2" +%s)
echo -e "$COLOR1 $NC Expira En   : $(( (d1 - d2) / 86400 )) Dias"
}
function setupudp(){
echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ ${BGCOLOR}         DESCARGANDO UDP COSTUM         ${NC}${BIBlue} │${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/udp-custom.sh && chmod +x udp-custom.sh && bash udp-custom.sh
rm -f /root/udp-custom.sh
clear
menu
}

function setupslow(){
echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"
echo -e "${BIBlue}│ ${BGCOLOR}         DESCARGANDO SlowDNS        ${NC}${BIBlue} │${NC}"
echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/slowdns/installsl.sh && chmod +x installsl.sh && bash installsl.sh
rm -f /root/installsl.sh
clear
menu
#echo -e "$COLOR1╭══════════════════════════════════════════╮${NC}"
#echo -e "$COLOR1 $NC     \e[1;32mMENU DOMINIO / SUBDOMINIO SLOWDNS        ${NC}$COLOR1${NC}"
#echo -e "$COLOR1╰══════════════════════════════════════════╯${NC}"
#echo -e "$COLOR1╭══════════════════════════════════════════╮${NC}"
#echo -e "$COLOR1  [ 1 ] \e[1;32mESCOGER DOMINIO SLOWDNS (FREE) ${NC}"
#echo -e "$COLOR1  [ 2 ] \e[1;32mINSTALAR SlowDNS (TU DIMINIO)  ${NC}"
#echo -e "$COLOR1╰══════════════════════════════════════════╯${NC}"
#read -p "   Por Favor Selecciona una Opcion o [ENTER] Regresar al MENU: " slow
#echo ""
#if [[ $slow == "1" ]]; then
#clear
#echo -e "$COLOR1╭══════════════════════════════════════════╮${NC}"
#echo -e "$COLOR1│${COLBG1}              DOMINIO SlowDNS             ${NC}$COLOR1│${NC}"
#echo -e "$COLOR1╰══════════════════════════════════════════╯${NC}"
#wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/slowdns/installsl.sh && chmod +x installsl.sh && bash installsl.sh
#rm -f /root/installsl.sh
#clear
#menu
#fi
#if [[ $slow == "2" ]]; then
#clear
#echo -e "${BIBlue}╭══════════════════════════════════════════╮${NC}"  
#echo -e "${BIBlue}│${COLBG1}            DESCARGANDO SlowDNS           ${NC}${BIBlue}│${NC}"
#echo -e "${BIBlue}╰══════════════════════════════════════════╯${NC}"
#wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/slowdns/slowdns && chmod +x slowdns && bash slowdns
#rm -f /root/slowdns
#clear
#menu
}

function new(){
rm -f /etc/cron.d/reboot_otomatis
rm -f /etc/cron.d/autocpu
echo "Auto-Reinicio Apagado."
sleep 2
menu
}

function newx(){
clear
until [[ $usagee =~ ^[0-9]+$ ]]; do
read -p "Formato de Cuota de Usuario número 1, 2 o 3 (TERA): " usagee
done
echo "$usagee" > /etc/usagee
cat> /etc/cron.d/bantwidth << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/10 * * * * root /usr/bin/bantwidth
END
echo "Auto-Shutdown $usagee TERA TURN ON."
sleep 1
menu
}
d1=$(date -d "$Exp2" +%s)
d2=$(date -d "$today" +%s)
certificate=$(( (d1 - d2) / 86400 ))
domain=$(cat /etc/xray/domain)
function restartservice(){    
clear
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mPor Favor Espere, Cargando \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mPor Favor Espere, Cargando \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}
clear
echo -e "$COLOR1 ╭══════════════════════════════════════════╮${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}        ${WH}  REINICIANDO SERVICIOS VPS       ${NC} $COLOR1 $NC"
echo -e "$COLOR1 ╰══════════════════════════════════════════╯${NC}"
echo -e ""
echo -e "  \033[1;91m Reiniciando Todos los Servicios... \033[1;37m"
#fun_bar 'res1'
    systemctl daemon-reload
    systemctl restart nginx
    systemctl restart trojan-go
    systemctl restart xray
    #systemctl restart noobzvpns
    systemctl restart udp-custom
    systemctl restart ws-dropbear
    systemctl restart ws-dropbear2
    systemctl restart ws-dropbear3
    systemctl restart ws-stunnel
    systemctl restart openvpn
    systemctl restart cron
    systemctl restart netfilter-persistent
    systemctl restart squid
    systemctl restart badvpn1
    systemctl restart badvpn2
    systemctl restart badvpn3
echo -e ""
read -n 1 -s -r -p "Presione [ Enter ] para Regresar al MENU"
menu
}
function updatews(){
cd
rm -rf *
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/menu/install-up.sh &> /dev/null
chmod +x install_up.sh
./install_up.sh
}
echo -e "$COLOR1╭═════════════════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│$NC ${WH} ❈ Version  ${NC} : ${WH}$(cat /opt/.ver) Version${NC}$COLOR1"
echo -e "$COLOR1│$NC ${WH} ❈ Cliente  ${NC} : \e[1;32m$author${NC}"
echo -e "$COLOR1│$NC ${WH} ❈ Vendedor ${NC} : \e[1;32m$Name${NC}"
echo -e "$COLOR1│$NC ${WH} ❈ Duracion ${NC} : ${WH}$certificate Días${NC}$COLOR1"
echo -e "$COLOR1│$NC ${WH} ❈ Expira   ${NC} : ${WH}$Exp2 $sts ${NC}$COLOR1"
echo -e "$COLOR1╰═════════════════════════════════════════════════════════════╯${NC}"
echo -e ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
01 | 1) clear ; m-sshovpn ;;
02 | 2) clear ; m-vmess ;;
03 | 3) clear ; m-vless ;;
04 | 4) clear ; ss-menu ;;
05 | 5) clear ; m-trojan ;;
06 | 6) clear ; m-trgo ;;
07 | 7) clear ; new ;;
08 | 8) clear ; m-bot  ;;
09 | 9) clear ; m-bot2 ;;
10 | 10) clear ; m-update ;;
11 | 11) clear ; m-system ;;
12 | 12) clear ; m-backup;;
13 | 13) clear ; reboot ;;
14 | 14) clear ; $ressee ;;
15 | 15) clear ; $ressee ;;
22 | 22) clear ; running;;
23 | 23) clear ; restartservice ;;
24 | 24) clear ; setupudp ;;
25 | 25) clear ; setupslow ;;
89 | 89) clear ; bannner ;;
#88 | 88) clear ; m-noobz ;;
#77 | 77) clear ; newx ;;
#100) clear ; $up2u ;;
00 | 0) clear ; menu ;;
*) clear ; menu ;;
esac
