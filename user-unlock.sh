dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
IBlue='\033[0;94m'        # Blue
red='\e[1;31m'
green='\e[1;32m'
NC='\e[0m'
clear
echo " "
echo " "
echo " "
read -p "Input USERNAME to unlock: " username
egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
passwd -u $username
clear
echo " "
echo " "
echo " "
echo "-------------------------------------------"
echo -e "Username ${IBlue}$username${NC} successfully ${green}UNLOCKED${NC}."
echo -e "Access for Username ${IBlue}$username${NC} has been restored"
echo "-------------------------------------------"
else
echo " "
echo -e "Username ${red}$username${NC} not found in your server."
echo " "
exit 1
fi
