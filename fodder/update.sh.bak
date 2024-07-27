#!/bin/bash
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
    echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 8; i++)); do
            echo -ne "\033[0;32m🧊"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
    tput cnorm
}
res1() {
    wget https://raw.githubusercontent.com/elsangithub/Auto-SC/main/menu/menufix.zip
    unzip menufix.zip
    chmod +x menu/*
    mv -f menu/* /usr/local/sbin  # -f untuk memaksa penggantian file tanpa konfirmasi
    rm -f menufix.zip  # rm -f untuk menghapus file tanpa konfirmasi
    rm -rf update.sh  # rm -f untuk menghapus file tanpa konfirmasi
}
#!/bin/bash

# Perbarui daftar paket
sudo apt update

# Cek dan install netfilter-persistent jika belum terinstall
if ! dpkg -l | grep -q netfilter-persistent; then
    sudo apt install -y netfilter-persistent
else
    echo "netfilter-persistent sudah terinstall"
fi

# Cek dan install haproxy jika belum terinstall
if ! dpkg -l | grep -q haproxy; then
    sudo apt install -y haproxy
else
    echo "haproxy sudah terinstall"
fi

# Cek dan buat sertifikat self-signed jika belum ada
if [ ! -f /etc/xray/xray.key ] || [ ! -f /etc/xray/xray.crt ]; then
    sudo mkdir -p /etc/xray
    sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/xray/xray.key -out /etc/xray/xray.crt -subj "/C=ID/ST=Jakarta/L=Jakarta/O=NusantaraProject/CN=example.com"
    echo "Sertifikat self-signed telah dibuat"
else
    echo "Sertifikat self-signed sudah ada"
fi


clear
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m              UPDATE SCRIPT             \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "  \033[1;91m update script service\033[1;37m"
fun_bar 'res1'
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
history -c
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu
