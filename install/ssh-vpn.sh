#!/bin/bash
#
# ==================================================

# etc
apt dist-upgrade -y
apt install netfilter-persistent -y
apt-get remove --purge ufw firewalld -y
apt install -y screen curl jq bzip2 gzip vnstat coreutils rsyslog iftop zip unzip git apt-transport-https build-essential -y

# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

#detail nama perusahaan
country=ID
state=America
locality=Mexico_City
organization=none
organizationalunit=none
commonname=none
email=none

# simple password minimal
wget -O /etc/pam.d/common-password "https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/password"
chmod +x /etc/pam.d/common-password

# go to root
cd

# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#update
apt update -y
apt upgrade -y
apt clean all
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

#install jq
apt -y install jq

#install shc
apt -y install shc

# install wget and curl
apt -y install wget curl

#figlet
apt-get install figlet -y
apt-get install ruby -y
gem install lolcat

# set time GMT +7
ln -fs /usr/share/zoneinfo/America/Mexico_City /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

# // install
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof
echo "clear" >> .profile
echo "menu" >> .profile

install_ssl(){
    if [ -f "/usr/bin/apt-get" ];then
            isDebian=`cat /etc/issue|grep Debian`
            if [ "$isDebian" != "" ];then
                    apt-get install -y nginx certbot
                    apt install -y nginx certbot
                    sleep 3s
            else
                    apt-get install -y nginx certbot
                    apt install -y nginx certbot
                    sleep 3s
            fi
    else
        yum install -y nginx certbot
        sleep 3s
    fi

    systemctl stop nginx.service

    if [ -f "/usr/bin/apt-get" ];then
            isDebian=`cat /etc/issue|grep Debian`
            if [ "$isDebian" != "" ];then
                    echo "A" | certbot certonly --renew-by-default --register-unsafely-without-email --standalone -d $domain
                    sleep 3s
            else
                    echo "A" | certbot certonly --renew-by-default --register-unsafely-without-email --standalone -d $domain
                    sleep 3s
            fi
    else
        echo "Y" | certbot certonly --renew-by-default --register-unsafely-without-email --standalone -d $domain
        sleep 3s
    fi
}
#haproxy
apt install haproxy -y
systemctl start haproxy
systemctl enable haproxy
#install haproxy ssl
rm -fr /etc/haproxy/haproxy.cfg
cat >/etc/haproxy/haproxy.cfg <<HAH
global
    tune.ssl.default-dh-param 2048
    tune.h2.initial-window-size 2147483647

defaults
    log global
    mode tcp
    option tcplog
    option forwardfor
    timeout connect 5000
    timeout client 24h
    timeout server 24h
    errorfile 400 /etc/haproxy/errors/400.http
    errorfile 403 /etc/haproxy/errors/403.http
    errorfile 408 /etc/haproxy/errors/408.http
    errorfile 500 /etc/haproxy/errors/500.http
    errorfile 502 /etc/haproxy/errors/502.http
    errorfile 503 /etc/haproxy/errors/503.http
    errorfile 504 /etc/haproxy/errors/504.http
    
frontend http
    mode http
    bind *:80 tfo
    bind *:8080 tfo
    tcp-request inspect-delay 5ms
    option forwardfor header X-Real-IP
    http-request set-header X-Real-IP %[src]
    tcp-request content accept if { req.payload(0,3) -m found }
    tcp-request content accept if WAIT_END 
    tcp-request content accept if { req.ssl_hello_type 1 }
    tcp-request content accept if HTTP
    use_backend openresty_http if HTTP
    default_backend ssh-ws

backend ssh-ws
    mode http
    server ssh-ws 127.0.0.1:22 check

backend openresty_http
    mode http
    server http1 127.0.0.1:18020 send-proxy check


frontend ssl
    mode tcp
    bind *:80 tfo
    bind *:8080 tfo
    bind *:8090 tfo
    bind *:8280 tfo
    bind *:443 tfo
    bind *:443 tfo ssl crt /etc/haproxy/funny.pem alpn h2,http/1.1
    bind *:447 tfo ssl crt /etc/haproxy/funny.pem alpn h2,http/1.1
    bind *:8443 tfo ssl crt /etc/haproxy/funny.pem alpn h2,http/1.1
    option forwardfor header X-Real-IP
    http-request set-header X-Real-IP %[src]
    tcp-request inspect-delay 100ms
    tcp-request content accept if { req.payload(0,11) -m found }
    tcp-request content accept if WAIT_END 
    tcp-request content accept if { req.ssl_hello_type 1 }
    acl web req_ssl_sni -i xxx
    acl is_ssh req.payload(0,7) -m bin 5353482d322e30
    use_backend ws if { path -i /ws-ssl }
     default_backend loadbalance

backend loadbalance
    mode tcp
    balance roundrobin
    server ssh-server 127.0.0.1:143 check

backend ws
    mode tcp
    server vless_srv 127.0.0.1:700 check


HAH

