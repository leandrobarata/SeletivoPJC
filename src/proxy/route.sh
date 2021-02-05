ip route del default
ip route add default via 192.168.1.250
ip route add 10.1.1.0/24 via 192.168.1.250
ip route add 201.10.151.100/30 via 192.168.1.250
