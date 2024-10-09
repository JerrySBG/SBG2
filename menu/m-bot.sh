#!/bin/bash
NC="\e[0m"
RED="\033[0;31m"
COLOR1="\033[1;36m"
BLUE="\033[1;36m"
purple="\033[1;95m"
WH='\033[1;37m'

ipsaya=$(curl -sS ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/JerrySBG/permission/main/ip"
checking_sc() {
    useexp=$(curl -sS $data_ip | grep $ipsaya | awk '{print $3}')
    if [[ $date_list < $useexp ]]; then
        echo -ne
    else
        echo -e "$COLOR1╭═════════════════════════════════════════════════╮${NC}"
        echo -e "$COLOR1 ${NC} ${COLBG1}          ${WH}• AUTOSCRIPT PREMIUM •               ${NC} $COLOR1 $NC"
        echo -e "$COLOR1╰═════════════════════════════════════════════════╯${NC}"
        echo -e "$COLOR1╭═════════════════════════════════════════════════╮${NC}"
        echo -e "                        ${RED}PERMISO DENEGADO !${NC}"
        echo -e "   \033[0;33mTU VPS${NC} $ipsaya \033[0;33mACABA DE SER BANEADA${NC}" 
        echo -e "          \033[0;33mCOMPRA ACCESO AL SCRIPT POR FAVOR${NC}"
        echo -e "                \033[0;33mCONTACTA AL ADMIN ${NC}"
        echo -e "                \033[0;33mTELEGRAM: @Jerry_SBG ${NC}"
        echo -e "                \033[0;33mWHATSAPP: 0529241293310 ${NC}"
        echo -e "$COLOR1╰═════════════════════════════════════════════════╯${NC}"
        exit
    fi
}
checking_sc

domain=$(cat /etc/xray/domain)
#color
purple="\e[92;1m"
NC='\e[0m'
WH='\033[1;37m'
#install
function install-bot(){
apt update -y && apt upgrade -y
apt install python3 python3-pip git speedtest-cli -y
apt install python3-pip
sudo apt-get install -y p7zip-full
cd /usr/bin
clear
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/bot/bot.zip
unzip bot.zip
mv bot/* /usr/bin
chmod +x /usr/bin/*
rm -rf bot.zip
clear
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/bot/kyt.zip
unzip kyt.zip
pip3 install -r kyt/requirements.txt
clear
cd /usr/bin/kyt/bot
chmod +x *
mv -f * /usr/bin
rm -rf /usr/bin/kyt/bot
rm -rf /usr/bin/*.zip
cd
rm -rf /etc/tele

clear
echo -e "$COLOR1╭═════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}                ${WH}• BOT PANEL •                  ${NC} $COLOR1 $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════╯${NC}"
echo -e "$COLOR1╭═════════════════════════════════════════════════╮${NC}"
echo -e "${purple}Tutorial Crear Bot Y ID Telegram${NC}"
echo -e "${purple}[*] Crear Bot Y Token Bot : @BotFather${NC}"
echo -e "${purple}[*] Info de Id Telegram   : @MissRose_bot , Escriba /info${NC}"
echo -e "$COLOR1╰═════════════════════════════════════════════════╯${NC}"
rm -rf /usr/bin/ddsdswl.session
rm -rf /usr/bin/kyt/var.txt
rm -rf /usr/bin/kyt/database.db
echo -e ""
read -e -p "[*] Introduce Tu Bot Token : " bottoken
read -e -p "[*] Introduce Tu Id Telegram :" admin

cat >/usr/bin/kyt/var.txt <<EOF
BOT_TOKEN="$bottoken"
ADMIN="$admin"
DOMAIN="$domain"
EOF

echo 'TEXT=$'"(cat /etc/notiftele)"'' > /etc/tele
echo "TIMES=10" >> /etc/tele
echo 'KEY=$'"(cat /etc/per/token)"'' >> /etc/tele

echo "$bottoken" > /etc/per/token
echo "$admin" > /etc/per/id
echo "$bottoken" > /usr/bin/token
echo "$admin" > /usr/bin/idchat
echo "$bottoken" > /etc/perlogin/token
echo "$admin" > /etc/perlogin/id
clear

echo "SHELL=/bin/sh" >/etc/cron.d/cekbot
echo "PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin" >>/etc/cron.d/cekbot
echo "*/1 * * * * root /usr/bin/cekbot" >>/etc/cron.d/cekbot

cat > /usr/bin/cekbot << END
nginx=$( systemctl status kyt | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    echo -ne
else
    systemctl restart kyt
    systemctl start kyt
fi

kyt=$( systemctl status kyt | grep "TERM" | wc -l )
if [[ $kyt == "0" ]]; then
echo -ne
else
    systemctl restart kyt
    systemctl start kyt
fi
END

cat > /etc/systemd/system/kyt.service << END
[Unit]
Description=Simple kyt - @kyt
After=syslog.target network-online.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/python3 -m kyt
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload &> /dev/null
systemctl enable kyt &> /dev/null
systemctl start kyt &> /dev/null
systemctl restart kyt &> /dev/null


echo "LISTO"
echo " Instalaciones Completadas, Escribe /start en tu Bot"
read -n 1 -s -r -p "Presione cualquier tecla para volver al MENU"
menu
}
cd
if [ -e /usr/bin/kyt ]; then
echo -ne
else
install-bot
fi

#isi data     
echo -e "$COLOR1╭══════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│      \033[1;37mPor favor seleccione su Opción      $COLOR1│${NC}"
echo -e "$COLOR1╰══════════════════════════════════════════╯${NC}"
echo -e "$COLOR1╭══════════════════════════════════════════╮${NC}"
echo -e "$COLOR1│  [ 1 ]  \033[1;37mCAMBIAR BOT       ${NC}"
echo -e "$COLOR1│  [ 2 ]  \033[1;37mACTUALIZAR BOT     ${NC}"
echo -e "$COLOR1│  [ 3 ]  \033[1;37mBORRAR BOT     ${NC}"
#echo -e "$COLOR1│  [ 4 ]  \033[1;37mAÑADIR ADMINISTRADOR     ${NC}"
echo -e "$COLOR1╰══════════════════════════════════════════╯${NC}"
until [[ $domain2 =~ ^[1-3]+$ ]]; do 
read -p "   Por favor seleccione los números 1 al 5 : " domain2
done

if [[ $domain2 == "1" ]]; then
clear
echo -e "$COLOR1╭═════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}                ${WH}• BOT PANEL •                  ${NC} $COLOR1 $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════╯${NC}"
echo -e "$COLOR1╭═════════════════════════════════════════════════╮${NC}"
echo -e "${purple}Tutorial Crear Bot Y Tu ID Telegram${NC}"
echo -e "${purple}[*] Crear Bot Y Token Bot : @BotFather${NC}"
echo -e "${purple}[*] Info de Id Telegram   : @MissRose_bot , Escribe /info${NC}"
echo -e "$COLOR1╰═════════════════════════════════════════════════╯${NC}"
rm -rf /usr/bin/ddsdswl.session
rm -rf /usr/bin/kyt/var.txt
rm -rf /usr/bin/kyt/database.db
echo -e ""
read -e -p "[*] Introduce Tu Bot Token : " bottoken
read -e -p "[*] Introduce Tu Id Telegram :" admin

cat >/usr/bin/kyt/var.txt <<EOF
BOT_TOKEN="$bottoken"
ADMIN="$admin"
DOMAIN="$domain"
EOF

echo "$bottoken" > /etc/per/token
echo "$admin" > /etc/per/id
clear

cat > /etc/systemd/system/kyt.service << END
[Unit]
Description=Simple kyt - @kyt
After=syslog.target network-online.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/python3 -m kyt
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

systemctl daemon-reload &> /dev/null
systemctl stop kyt &> /dev/null
systemctl enable kyt &> /dev/null
systemctl start kyt &> /dev/null
systemctl restart kyt &> /dev/null

echo "LISTO"
echo " Instalaciones Completadas, Escribe /menu en tu Bot"
read -n 1 -s -r -p "Presione cualquier tecla para volver al MENU"
menu
fi
if [[ $domain2 == "2" ]]; then
clear
cp -r /usr/bin/kyt/var.txt /usr/bin &> /dev/null
rm -rf /usr/bin/kyt.zip
rm -rf /usr/bin/kyt
sleep 2
cd /usr/bin
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/bot/bot.zip
unzip bot.zip
mv bot/* /usr/bin
chmod +x /usr/bin/*
rm -rf bot.zip
clear
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/bot/kyt.zip
unzip kyt.zip
cd kyt
pip3 install -r kyt/requirements.txt
clear
cd /usr/bin/kyt/bot
chmod +x *
mv -f * /usr/bin
rm -rf /usr/bin/kyt/bot
rm -rf /usr/bin/*.zip
mv /usr/bin/var.txt /usr/bin/kyt
cd
clear

systemctl daemon-reload &> /dev/null
systemctl stop kyt &> /dev/null
systemctl enable kyt &> /dev/null
systemctl start kyt &> /dev/null
systemctl restart kyt &> /dev/null
clear
echo -e "BOT Telegram ACTUALIZADO CON EXITO"
read -n 1 -s -r -p "Presione cualquier tecla para volver al MENU"
menu
fi

if [[ $domain2 == "3" ]]; then
clear
rm -rf /usr/bin/kyt
echo -e "BOT Telegram BORRADO CON EXITO"
read -n 1 -s -r -p "Presione cualquier tecla para volver al MENU"
menu
fi

if [[ $domain2 == "4" ]]; then
clear
echo -e "$COLOR1╭═════════════════════════════════════════════════╮${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}                ${WH}• BOT PANEL •                  ${NC} $COLOR1 $NC"
echo -e "$COLOR1╰═════════════════════════════════════════════════╯${NC}"
echo -e ""
read -e -p "[*] Ingrese su ID de Usuario : " user
userke=$(cat /usr/bin/kyt/var.txt | wc -l)
sed -i '/(ADMIN,))/a Hola	c.execute("INSERT INTO admin (user_id) VALUES (?)",(USER'""$userke""',))' /usr/bin/kyt/__init__.py
cat >>/usr/bin/kyt/var.txt <<EOF
USER${userke}=$user
EOF
sed -i "s/Hola//g" /usr/bin/kyt/__init__.py

echo 'curl -s --max-time $TIMES -d "chat_id='""$user""'&disable_web_page_preview=1&text=$TEXT&parse_mode=html" https://api.telegram.org/bot$KEY/sendMessage >/dev/null' >> /etc/tele
clear
echo -e "BOT Telegram con Éxito AGREGAR Administrador"
rm -rf /usr/bin/ddsdswl.session
rm -rf /usr/bin/kyt/database.db
systemctl restart kyt 
read -n 1 -s -r -p "Presione cualquier tecla para volver al MENU"
menu
fi