# install webserver
apt -y install nginx php php-fpm php-cli php-mysql libxml-parser-perl
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
curl https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/nginx.conf > /etc/nginx/nginx.conf
curl https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/vps.conf > /etc/nginx/conf.d/vps.conf
sed -i 's/listen = \/var\/run\/php-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php/7.4/fpm/pool.d/www.conf
useradd -m vps;
mkdir -p /home/vps/public_html
echo "<?php phpinfo() ?>" > /home/vps/public_html/info.php
chown -R www-data:www-data /home/vps/public_html
chmod -R g+rw /home/vps/public_html
cd /home/vps/public_html
wget -O /home/vps/public_html/index.html "https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/index.html"
/etc/init.d/nginx restart

# mod php
rm -rf /etc/php/7.4/fpm/php.ini
wget -O /etc/php/7.4/fpm/php.ini "https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/php.ini"
/etc/init.d/php7.4-fpm restart

# install badvpn
cd
wget -O /usr/sbin/badvpn "https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/badvpn" >/dev/null 2>&1
chmod +x /usr/sbin/badvpn > /dev/null 2>&1
wget -q -O /etc/systemd/system/badvpn1.service "https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/badvpn1.service" >/dev/null 2>&1
wget -q -O /etc/systemd/system/badvpn2.service "https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/badvpn2.service" >/dev/null 2>&1
wget -q -O /etc/systemd/system/badvpn3.service "https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/badvpn3.service" >/dev/null 2>&1
systemctl disable badvpn1 
systemctl stop badvpn1 
systemctl enable badvpn1
systemctl start badvpn1 
systemctl disable badvpn2 
systemctl stop badvpn2 
systemctl enable badvpn2
systemctl start badvpn2 
systemctl disable badvpn3 
systemctl stop badvpn3 
systemctl enable badvpn3
systemctl start badvpn3 


# setting port ssh
cd
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
#sed -i '/Port 22/a Port 3303' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 22' /etc/ssh/sshd_config
/etc/init.d/ssh restart

echo "=== Install Dropbear ==="
# install dropbear
apt -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 109 -p 110 -p 69"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/ssh restart
/etc/init.d/dropbear restart

# // install squid for debian 9,10 & ubuntu 20.04
apt -y install squid3

# install squid for debian 11
apt -y install squid
wget -O /etc/squid/squid.conf "https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/squid3.conf"
sed -i $MYIP2 /etc/squid/squid.conf

# setting vnstat
apt -y install vnstat
/etc/init.d/vnstat restart
apt -y install libsqlite3-dev
wget https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6

cd
# install stunnel
apt install stunnel4 -y
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[openvpn]
accept = 442
connect = 127.0.0.1:1194

END

# make a certificate
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem

# konfigurasi stunnel
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/etc/init.d/stunnel4 restart

#OpenVPN
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/vpn.sh &&  chmod +x vpn.sh && ./vpn.sh

#OpenVPNwebsocket
#apt install golang-go
#wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/sshws/ovpn-websocket.sh &&  chmod +x ovpn-websocket.sh && ./ovpn-websocket.sh
#go run ovpn-websocket.sh


# // install lolcat
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/lolcat.sh &&  chmod +x lolcat.sh && ./lolcat.sh

# memory swap 1gb
cd
dd if=/dev/zero of=/swapfile bs=1024 count=4194304
mkswap /swapfile
chown root:root /swapfile
chmod 0600 /swapfile >/dev/null 2>&1
swapon /swapfile >/dev/null 2>&1
sed -i '$ i\/swapfile      swap swap   defaults    0 0' /etc/fstab

# install fail2ban
apt -y install fail2ban

# Instal DDOS Flate
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to zaf@vsnl.com'

# banner /etc/issue.net
echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

# Ganti Banner
wget -O /etc/issue.net "https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/issue.net"

#install bbr dan optimasi kernel
wget https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/bbr.sh && chmod +x bbr.sh && ./bbr.sh

#run_ip
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 80 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 8080 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 8080 -j ACCEPT
#iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 8008 -j ACCEPT
#iptables -I INPUT -m state --state NEW -m udp -p udp --dport 8008 -j ACCEPT
#iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 8080 -j ACCEPT
#iptables -I INPUT -m state --state NEW -m udp -p udp --dport 8080 -j ACCEPT
#iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 8280 -j ACCEPT
#iptables -I INPUT -m state --state NEW -m udp -p udp --dport 8280 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 443 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 8443 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 8443 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload
# blokir torrent
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# download script
cd /usr/bin
wget -O issue "https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/issue.net"
wget -O m-theme "https://raw.githubusercontent.com/JerrySBG/SBG2/main/menu/m-theme.sh"
wget -O speedtest "https://raw.githubusercontent.com/JerrySBG/SBG2/main/install/speedtest_cli.py"

chmod +x issue
chmod +x m-theme
chmod +x speedtest
cd
# remove unnecessary files
apt autoclean -y >/dev/null 2>&1
apt -y remove --purge unscd >/dev/null 2>&1
apt-get -y --purge remove samba* >/dev/null 2>&1
apt-get -y --purge remove apache2* >/dev/null 2>&1
apt-get -y --purge remove bind9* >/dev/null 2>&1
apt-get -y remove sendmail* >/dev/null 2>&1
apt autoremove -y >/dev/null 2>&1
# finishing
cd
chown -R www-data:www-data /home/vps/public_html

rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh
rm -f /root/bbr.sh
rm -rf /etc/apache2

clear
