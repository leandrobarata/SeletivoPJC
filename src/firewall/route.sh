ip route del default
ip route add default via 201.10.151.101
iptables-restore < /root/backup.rule.firewall
