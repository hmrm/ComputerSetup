#!/bin/bash
#expects hosts to be specified in "/home/user/addl_hosts"
echo "Enter the IP address of the DNS server you'd like to use:"
read -e ipaddr
cat dns_conf/server.conf | sed 's/COMPSETREPLACEINSETUP/'$ipaddr'/' > /etc/dnsmasq.conf
