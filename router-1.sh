export DEBIAN_FRONTEND=noninteractive
# Startup commands go here

sudo ip addr add 10.1.0.1/30 dev enp0s9
sudo ip link set dev enp0s9 up

sudo ip link add link enp0s8 name enp0s8.10 type vlan id 10 
sudo ip link add link enp0s8 name enp0s8.11 type vlan id 11 

sudo ip addr add 192.168.0.1/23 dev enp0s8.10
sudo ip addr add 192.168.2.1/24 dev enp0s8.11

sudo ip link set dev enp0s8 up

sudo sysctl -w net.ipv4.ip_forward=1

sudo ip route add 192.168.3.0/27 via 10.1.0.2