#!/bin/sh

####
#
# Script to enable wirequard port forwarding on cPouta projects.
#
# PREPARATIONS (first time only)
#
# - In cPouta, set Allocation pools to range 192.168.1.1,192.168.1.99 in Network, Subnet Details
#   to ensure hosts cannot get unreachable IPs from the DHCP server.
#
#
# Run (or just copy-paste to the console) after build on a machine with a Floating IP.
# Fredrik Welander 2021
#
# iptables -t nat -L # list nat rules
#
####

# Run as root
sudo -s

# Enable ip forwarding
sysctl net.ipv4.ip_forward=1
# Make persistentssh
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf

# Flush all old NAT rules if any 
iptables -t nat -F

# Add port forwarding for wireguard NOTE udp!
iptables -t nat -A PREROUTING -p udp --dport 51910 -j DNAT --to-destination 192.168.1.10:51820
iptables -t nat -A PREROUTING -p udp --dport 51911 -j DNAT --to-destination 192.168.1.11:51820
iptables -t nat -A PREROUTING -p udp --dport 51912 -j DNAT --to-destination 192.168.1.12:51820
iptables -t nat -A PREROUTING -p udp --dport 51913 -j DNAT --to-destination 192.168.1.13:51820
iptables -t nat -A PREROUTING -p udp --dport 51914 -j DNAT --to-destination 192.168.1.14:51820
iptables -t nat -A PREROUTING -p udp --dport 51915 -j DNAT --to-destination 192.168.1.15:51820
iptables -t nat -A PREROUTING -p udp --dport 51916 -j DNAT --to-destination 192.168.1.16:51820
iptables -t nat -A PREROUTING -p udp --dport 51917 -j DNAT --to-destination 192.168.1.17:51820
iptables -t nat -A PREROUTING -p udp --dport 51918 -j DNAT --to-destination 192.168.1.18:51820
iptables -t nat -A PREROUTING -p udp --dport 51919 -j DNAT --to-destination 192.168.1.19:51820
iptables -t nat -A PREROUTING -p udp --dport 51920 -j DNAT --to-destination 192.168.1.20:51820
iptables -t nat -A PREROUTING -p udp --dport 51921 -j DNAT --to-destination 192.168.1.21:51820
iptables -t nat -A PREROUTING -p udp --dport 51922 -j DNAT --to-destination 192.168.1.22:51820
iptables -t nat -A PREROUTING -p udp --dport 51923 -j DNAT --to-destination 192.168.1.23:51820
iptables -t nat -A PREROUTING -p udp --dport 51924 -j DNAT --to-destination 192.168.1.24:51820
iptables -t nat -A PREROUTING -p udp --dport 51925 -j DNAT --to-destination 192.168.1.25:51820
iptables -t nat -A PREROUTING -p udp --dport 51926 -j DNAT --to-destination 192.168.1.26:51820
iptables -t nat -A PREROUTING -p udp --dport 51927 -j DNAT --to-destination 192.168.1.27:51820
iptables -t nat -A PREROUTING -p udp --dport 51928 -j DNAT --to-destination 192.168.1.28:51820
iptables -t nat -A PREROUTING -p udp --dport 51929 -j DNAT --to-destination 192.168.1.29:51820
iptables -t nat -A PREROUTING -p udp --dport 51930 -j DNAT --to-destination 192.168.1.30:51820
iptables -t nat -A PREROUTING -p udp --dport 51931 -j DNAT --to-destination 192.168.1.31:51820
iptables -t nat -A PREROUTING -p udp --dport 51932 -j DNAT --to-destination 192.168.1.32:51820
iptables -t nat -A PREROUTING -p udp --dport 51933 -j DNAT --to-destination 192.168.1.33:51820
iptables -t nat -A PREROUTING -p udp --dport 51934 -j DNAT --to-destination 192.168.1.34:51820
iptables -t nat -A PREROUTING -p udp --dport 51935 -j DNAT --to-destination 192.168.1.35:51820
iptables -t nat -A PREROUTING -p udp --dport 51936 -j DNAT --to-destination 192.168.1.36:51820
iptables -t nat -A PREROUTING -p udp --dport 51937 -j DNAT --to-destination 192.168.1.37:51820
iptables -t nat -A PREROUTING -p udp --dport 51938 -j DNAT --to-destination 192.168.1.38:51820
iptables -t nat -A PREROUTING -p udp --dport 51939 -j DNAT --to-destination 192.168.1.39:51820
iptables -t nat -A PREROUTING -p udp --dport 51940 -j DNAT --to-destination 192.168.1.40:51820
iptables -t nat -A PREROUTING -p udp --dport 51941 -j DNAT --to-destination 192.168.1.41:51820
iptables -t nat -A PREROUTING -p udp --dport 51942 -j DNAT --to-destination 192.168.1.42:51820
iptables -t nat -A PREROUTING -p udp --dport 51943 -j DNAT --to-destination 192.168.1.43:51820
iptables -t nat -A PREROUTING -p udp --dport 51944 -j DNAT --to-destination 192.168.1.44:51820
iptables -t nat -A PREROUTING -p udp --dport 51945 -j DNAT --to-destination 192.168.1.45:51820
iptables -t nat -A PREROUTING -p udp --dport 51946 -j DNAT --to-destination 192.168.1.46:51820
iptables -t nat -A PREROUTING -p udp --dport 51947 -j DNAT --to-destination 192.168.1.47:51820
iptables -t nat -A PREROUTING -p udp --dport 51948 -j DNAT --to-destination 192.168.1.48:51820
iptables -t nat -A PREROUTING -p udp --dport 51949 -j DNAT --to-destination 192.168.1.49:51820
iptables -t nat -A PREROUTING -p udp --dport 51950 -j DNAT --to-destination 192.168.1.50:51820
iptables -t nat -A PREROUTING -p udp --dport 51951 -j DNAT --to-destination 192.168.1.51:51820
iptables -t nat -A PREROUTING -p udp --dport 51952 -j DNAT --to-destination 192.168.1.52:51820
iptables -t nat -A PREROUTING -p udp --dport 51953 -j DNAT --to-destination 192.168.1.53:51820
iptables -t nat -A PREROUTING -p udp --dport 51954 -j DNAT --to-destination 192.168.1.54:51820
iptables -t nat -A PREROUTING -p udp --dport 51955 -j DNAT --to-destination 192.168.1.55:51820
iptables -t nat -A PREROUTING -p udp --dport 51956 -j DNAT --to-destination 192.168.1.56:51820
iptables -t nat -A PREROUTING -p udp --dport 51957 -j DNAT --to-destination 192.168.1.57:51820
iptables -t nat -A PREROUTING -p udp --dport 51961 -j DNAT --to-destination 192.168.1.61:51820
iptables -t nat -A PREROUTING -p udp --dport 51962 -j DNAT --to-destination 192.168.1.62:51820
iptables -t nat -A PREROUTING -p udp --dport 51963 -j DNAT --to-destination 192.168.1.63:51820
iptables -t nat -A PREROUTING -p udp --dport 51964 -j DNAT --to-destination 192.168.1.64:51820
iptables -t nat -A PREROUTING -p udp --dport 51965 -j DNAT --to-destination 192.168.1.65:51820
iptables -t nat -A PREROUTING -p udp --dport 51966 -j DNAT --to-destination 192.168.1.66:51820
iptables -t nat -A PREROUTING -p udp --dport 51967 -j DNAT --to-destination 192.168.1.67:51820
iptables -t nat -A PREROUTING -p udp --dport 51968 -j DNAT --to-destination 192.168.1.68:51820
iptables -t nat -A PREROUTING -p udp --dport 51969 -j DNAT --to-destination 192.168.1.69:51820
iptables -t nat -A PREROUTING -p udp --dport 51970 -j DNAT --to-destination 192.168.1.70:51820
iptables -t nat -A PREROUTING -p udp --dport 51971 -j DNAT --to-destination 192.168.1.71:51820
iptables -t nat -A PREROUTING -p udp --dport 51972 -j DNAT --to-destination 192.168.1.72:51820
iptables -t nat -A PREROUTING -p udp --dport 51973 -j DNAT --to-destination 192.168.1.73:51820
iptables -t nat -A PREROUTING -p udp --dport 51974 -j DNAT --to-destination 192.168.1.74:51820
iptables -t nat -A PREROUTING -p udp --dport 51975 -j DNAT --to-destination 192.168.1.75:51820
iptables -t nat -A PREROUTING -p udp --dport 51976 -j DNAT --to-destination 192.168.1.76:51820
iptables -t nat -A PREROUTING -p udp --dport 51977 -j DNAT --to-destination 192.168.1.77:51820
iptables -t nat -A PREROUTING -p udp --dport 51978 -j DNAT --to-destination 192.168.1.78:51820
iptables -t nat -A PREROUTING -p udp --dport 51979 -j DNAT --to-destination 192.168.1.79:51820
iptables -t nat -A PREROUTING -p udp --dport 51980 -j DNAT --to-destination 192.168.1.80:51820
iptables -t nat -A PREROUTING -p udp --dport 51981 -j DNAT --to-destination 192.168.1.81:51820
iptables -t nat -A PREROUTING -p udp --dport 51982 -j DNAT --to-destination 192.168.1.82:51820
iptables -t nat -A PREROUTING -p udp --dport 51983 -j DNAT --to-destination 192.168.1.83:51820
iptables -t nat -A PREROUTING -p udp --dport 51984 -j DNAT --to-destination 192.168.1.84:51820
iptables -t nat -A PREROUTING -p udp --dport 51985 -j DNAT --to-destination 192.168.1.85:51820
iptables -t nat -A PREROUTING -p udp --dport 51986 -j DNAT --to-destination 192.168.1.86:51820
iptables -t nat -A PREROUTING -p udp --dport 51987 -j DNAT --to-destination 192.168.1.87:51820
iptables -t nat -A PREROUTING -p udp --dport 51988 -j DNAT --to-destination 192.168.1.88:51820
iptables -t nat -A PREROUTING -p udp --dport 51989 -j DNAT --to-destination 192.168.1.89:51820
iptables -t nat -A PREROUTING -p udp --dport 51990 -j DNAT --to-destination 192.168.1.90:51820
iptables -t nat -A PREROUTING -p udp --dport 51991 -j DNAT --to-destination 192.168.1.91:51820
iptables -t nat -A PREROUTING -p udp --dport 51992 -j DNAT --to-destination 192.168.1.92:51820
iptables -t nat -A PREROUTING -p udp --dport 51993 -j DNAT --to-destination 192.168.1.93:51820
iptables -t nat -A PREROUTING -p udp --dport 51994 -j DNAT --to-destination 192.168.1.94:51820
iptables -t nat -A PREROUTING -p udp --dport 51995 -j DNAT --to-destination 192.168.1.95:51820
iptables -t nat -A PREROUTING -p udp --dport 51996 -j DNAT --to-destination 192.168.1.96:51820
iptables -t nat -A PREROUTING -p udp --dport 51997 -j DNAT --to-destination 192.168.1.97:51820
iptables -t nat -A PREROUTING -p udp --dport 51998 -j DNAT --to-destination 192.168.1.98:51820
iptables -t nat -A PREROUTING -p udp --dport 51999 -j DNAT --to-destination 192.168.1.99:51820

# Masquerade, note exclude loopback, otherwis nslookup will stop working
iptables ! -o lo -t nat -A POSTROUTING -j MASQUERADE 

# Install iptables-persistent
apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get install iptables-persistent -y

# Make iptables rules persistent
iptables-save > /etc/iptables/rules.v4

# Print out the rules
cat /etc/iptables/rules.v4

# Exit root shell
exit


