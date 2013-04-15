#!/bin/bash
#expects hosts to be specified in "/home/user/addl_hosts"
cat dns_conf/server.conf | sed 's/COMPSETREPLACEINSETUP/\/home\/'$1'\/addl_hosts/' > /etc/dnsmasq.conf
apt-get install dnsmasq
