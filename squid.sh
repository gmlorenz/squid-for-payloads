#!/bin/bash
MYIP=$(wget -qO- ipv4.icanhazip.com); 
MYIP2="s/xxxxxxxxx/$MYIP/g";
# go to root
cd
# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6 
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local
#export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games";

apt remove -y squid;
apt-get -y install squid
# install squid
cd 
wget -O /etc/squid/squid.conf "https://raw.githubusercontent.com/gmlorenz/squid-for-payloads/master/squid.conf" 

sed -i $MYIP2 /etc/squid/squid.conf; 
service squid restart 
clear;
echo -e "\e[94m Squid AutoScript by Renz " 
echo -e "\e[94m installed [OK] "
