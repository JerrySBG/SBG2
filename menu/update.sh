#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
echo -e " [INFO] DESCARGANDO ACTUALIZACION"
sleep 2
REPO="https://raw.githubusercontent.com/JerrySBG/SBG2/main"
wget -q -O /usr/bin/add-ip-bot "${REPO}/bot/add-ip-bot.sh" && chmod +x /usr/bin/add-ip-bot
wget -q -O /usr/bin/menu "${REPO}/menu/menu.sh" && chmod +x /usr/bin/menu
wget -q -O /usr/bin/m-trgo "${REPO}/menu/m-trgo.sh" && chmod +x /usr/bin/m-trgo
wget -q -O /usr/bin/restore "${REPO}/menu/restore.sh" && chmod +x /usr/bin/restore
wget -q -O /usr/bin/backup "${REPO}/menu/backup.sh" && chmod +x /usr/bin/backup
#wget -q -O /usr/bin/addnoobz "${REPO}/bot/addnoobz.sh" && chmod +x /usr/bin/addnoobz
#wget -q -O /usr/bin/cek-noobz "${REPO}/bot/cek-noobz.sh" && chmod +x /usr/bin/cek-noobz
#wget -q -O /usr/bin/m-noobz "${REPO}/menu/m-noobz.sh" && chmod +x /usr/bin/m-noobz
wget -q -O /usr/bin/m-ip "${REPO}/menu/m-ip.sh" && chmod +x /usr/bin/m-ip
wget -q -O /usr/bin/m-bot "${REPO}/menu/m-bot.sh" && chmod +x /usr/bin/m-bot
wget -q -O /usr/bin/update "${REPO}/menu/update.sh" && chmod +x /usr/bin/update
wget -q -O /usr/bin/m-theme "${REPO}/menu/m-theme.sh" && chmod +x /usr/bin/m-theme
wget -q -O /usr/bin/m-vmess "${REPO}/menu/m-vmess.sh" && chmod +x /usr/bin/m-vmess
wget -q -O /usr/bin/m-vless "${REPO}/menu/m-vless.sh" && chmod +x /usr/bin/m-vless
wget -q -O /usr/bin/m-trojan "${REPO}/menu/m-trojan.sh" && chmod +x /usr/bin/m-trojan
wget -q -O /usr/bin/m-system "${REPO}/menu/m-system.sh" && chmod +x /usr/bin/m-system
wget -q -O /usr/bin/m-sshovpn "${REPO}/menu/m-sshovpn.sh" && chmod +x /usr/bin/m-sshovpn
#wget -q -O /usr/bin/m-ssws "${REPO}/menu/m-ssws.sh" && chmod +x /usr/bin/m-ssws
wget -q -O /usr/bin/add-ss "${REPO}/shadowsocks/add-ss.sh" && chmod +x /usr/bin/add-ss
wget -q -O /usr/bin/del-ss "${REPO}/shadowsocks/del-ss.sh" && chmod +x /usr/bin/del-ss
wget -q -O /usr/bin/cek-ss "${REPO}/shadowsocks/cek-ss.sh" && chmod +x /usr/bin/cek-ss
wget -q -O /usr/bin/renew-ss "${REPO}/shadowsocks/renew-ss.sh" && chmod +x /usr/bin/renew-ss
wget -q -O /usr/bin/trial-ss "${REPO}/shadowsocks/trial-ss.sh" && chmod +x /usr/bin/trial-ss
wget -q -O /usr/bin/add-ssr "${REPO}/shadowsocks/add-ssr.sh" && chmod +x /usr/bin/add-ssr
wget -q -O /usr/bin/del-ssr "${REPO}/shadowsocks/del-ssr.sh" && chmod +x /usr/bin/del-ssr
wget -q -O /usr/bin/renew-ssr "${REPO}/shadowsocks/renew-ssr.sh" && chmod +x /usr/bin/renew-ssr
wget -q -O /usr/bin/trial-ssr "${REPO}/shadowsocks/trial-ssr.sh" && chmod +x /usr/bin/trial-ssr
wget -q -O /usr/bin/ss-menu "${REPO}/menu/ss-menu.sh" && chmod +x /usr/bin/ss-menu
wget -q -O /usr/bin/running "${REPO}/menu/running.sh" && chmod +x /usr/bin/running
wget -q -O /usr/bin/m-backup "${REPO}/menu/m-backup.sh" && chmod +x /usr/bin/m-backup
wget -q -O /usr/bin/m-update "${REPO}/menu/m-update.sh" && chmod +x /usr/bin/m-update
wget -q -O /usr/bin/speedtest "${REPO}/speedtest_cli.py" && chmod +x /usr/bin/speedtest
wget -q -O /usr/bin/bckpbot "${REPO}/menu/bckpbot.sh" && chmod +x /usr/bin/bckpbot
wget -q -O /usr/bin/tendang "${REPO}/menu/tendang.sh" && chmod +x /usr/bin/tendang
wget -q -O /usr/bin/bottelegram "${REPO}/menu/bottelegram.sh" && chmod +x /usr/bin/bottelegram
wget -q -O /usr/bin/m-allxray "${REPO}/menu/m-allxray.sh" && chmod +x /usr/bin/m-allxray
wget -q -O /usr/bin/xraylimit "${REPO}/menu/xraylimit.sh" && chmod +x /usr/bin/xraylimit
wget -q -O /usr/bin/trialvmess "${REPO}/menu/trialvmess.sh" && chmod +x /usr/bin/trialvmess
wget -q -O /usr/bin/trialvless "${REPO}/menu/trialtrojan.sh" && chmod +x /usr/bin/trialtrojan
wget -q -O /usr/bin/trialtrojan "${REPO}/menu/trialvless.sh" && chmod +x /usr/bin/trialvless
wget -q -O /usr/bin/trialssh "${REPO}/menu/trialssh.sh" && chmod +x /usr/bin/trialssh
wget -q -O /usr/bin/autocpu "${REPO}/install/autocpu.sh" && chmod +x /usr/bin/autocpu
wget -q -O /usr/bin/bantwidth "${REPO}/install/bantwidth" && chmod +x /usr/bin/bantwidth
echo -e " [INFO] DESCARGADO CON EXITO LA ACTUALIZACION"
sleep 2
exit
