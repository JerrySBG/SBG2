clear
# color declare
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'


echo -e "${IGreen}   ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "${IGreen}   ┃     ${ICyan}MENU BACKUP${NC}"
echo -e "${IGreen}   ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo -e "${IGreen}   ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${NC}"
echo -e "${IGreen}   ┃  ${ICyan}1  Backup"
echo -e "${IGreen}   ┃  ${ICyan}2. Restore"
echo -e "${IGreen}   ┃  ${ICyan}3. strt"
echo -e "${IGreen}   ┃  ${ICyan}4. limit speed"
echo -e "${IGreen}   ┃  ${ICyan}5. autobackup"
echo -e "${IGreen}   ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
echo
echo -e "${BIYellow}"
read -p    "Pilih Nomor └╼>>>" bro


if [ $bro = 1 ] || [ $bro = 1 ]
then
figlet "backup" | lolcat
backup
echo "--------------------------------------------------------"
echo
echo "Terimakasih sudah menggunakan layanan script ini"
echo
echo "--------------------------------------------------------"
fi

if [ $bro = 2 ] || [ $bro = 2 ]
then
figlet "Restore" | lolcat
restore
echo "--------------------------------------------------------"
echo
echo "Terimakasih sudah menggunakan layanan script ini"
echo
echo "--------------------------------------------------------"
fi
if [ $bro = 3 ] || [ $bro = 3 ]
then
figlet "strt"
strt
echo "--------------------------------------------------------"
echo
echo "Terimakasih sudah menggunakan layanan script ini"
echo
echo "--------------------------------------------------------"
fi
if [ $bro = 4 ] || [ $bro = 4 ]
then
limitspeed
echo "--------------------------------------------------------"
echo
echo "Terimakasih sudah menggunakan layanan script ini"
echo
echo "--------------------------------------------------------"
fi

if [ $bro = 5 ] || [ $bro = 5 ]
then
autobackup
echo "--------------------------------------------------------"
echo
echo "Terimakasih sudah menggunakan layanan script ini"
echo
echo "--------------------------------------------------------"
fi
