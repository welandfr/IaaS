#!/bin/sh

####
#
# Script to enable other port forwarding on cPouta projects (see ssh-gateway for normal use cases)
# Makes each host reachable on SSH and the following ports port 543[last IP octet] on the project-gateway server:
#    
#    80[last-octet]  http       e.g. 8011  to reach 192.168.1.11 on port 80
#    443[last-octet] https      e.g. 44311 to reach 192.168.1.11 on port 443
#    330[last-octet] MySQL      e.g. 33011 to reach 192.168.1.11 on port 3306
#    543[last-octet] PostgreSQL e.g. 54311 to reach 192.168.1.11 on port 5432
#    
#
#  e.g. set postgres connection port to 54311 [postgresql-gateway public IP] to reach 192.168.1.11
#
# In cPouta, set Allocation pools to range 192.168.1.1,192.168.1.99 in Network, Subnet Details
# to ensure hosts cannot get unreachable IPs from the DHCP server.
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
# Make persistent
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf

# Flush all old NAT rules if any 
iptables -t nat -F


# SSH
iptables -t nat -A PREROUTING -p tcp --dport 2210 -j DNAT --to-destination 192.168.1.10:22
iptables -t nat -A PREROUTING -p tcp --dport 2211 -j DNAT --to-destination 192.168.1.11:22
iptables -t nat -A PREROUTING -p tcp --dport 2212 -j DNAT --to-destination 192.168.1.12:22
iptables -t nat -A PREROUTING -p tcp --dport 2213 -j DNAT --to-destination 192.168.1.13:22
iptables -t nat -A PREROUTING -p tcp --dport 2214 -j DNAT --to-destination 192.168.1.14:22
iptables -t nat -A PREROUTING -p tcp --dport 2215 -j DNAT --to-destination 192.168.1.15:22
iptables -t nat -A PREROUTING -p tcp --dport 2216 -j DNAT --to-destination 192.168.1.16:22
iptables -t nat -A PREROUTING -p tcp --dport 2217 -j DNAT --to-destination 192.168.1.17:22
iptables -t nat -A PREROUTING -p tcp --dport 2218 -j DNAT --to-destination 192.168.1.18:22
iptables -t nat -A PREROUTING -p tcp --dport 2219 -j DNAT --to-destination 192.168.1.19:22
iptables -t nat -A PREROUTING -p tcp --dport 2220 -j DNAT --to-destination 192.168.1.20:22
iptables -t nat -A PREROUTING -p tcp --dport 2221 -j DNAT --to-destination 192.168.1.21:22
iptables -t nat -A PREROUTING -p tcp --dport 2222 -j DNAT --to-destination 192.168.1.22:22
iptables -t nat -A PREROUTING -p tcp --dport 2223 -j DNAT --to-destination 192.168.1.23:22
iptables -t nat -A PREROUTING -p tcp --dport 2224 -j DNAT --to-destination 192.168.1.24:22
iptables -t nat -A PREROUTING -p tcp --dport 2225 -j DNAT --to-destination 192.168.1.25:22
iptables -t nat -A PREROUTING -p tcp --dport 2226 -j DNAT --to-destination 192.168.1.26:22
iptables -t nat -A PREROUTING -p tcp --dport 2227 -j DNAT --to-destination 192.168.1.27:22
iptables -t nat -A PREROUTING -p tcp --dport 2228 -j DNAT --to-destination 192.168.1.28:22
iptables -t nat -A PREROUTING -p tcp --dport 2229 -j DNAT --to-destination 192.168.1.29:22
iptables -t nat -A PREROUTING -p tcp --dport 2230 -j DNAT --to-destination 192.168.1.30:22
iptables -t nat -A PREROUTING -p tcp --dport 2231 -j DNAT --to-destination 192.168.1.31:22
iptables -t nat -A PREROUTING -p tcp --dport 2232 -j DNAT --to-destination 192.168.1.32:22
iptables -t nat -A PREROUTING -p tcp --dport 2233 -j DNAT --to-destination 192.168.1.33:22
iptables -t nat -A PREROUTING -p tcp --dport 2234 -j DNAT --to-destination 192.168.1.34:22
iptables -t nat -A PREROUTING -p tcp --dport 2235 -j DNAT --to-destination 192.168.1.35:22
iptables -t nat -A PREROUTING -p tcp --dport 2236 -j DNAT --to-destination 192.168.1.36:22
iptables -t nat -A PREROUTING -p tcp --dport 2237 -j DNAT --to-destination 192.168.1.37:22
iptables -t nat -A PREROUTING -p tcp --dport 2238 -j DNAT --to-destination 192.168.1.38:22
iptables -t nat -A PREROUTING -p tcp --dport 2239 -j DNAT --to-destination 192.168.1.39:22
iptables -t nat -A PREROUTING -p tcp --dport 2240 -j DNAT --to-destination 192.168.1.40:22
iptables -t nat -A PREROUTING -p tcp --dport 2241 -j DNAT --to-destination 192.168.1.41:22
iptables -t nat -A PREROUTING -p tcp --dport 2242 -j DNAT --to-destination 192.168.1.42:22
iptables -t nat -A PREROUTING -p tcp --dport 2243 -j DNAT --to-destination 192.168.1.43:22
iptables -t nat -A PREROUTING -p tcp --dport 2244 -j DNAT --to-destination 192.168.1.44:22
iptables -t nat -A PREROUTING -p tcp --dport 2245 -j DNAT --to-destination 192.168.1.45:22
iptables -t nat -A PREROUTING -p tcp --dport 2246 -j DNAT --to-destination 192.168.1.46:22
iptables -t nat -A PREROUTING -p tcp --dport 2247 -j DNAT --to-destination 192.168.1.47:22
iptables -t nat -A PREROUTING -p tcp --dport 2248 -j DNAT --to-destination 192.168.1.48:22
iptables -t nat -A PREROUTING -p tcp --dport 2249 -j DNAT --to-destination 192.168.1.49:22
iptables -t nat -A PREROUTING -p tcp --dport 2250 -j DNAT --to-destination 192.168.1.50:22
iptables -t nat -A PREROUTING -p tcp --dport 2251 -j DNAT --to-destination 192.168.1.51:22
iptables -t nat -A PREROUTING -p tcp --dport 2252 -j DNAT --to-destination 192.168.1.52:22
iptables -t nat -A PREROUTING -p tcp --dport 2253 -j DNAT --to-destination 192.168.1.53:22
iptables -t nat -A PREROUTING -p tcp --dport 2254 -j DNAT --to-destination 192.168.1.54:22
iptables -t nat -A PREROUTING -p tcp --dport 2255 -j DNAT --to-destination 192.168.1.55:22
iptables -t nat -A PREROUTING -p tcp --dport 2256 -j DNAT --to-destination 192.168.1.56:22
iptables -t nat -A PREROUTING -p tcp --dport 2257 -j DNAT --to-destination 192.168.1.57:22
iptables -t nat -A PREROUTING -p tcp --dport 2258 -j DNAT --to-destination 192.168.1.58:22
iptables -t nat -A PREROUTING -p tcp --dport 2259 -j DNAT --to-destination 192.168.1.59:22
iptables -t nat -A PREROUTING -p tcp --dport 2260 -j DNAT --to-destination 192.168.1.60:22
iptables -t nat -A PREROUTING -p tcp --dport 2261 -j DNAT --to-destination 192.168.1.61:22
iptables -t nat -A PREROUTING -p tcp --dport 2262 -j DNAT --to-destination 192.168.1.62:22
iptables -t nat -A PREROUTING -p tcp --dport 2263 -j DNAT --to-destination 192.168.1.63:22
iptables -t nat -A PREROUTING -p tcp --dport 2264 -j DNAT --to-destination 192.168.1.64:22
iptables -t nat -A PREROUTING -p tcp --dport 2265 -j DNAT --to-destination 192.168.1.65:22
iptables -t nat -A PREROUTING -p tcp --dport 2266 -j DNAT --to-destination 192.168.1.66:22
iptables -t nat -A PREROUTING -p tcp --dport 2267 -j DNAT --to-destination 192.168.1.67:22
iptables -t nat -A PREROUTING -p tcp --dport 2268 -j DNAT --to-destination 192.168.1.68:22
iptables -t nat -A PREROUTING -p tcp --dport 2269 -j DNAT --to-destination 192.168.1.69:22
iptables -t nat -A PREROUTING -p tcp --dport 2270 -j DNAT --to-destination 192.168.1.70:22
iptables -t nat -A PREROUTING -p tcp --dport 2271 -j DNAT --to-destination 192.168.1.71:22
iptables -t nat -A PREROUTING -p tcp --dport 2272 -j DNAT --to-destination 192.168.1.72:22
iptables -t nat -A PREROUTING -p tcp --dport 2273 -j DNAT --to-destination 192.168.1.73:22
iptables -t nat -A PREROUTING -p tcp --dport 2274 -j DNAT --to-destination 192.168.1.74:22
iptables -t nat -A PREROUTING -p tcp --dport 2275 -j DNAT --to-destination 192.168.1.75:22
iptables -t nat -A PREROUTING -p tcp --dport 2276 -j DNAT --to-destination 192.168.1.76:22
iptables -t nat -A PREROUTING -p tcp --dport 2277 -j DNAT --to-destination 192.168.1.77:22
iptables -t nat -A PREROUTING -p tcp --dport 2278 -j DNAT --to-destination 192.168.1.78:22
iptables -t nat -A PREROUTING -p tcp --dport 2279 -j DNAT --to-destination 192.168.1.79:22
iptables -t nat -A PREROUTING -p tcp --dport 2280 -j DNAT --to-destination 192.168.1.80:22
iptables -t nat -A PREROUTING -p tcp --dport 2281 -j DNAT --to-destination 192.168.1.81:22
iptables -t nat -A PREROUTING -p tcp --dport 2282 -j DNAT --to-destination 192.168.1.82:22
iptables -t nat -A PREROUTING -p tcp --dport 2283 -j DNAT --to-destination 192.168.1.83:22
iptables -t nat -A PREROUTING -p tcp --dport 2284 -j DNAT --to-destination 192.168.1.84:22
iptables -t nat -A PREROUTING -p tcp --dport 2285 -j DNAT --to-destination 192.168.1.85:22
iptables -t nat -A PREROUTING -p tcp --dport 2286 -j DNAT --to-destination 192.168.1.86:22
iptables -t nat -A PREROUTING -p tcp --dport 2287 -j DNAT --to-destination 192.168.1.87:22
iptables -t nat -A PREROUTING -p tcp --dport 2288 -j DNAT --to-destination 192.168.1.88:22
iptables -t nat -A PREROUTING -p tcp --dport 2289 -j DNAT --to-destination 192.168.1.89:22
iptables -t nat -A PREROUTING -p tcp --dport 2290 -j DNAT --to-destination 192.168.1.90:22
iptables -t nat -A PREROUTING -p tcp --dport 2291 -j DNAT --to-destination 192.168.1.91:22
iptables -t nat -A PREROUTING -p tcp --dport 2292 -j DNAT --to-destination 192.168.1.92:22
iptables -t nat -A PREROUTING -p tcp --dport 2293 -j DNAT --to-destination 192.168.1.93:22
iptables -t nat -A PREROUTING -p tcp --dport 2294 -j DNAT --to-destination 192.168.1.94:22
iptables -t nat -A PREROUTING -p tcp --dport 2295 -j DNAT --to-destination 192.168.1.95:22
iptables -t nat -A PREROUTING -p tcp --dport 2296 -j DNAT --to-destination 192.168.1.96:22
iptables -t nat -A PREROUTING -p tcp --dport 2297 -j DNAT --to-destination 192.168.1.97:22
iptables -t nat -A PREROUTING -p tcp --dport 2298 -j DNAT --to-destination 192.168.1.98:22
iptables -t nat -A PREROUTING -p tcp --dport 2299 -j DNAT --to-destination 192.168.1.99:22

# HTTP
iptables -t nat -A PREROUTING -p tcp --dport 8010 -j DNAT --to-destination 192.168.1.10:80
iptables -t nat -A PREROUTING -p tcp --dport 8011 -j DNAT --to-destination 192.168.1.11:80
iptables -t nat -A PREROUTING -p tcp --dport 8012 -j DNAT --to-destination 192.168.1.12:80
iptables -t nat -A PREROUTING -p tcp --dport 8013 -j DNAT --to-destination 192.168.1.13:80
iptables -t nat -A PREROUTING -p tcp --dport 8014 -j DNAT --to-destination 192.168.1.14:80
iptables -t nat -A PREROUTING -p tcp --dport 8015 -j DNAT --to-destination 192.168.1.15:80
iptables -t nat -A PREROUTING -p tcp --dport 8016 -j DNAT --to-destination 192.168.1.16:80
iptables -t nat -A PREROUTING -p tcp --dport 8017 -j DNAT --to-destination 192.168.1.17:80
iptables -t nat -A PREROUTING -p tcp --dport 8018 -j DNAT --to-destination 192.168.1.18:80
iptables -t nat -A PREROUTING -p tcp --dport 8019 -j DNAT --to-destination 192.168.1.19:80
iptables -t nat -A PREROUTING -p tcp --dport 8020 -j DNAT --to-destination 192.168.1.20:80
iptables -t nat -A PREROUTING -p tcp --dport 8021 -j DNAT --to-destination 192.168.1.21:80
iptables -t nat -A PREROUTING -p tcp --dport 8022 -j DNAT --to-destination 192.168.1.22:80
iptables -t nat -A PREROUTING -p tcp --dport 8023 -j DNAT --to-destination 192.168.1.23:80
iptables -t nat -A PREROUTING -p tcp --dport 8024 -j DNAT --to-destination 192.168.1.24:80
iptables -t nat -A PREROUTING -p tcp --dport 8025 -j DNAT --to-destination 192.168.1.25:80
iptables -t nat -A PREROUTING -p tcp --dport 8026 -j DNAT --to-destination 192.168.1.26:80
iptables -t nat -A PREROUTING -p tcp --dport 8027 -j DNAT --to-destination 192.168.1.27:80
iptables -t nat -A PREROUTING -p tcp --dport 8028 -j DNAT --to-destination 192.168.1.28:80
iptables -t nat -A PREROUTING -p tcp --dport 8029 -j DNAT --to-destination 192.168.1.29:80
iptables -t nat -A PREROUTING -p tcp --dport 8030 -j DNAT --to-destination 192.168.1.30:80
iptables -t nat -A PREROUTING -p tcp --dport 8031 -j DNAT --to-destination 192.168.1.31:80
iptables -t nat -A PREROUTING -p tcp --dport 8032 -j DNAT --to-destination 192.168.1.32:80
iptables -t nat -A PREROUTING -p tcp --dport 8033 -j DNAT --to-destination 192.168.1.33:80
iptables -t nat -A PREROUTING -p tcp --dport 8034 -j DNAT --to-destination 192.168.1.34:80
iptables -t nat -A PREROUTING -p tcp --dport 8035 -j DNAT --to-destination 192.168.1.35:80
iptables -t nat -A PREROUTING -p tcp --dport 8036 -j DNAT --to-destination 192.168.1.36:80
iptables -t nat -A PREROUTING -p tcp --dport 8037 -j DNAT --to-destination 192.168.1.37:80
iptables -t nat -A PREROUTING -p tcp --dport 8038 -j DNAT --to-destination 192.168.1.38:80
iptables -t nat -A PREROUTING -p tcp --dport 8039 -j DNAT --to-destination 192.168.1.39:80
iptables -t nat -A PREROUTING -p tcp --dport 8040 -j DNAT --to-destination 192.168.1.40:80
iptables -t nat -A PREROUTING -p tcp --dport 8041 -j DNAT --to-destination 192.168.1.41:80
iptables -t nat -A PREROUTING -p tcp --dport 8042 -j DNAT --to-destination 192.168.1.42:80
iptables -t nat -A PREROUTING -p tcp --dport 8043 -j DNAT --to-destination 192.168.1.43:80
iptables -t nat -A PREROUTING -p tcp --dport 8044 -j DNAT --to-destination 192.168.1.44:80
iptables -t nat -A PREROUTING -p tcp --dport 8045 -j DNAT --to-destination 192.168.1.45:80
iptables -t nat -A PREROUTING -p tcp --dport 8046 -j DNAT --to-destination 192.168.1.46:80
iptables -t nat -A PREROUTING -p tcp --dport 8047 -j DNAT --to-destination 192.168.1.47:80
iptables -t nat -A PREROUTING -p tcp --dport 8048 -j DNAT --to-destination 192.168.1.48:80
iptables -t nat -A PREROUTING -p tcp --dport 8049 -j DNAT --to-destination 192.168.1.49:80
iptables -t nat -A PREROUTING -p tcp --dport 8050 -j DNAT --to-destination 192.168.1.50:80
iptables -t nat -A PREROUTING -p tcp --dport 8051 -j DNAT --to-destination 192.168.1.51:80
iptables -t nat -A PREROUTING -p tcp --dport 8052 -j DNAT --to-destination 192.168.1.52:80
iptables -t nat -A PREROUTING -p tcp --dport 8053 -j DNAT --to-destination 192.168.1.53:80
iptables -t nat -A PREROUTING -p tcp --dport 8054 -j DNAT --to-destination 192.168.1.54:80
iptables -t nat -A PREROUTING -p tcp --dport 8055 -j DNAT --to-destination 192.168.1.55:80
iptables -t nat -A PREROUTING -p tcp --dport 8056 -j DNAT --to-destination 192.168.1.56:80
iptables -t nat -A PREROUTING -p tcp --dport 8057 -j DNAT --to-destination 192.168.1.57:80
iptables -t nat -A PREROUTING -p tcp --dport 8058 -j DNAT --to-destination 192.168.1.58:80
iptables -t nat -A PREROUTING -p tcp --dport 8059 -j DNAT --to-destination 192.168.1.59:80
iptables -t nat -A PREROUTING -p tcp --dport 8060 -j DNAT --to-destination 192.168.1.60:80
iptables -t nat -A PREROUTING -p tcp --dport 8061 -j DNAT --to-destination 192.168.1.61:80
iptables -t nat -A PREROUTING -p tcp --dport 8062 -j DNAT --to-destination 192.168.1.62:80
iptables -t nat -A PREROUTING -p tcp --dport 8063 -j DNAT --to-destination 192.168.1.63:80
iptables -t nat -A PREROUTING -p tcp --dport 8064 -j DNAT --to-destination 192.168.1.64:80
iptables -t nat -A PREROUTING -p tcp --dport 8065 -j DNAT --to-destination 192.168.1.65:80
iptables -t nat -A PREROUTING -p tcp --dport 8066 -j DNAT --to-destination 192.168.1.66:80
iptables -t nat -A PREROUTING -p tcp --dport 8067 -j DNAT --to-destination 192.168.1.67:80
iptables -t nat -A PREROUTING -p tcp --dport 8068 -j DNAT --to-destination 192.168.1.68:80
iptables -t nat -A PREROUTING -p tcp --dport 8069 -j DNAT --to-destination 192.168.1.69:80
iptables -t nat -A PREROUTING -p tcp --dport 8070 -j DNAT --to-destination 192.168.1.70:80
iptables -t nat -A PREROUTING -p tcp --dport 8071 -j DNAT --to-destination 192.168.1.71:80
iptables -t nat -A PREROUTING -p tcp --dport 8072 -j DNAT --to-destination 192.168.1.72:80
iptables -t nat -A PREROUTING -p tcp --dport 8073 -j DNAT --to-destination 192.168.1.73:80
iptables -t nat -A PREROUTING -p tcp --dport 8074 -j DNAT --to-destination 192.168.1.74:80
iptables -t nat -A PREROUTING -p tcp --dport 8075 -j DNAT --to-destination 192.168.1.75:80
iptables -t nat -A PREROUTING -p tcp --dport 8076 -j DNAT --to-destination 192.168.1.76:80
iptables -t nat -A PREROUTING -p tcp --dport 8077 -j DNAT --to-destination 192.168.1.77:80
iptables -t nat -A PREROUTING -p tcp --dport 8078 -j DNAT --to-destination 192.168.1.78:80
iptables -t nat -A PREROUTING -p tcp --dport 8079 -j DNAT --to-destination 192.168.1.79:80
iptables -t nat -A PREROUTING -p tcp --dport 8080 -j DNAT --to-destination 192.168.1.80:80
iptables -t nat -A PREROUTING -p tcp --dport 8081 -j DNAT --to-destination 192.168.1.81:80
iptables -t nat -A PREROUTING -p tcp --dport 8082 -j DNAT --to-destination 192.168.1.82:80
iptables -t nat -A PREROUTING -p tcp --dport 8083 -j DNAT --to-destination 192.168.1.83:80
iptables -t nat -A PREROUTING -p tcp --dport 8084 -j DNAT --to-destination 192.168.1.84:80
iptables -t nat -A PREROUTING -p tcp --dport 8085 -j DNAT --to-destination 192.168.1.85:80
iptables -t nat -A PREROUTING -p tcp --dport 8086 -j DNAT --to-destination 192.168.1.86:80
iptables -t nat -A PREROUTING -p tcp --dport 8087 -j DNAT --to-destination 192.168.1.87:80
iptables -t nat -A PREROUTING -p tcp --dport 8088 -j DNAT --to-destination 192.168.1.88:80
iptables -t nat -A PREROUTING -p tcp --dport 8089 -j DNAT --to-destination 192.168.1.89:80
iptables -t nat -A PREROUTING -p tcp --dport 8090 -j DNAT --to-destination 192.168.1.90:80
iptables -t nat -A PREROUTING -p tcp --dport 8091 -j DNAT --to-destination 192.168.1.91:80
iptables -t nat -A PREROUTING -p tcp --dport 8092 -j DNAT --to-destination 192.168.1.92:80
iptables -t nat -A PREROUTING -p tcp --dport 8093 -j DNAT --to-destination 192.168.1.93:80
iptables -t nat -A PREROUTING -p tcp --dport 8094 -j DNAT --to-destination 192.168.1.94:80
iptables -t nat -A PREROUTING -p tcp --dport 8095 -j DNAT --to-destination 192.168.1.95:80
iptables -t nat -A PREROUTING -p tcp --dport 8096 -j DNAT --to-destination 192.168.1.96:80
iptables -t nat -A PREROUTING -p tcp --dport 8097 -j DNAT --to-destination 192.168.1.97:80
iptables -t nat -A PREROUTING -p tcp --dport 8098 -j DNAT --to-destination 192.168.1.98:80
iptables -t nat -A PREROUTING -p tcp --dport 8099 -j DNAT --to-destination 192.168.1.99:80

# HTTPS
iptables -t nat -A PREROUTING -p tcp --dport 44310 -j DNAT --to-destination 192.168.1.10:443
iptables -t nat -A PREROUTING -p tcp --dport 44311 -j DNAT --to-destination 192.168.1.11:443
iptables -t nat -A PREROUTING -p tcp --dport 44312 -j DNAT --to-destination 192.168.1.12:443
iptables -t nat -A PREROUTING -p tcp --dport 44313 -j DNAT --to-destination 192.168.1.13:443
iptables -t nat -A PREROUTING -p tcp --dport 44314 -j DNAT --to-destination 192.168.1.14:443
iptables -t nat -A PREROUTING -p tcp --dport 44315 -j DNAT --to-destination 192.168.1.15:443
iptables -t nat -A PREROUTING -p tcp --dport 44316 -j DNAT --to-destination 192.168.1.16:443
iptables -t nat -A PREROUTING -p tcp --dport 44317 -j DNAT --to-destination 192.168.1.17:443
iptables -t nat -A PREROUTING -p tcp --dport 44318 -j DNAT --to-destination 192.168.1.18:443
iptables -t nat -A PREROUTING -p tcp --dport 44319 -j DNAT --to-destination 192.168.1.19:443
iptables -t nat -A PREROUTING -p tcp --dport 44320 -j DNAT --to-destination 192.168.1.20:443
iptables -t nat -A PREROUTING -p tcp --dport 44321 -j DNAT --to-destination 192.168.1.21:443
iptables -t nat -A PREROUTING -p tcp --dport 44322 -j DNAT --to-destination 192.168.1.22:443
iptables -t nat -A PREROUTING -p tcp --dport 44323 -j DNAT --to-destination 192.168.1.23:443
iptables -t nat -A PREROUTING -p tcp --dport 44324 -j DNAT --to-destination 192.168.1.24:443
iptables -t nat -A PREROUTING -p tcp --dport 44325 -j DNAT --to-destination 192.168.1.25:443
iptables -t nat -A PREROUTING -p tcp --dport 44326 -j DNAT --to-destination 192.168.1.26:443
iptables -t nat -A PREROUTING -p tcp --dport 44327 -j DNAT --to-destination 192.168.1.27:443
iptables -t nat -A PREROUTING -p tcp --dport 44328 -j DNAT --to-destination 192.168.1.28:443
iptables -t nat -A PREROUTING -p tcp --dport 44329 -j DNAT --to-destination 192.168.1.29:443
iptables -t nat -A PREROUTING -p tcp --dport 44330 -j DNAT --to-destination 192.168.1.30:443
iptables -t nat -A PREROUTING -p tcp --dport 44331 -j DNAT --to-destination 192.168.1.31:443
iptables -t nat -A PREROUTING -p tcp --dport 44332 -j DNAT --to-destination 192.168.1.32:443
iptables -t nat -A PREROUTING -p tcp --dport 44333 -j DNAT --to-destination 192.168.1.33:443
iptables -t nat -A PREROUTING -p tcp --dport 44334 -j DNAT --to-destination 192.168.1.34:443
iptables -t nat -A PREROUTING -p tcp --dport 44335 -j DNAT --to-destination 192.168.1.35:443
iptables -t nat -A PREROUTING -p tcp --dport 44336 -j DNAT --to-destination 192.168.1.36:443
iptables -t nat -A PREROUTING -p tcp --dport 44337 -j DNAT --to-destination 192.168.1.37:443
iptables -t nat -A PREROUTING -p tcp --dport 44338 -j DNAT --to-destination 192.168.1.38:443
iptables -t nat -A PREROUTING -p tcp --dport 44339 -j DNAT --to-destination 192.168.1.39:443
iptables -t nat -A PREROUTING -p tcp --dport 44340 -j DNAT --to-destination 192.168.1.40:443
iptables -t nat -A PREROUTING -p tcp --dport 44341 -j DNAT --to-destination 192.168.1.41:443
iptables -t nat -A PREROUTING -p tcp --dport 44342 -j DNAT --to-destination 192.168.1.42:443
iptables -t nat -A PREROUTING -p tcp --dport 44343 -j DNAT --to-destination 192.168.1.43:443
iptables -t nat -A PREROUTING -p tcp --dport 44344 -j DNAT --to-destination 192.168.1.44:443
iptables -t nat -A PREROUTING -p tcp --dport 44345 -j DNAT --to-destination 192.168.1.45:443
iptables -t nat -A PREROUTING -p tcp --dport 44346 -j DNAT --to-destination 192.168.1.46:443
iptables -t nat -A PREROUTING -p tcp --dport 44347 -j DNAT --to-destination 192.168.1.47:443
iptables -t nat -A PREROUTING -p tcp --dport 44348 -j DNAT --to-destination 192.168.1.48:443
iptables -t nat -A PREROUTING -p tcp --dport 44349 -j DNAT --to-destination 192.168.1.49:443
iptables -t nat -A PREROUTING -p tcp --dport 44350 -j DNAT --to-destination 192.168.1.50:443
iptables -t nat -A PREROUTING -p tcp --dport 44351 -j DNAT --to-destination 192.168.1.51:443
iptables -t nat -A PREROUTING -p tcp --dport 44352 -j DNAT --to-destination 192.168.1.52:443
iptables -t nat -A PREROUTING -p tcp --dport 44353 -j DNAT --to-destination 192.168.1.53:443
iptables -t nat -A PREROUTING -p tcp --dport 44354 -j DNAT --to-destination 192.168.1.54:443
iptables -t nat -A PREROUTING -p tcp --dport 44355 -j DNAT --to-destination 192.168.1.55:443
iptables -t nat -A PREROUTING -p tcp --dport 44356 -j DNAT --to-destination 192.168.1.56:443
iptables -t nat -A PREROUTING -p tcp --dport 44357 -j DNAT --to-destination 192.168.1.57:443
iptables -t nat -A PREROUTING -p tcp --dport 44358 -j DNAT --to-destination 192.168.1.58:443
iptables -t nat -A PREROUTING -p tcp --dport 44359 -j DNAT --to-destination 192.168.1.59:443
iptables -t nat -A PREROUTING -p tcp --dport 44360 -j DNAT --to-destination 192.168.1.60:443
iptables -t nat -A PREROUTING -p tcp --dport 44361 -j DNAT --to-destination 192.168.1.61:443
iptables -t nat -A PREROUTING -p tcp --dport 44362 -j DNAT --to-destination 192.168.1.62:443
iptables -t nat -A PREROUTING -p tcp --dport 44363 -j DNAT --to-destination 192.168.1.63:443
iptables -t nat -A PREROUTING -p tcp --dport 44364 -j DNAT --to-destination 192.168.1.64:443
iptables -t nat -A PREROUTING -p tcp --dport 44365 -j DNAT --to-destination 192.168.1.65:443
iptables -t nat -A PREROUTING -p tcp --dport 44366 -j DNAT --to-destination 192.168.1.66:443
iptables -t nat -A PREROUTING -p tcp --dport 44367 -j DNAT --to-destination 192.168.1.67:443
iptables -t nat -A PREROUTING -p tcp --dport 44368 -j DNAT --to-destination 192.168.1.68:443
iptables -t nat -A PREROUTING -p tcp --dport 44369 -j DNAT --to-destination 192.168.1.69:443
iptables -t nat -A PREROUTING -p tcp --dport 44370 -j DNAT --to-destination 192.168.1.70:443
iptables -t nat -A PREROUTING -p tcp --dport 44371 -j DNAT --to-destination 192.168.1.71:443
iptables -t nat -A PREROUTING -p tcp --dport 44372 -j DNAT --to-destination 192.168.1.72:443
iptables -t nat -A PREROUTING -p tcp --dport 44373 -j DNAT --to-destination 192.168.1.73:443
iptables -t nat -A PREROUTING -p tcp --dport 44374 -j DNAT --to-destination 192.168.1.74:443
iptables -t nat -A PREROUTING -p tcp --dport 44375 -j DNAT --to-destination 192.168.1.75:443
iptables -t nat -A PREROUTING -p tcp --dport 44376 -j DNAT --to-destination 192.168.1.76:443
iptables -t nat -A PREROUTING -p tcp --dport 44377 -j DNAT --to-destination 192.168.1.77:443
iptables -t nat -A PREROUTING -p tcp --dport 44378 -j DNAT --to-destination 192.168.1.78:443
iptables -t nat -A PREROUTING -p tcp --dport 44379 -j DNAT --to-destination 192.168.1.79:443
iptables -t nat -A PREROUTING -p tcp --dport 44380 -j DNAT --to-destination 192.168.1.80:443
iptables -t nat -A PREROUTING -p tcp --dport 44381 -j DNAT --to-destination 192.168.1.81:443
iptables -t nat -A PREROUTING -p tcp --dport 44382 -j DNAT --to-destination 192.168.1.82:443
iptables -t nat -A PREROUTING -p tcp --dport 44383 -j DNAT --to-destination 192.168.1.83:443
iptables -t nat -A PREROUTING -p tcp --dport 44384 -j DNAT --to-destination 192.168.1.84:443
iptables -t nat -A PREROUTING -p tcp --dport 44385 -j DNAT --to-destination 192.168.1.85:443
iptables -t nat -A PREROUTING -p tcp --dport 44386 -j DNAT --to-destination 192.168.1.86:443
iptables -t nat -A PREROUTING -p tcp --dport 44387 -j DNAT --to-destination 192.168.1.87:443
iptables -t nat -A PREROUTING -p tcp --dport 44388 -j DNAT --to-destination 192.168.1.88:443
iptables -t nat -A PREROUTING -p tcp --dport 44389 -j DNAT --to-destination 192.168.1.89:443
iptables -t nat -A PREROUTING -p tcp --dport 44390 -j DNAT --to-destination 192.168.1.90:443
iptables -t nat -A PREROUTING -p tcp --dport 44391 -j DNAT --to-destination 192.168.1.91:443
iptables -t nat -A PREROUTING -p tcp --dport 44392 -j DNAT --to-destination 192.168.1.92:443
iptables -t nat -A PREROUTING -p tcp --dport 44393 -j DNAT --to-destination 192.168.1.93:443
iptables -t nat -A PREROUTING -p tcp --dport 44394 -j DNAT --to-destination 192.168.1.94:443
iptables -t nat -A PREROUTING -p tcp --dport 44395 -j DNAT --to-destination 192.168.1.95:443
iptables -t nat -A PREROUTING -p tcp --dport 44396 -j DNAT --to-destination 192.168.1.96:443
iptables -t nat -A PREROUTING -p tcp --dport 44397 -j DNAT --to-destination 192.168.1.97:443
iptables -t nat -A PREROUTING -p tcp --dport 44398 -j DNAT --to-destination 192.168.1.98:443
iptables -t nat -A PREROUTING -p tcp --dport 44399 -j DNAT --to-destination 192.168.1.99:443

# MySQL
iptables -t nat -A PREROUTING -p tcp --dport 33010 -j DNAT --to-destination 192.168.1.10:3306
iptables -t nat -A PREROUTING -p tcp --dport 33011 -j DNAT --to-destination 192.168.1.11:3306
iptables -t nat -A PREROUTING -p tcp --dport 33012 -j DNAT --to-destination 192.168.1.12:3306
iptables -t nat -A PREROUTING -p tcp --dport 33013 -j DNAT --to-destination 192.168.1.13:3306
iptables -t nat -A PREROUTING -p tcp --dport 33014 -j DNAT --to-destination 192.168.1.14:3306
iptables -t nat -A PREROUTING -p tcp --dport 33015 -j DNAT --to-destination 192.168.1.15:3306
iptables -t nat -A PREROUTING -p tcp --dport 33016 -j DNAT --to-destination 192.168.1.16:3306
iptables -t nat -A PREROUTING -p tcp --dport 33017 -j DNAT --to-destination 192.168.1.17:3306
iptables -t nat -A PREROUTING -p tcp --dport 33018 -j DNAT --to-destination 192.168.1.18:3306
iptables -t nat -A PREROUTING -p tcp --dport 33019 -j DNAT --to-destination 192.168.1.19:3306
iptables -t nat -A PREROUTING -p tcp --dport 33020 -j DNAT --to-destination 192.168.1.20:3306
iptables -t nat -A PREROUTING -p tcp --dport 33021 -j DNAT --to-destination 192.168.1.21:3306
iptables -t nat -A PREROUTING -p tcp --dport 33022 -j DNAT --to-destination 192.168.1.22:3306
iptables -t nat -A PREROUTING -p tcp --dport 33023 -j DNAT --to-destination 192.168.1.23:3306
iptables -t nat -A PREROUTING -p tcp --dport 33024 -j DNAT --to-destination 192.168.1.24:3306
iptables -t nat -A PREROUTING -p tcp --dport 33025 -j DNAT --to-destination 192.168.1.25:3306
iptables -t nat -A PREROUTING -p tcp --dport 33026 -j DNAT --to-destination 192.168.1.26:3306
iptables -t nat -A PREROUTING -p tcp --dport 33027 -j DNAT --to-destination 192.168.1.27:3306
iptables -t nat -A PREROUTING -p tcp --dport 33028 -j DNAT --to-destination 192.168.1.28:3306
iptables -t nat -A PREROUTING -p tcp --dport 33029 -j DNAT --to-destination 192.168.1.29:3306
iptables -t nat -A PREROUTING -p tcp --dport 33030 -j DNAT --to-destination 192.168.1.30:3306
iptables -t nat -A PREROUTING -p tcp --dport 33031 -j DNAT --to-destination 192.168.1.31:3306
iptables -t nat -A PREROUTING -p tcp --dport 33032 -j DNAT --to-destination 192.168.1.32:3306
iptables -t nat -A PREROUTING -p tcp --dport 33033 -j DNAT --to-destination 192.168.1.33:3306
iptables -t nat -A PREROUTING -p tcp --dport 33034 -j DNAT --to-destination 192.168.1.34:3306
iptables -t nat -A PREROUTING -p tcp --dport 33035 -j DNAT --to-destination 192.168.1.35:3306
iptables -t nat -A PREROUTING -p tcp --dport 33036 -j DNAT --to-destination 192.168.1.36:3306
iptables -t nat -A PREROUTING -p tcp --dport 33037 -j DNAT --to-destination 192.168.1.37:3306
iptables -t nat -A PREROUTING -p tcp --dport 33038 -j DNAT --to-destination 192.168.1.38:3306
iptables -t nat -A PREROUTING -p tcp --dport 33039 -j DNAT --to-destination 192.168.1.39:3306
iptables -t nat -A PREROUTING -p tcp --dport 33040 -j DNAT --to-destination 192.168.1.40:3306
iptables -t nat -A PREROUTING -p tcp --dport 33041 -j DNAT --to-destination 192.168.1.41:3306
iptables -t nat -A PREROUTING -p tcp --dport 33042 -j DNAT --to-destination 192.168.1.42:3306
iptables -t nat -A PREROUTING -p tcp --dport 33043 -j DNAT --to-destination 192.168.1.43:3306
iptables -t nat -A PREROUTING -p tcp --dport 33044 -j DNAT --to-destination 192.168.1.44:3306
iptables -t nat -A PREROUTING -p tcp --dport 33045 -j DNAT --to-destination 192.168.1.45:3306
iptables -t nat -A PREROUTING -p tcp --dport 33046 -j DNAT --to-destination 192.168.1.46:3306
iptables -t nat -A PREROUTING -p tcp --dport 33047 -j DNAT --to-destination 192.168.1.47:3306
iptables -t nat -A PREROUTING -p tcp --dport 33048 -j DNAT --to-destination 192.168.1.48:3306
iptables -t nat -A PREROUTING -p tcp --dport 33049 -j DNAT --to-destination 192.168.1.49:3306
iptables -t nat -A PREROUTING -p tcp --dport 33050 -j DNAT --to-destination 192.168.1.50:3306
iptables -t nat -A PREROUTING -p tcp --dport 33051 -j DNAT --to-destination 192.168.1.51:3306
iptables -t nat -A PREROUTING -p tcp --dport 33052 -j DNAT --to-destination 192.168.1.52:3306
iptables -t nat -A PREROUTING -p tcp --dport 33053 -j DNAT --to-destination 192.168.1.53:3306
iptables -t nat -A PREROUTING -p tcp --dport 33054 -j DNAT --to-destination 192.168.1.54:3306
iptables -t nat -A PREROUTING -p tcp --dport 33055 -j DNAT --to-destination 192.168.1.55:3306
iptables -t nat -A PREROUTING -p tcp --dport 33056 -j DNAT --to-destination 192.168.1.56:3306
iptables -t nat -A PREROUTING -p tcp --dport 33057 -j DNAT --to-destination 192.168.1.57:3306
iptables -t nat -A PREROUTING -p tcp --dport 33058 -j DNAT --to-destination 192.168.1.58:3306
iptables -t nat -A PREROUTING -p tcp --dport 33059 -j DNAT --to-destination 192.168.1.59:3306
iptables -t nat -A PREROUTING -p tcp --dport 33060 -j DNAT --to-destination 192.168.1.60:3306
iptables -t nat -A PREROUTING -p tcp --dport 33061 -j DNAT --to-destination 192.168.1.61:3306
iptables -t nat -A PREROUTING -p tcp --dport 33062 -j DNAT --to-destination 192.168.1.62:3306
iptables -t nat -A PREROUTING -p tcp --dport 33063 -j DNAT --to-destination 192.168.1.63:3306
iptables -t nat -A PREROUTING -p tcp --dport 33064 -j DNAT --to-destination 192.168.1.64:3306
iptables -t nat -A PREROUTING -p tcp --dport 33065 -j DNAT --to-destination 192.168.1.65:3306
iptables -t nat -A PREROUTING -p tcp --dport 33066 -j DNAT --to-destination 192.168.1.66:3306
iptables -t nat -A PREROUTING -p tcp --dport 33067 -j DNAT --to-destination 192.168.1.67:3306
iptables -t nat -A PREROUTING -p tcp --dport 33068 -j DNAT --to-destination 192.168.1.68:3306
iptables -t nat -A PREROUTING -p tcp --dport 33069 -j DNAT --to-destination 192.168.1.69:3306
iptables -t nat -A PREROUTING -p tcp --dport 33070 -j DNAT --to-destination 192.168.1.70:3306
iptables -t nat -A PREROUTING -p tcp --dport 33071 -j DNAT --to-destination 192.168.1.71:3306
iptables -t nat -A PREROUTING -p tcp --dport 33072 -j DNAT --to-destination 192.168.1.72:3306
iptables -t nat -A PREROUTING -p tcp --dport 33073 -j DNAT --to-destination 192.168.1.73:3306
iptables -t nat -A PREROUTING -p tcp --dport 33074 -j DNAT --to-destination 192.168.1.74:3306
iptables -t nat -A PREROUTING -p tcp --dport 33075 -j DNAT --to-destination 192.168.1.75:3306
iptables -t nat -A PREROUTING -p tcp --dport 33076 -j DNAT --to-destination 192.168.1.76:3306
iptables -t nat -A PREROUTING -p tcp --dport 33077 -j DNAT --to-destination 192.168.1.77:3306
iptables -t nat -A PREROUTING -p tcp --dport 33078 -j DNAT --to-destination 192.168.1.78:3306
iptables -t nat -A PREROUTING -p tcp --dport 33079 -j DNAT --to-destination 192.168.1.79:3306
iptables -t nat -A PREROUTING -p tcp --dport 33080 -j DNAT --to-destination 192.168.1.80:3306
iptables -t nat -A PREROUTING -p tcp --dport 33081 -j DNAT --to-destination 192.168.1.81:3306
iptables -t nat -A PREROUTING -p tcp --dport 33082 -j DNAT --to-destination 192.168.1.82:3306
iptables -t nat -A PREROUTING -p tcp --dport 33083 -j DNAT --to-destination 192.168.1.83:3306
iptables -t nat -A PREROUTING -p tcp --dport 33084 -j DNAT --to-destination 192.168.1.84:3306
iptables -t nat -A PREROUTING -p tcp --dport 33085 -j DNAT --to-destination 192.168.1.85:3306
iptables -t nat -A PREROUTING -p tcp --dport 33086 -j DNAT --to-destination 192.168.1.86:3306
iptables -t nat -A PREROUTING -p tcp --dport 33087 -j DNAT --to-destination 192.168.1.87:3306
iptables -t nat -A PREROUTING -p tcp --dport 33088 -j DNAT --to-destination 192.168.1.88:3306
iptables -t nat -A PREROUTING -p tcp --dport 33089 -j DNAT --to-destination 192.168.1.89:3306
iptables -t nat -A PREROUTING -p tcp --dport 33090 -j DNAT --to-destination 192.168.1.90:3306
iptables -t nat -A PREROUTING -p tcp --dport 33091 -j DNAT --to-destination 192.168.1.91:3306
iptables -t nat -A PREROUTING -p tcp --dport 33092 -j DNAT --to-destination 192.168.1.92:3306
iptables -t nat -A PREROUTING -p tcp --dport 33093 -j DNAT --to-destination 192.168.1.93:3306
iptables -t nat -A PREROUTING -p tcp --dport 33094 -j DNAT --to-destination 192.168.1.94:3306
iptables -t nat -A PREROUTING -p tcp --dport 33095 -j DNAT --to-destination 192.168.1.95:3306
iptables -t nat -A PREROUTING -p tcp --dport 33096 -j DNAT --to-destination 192.168.1.96:3306
iptables -t nat -A PREROUTING -p tcp --dport 33097 -j DNAT --to-destination 192.168.1.97:3306
iptables -t nat -A PREROUTING -p tcp --dport 33098 -j DNAT --to-destination 192.168.1.98:3306
iptables -t nat -A PREROUTING -p tcp --dport 33099 -j DNAT --to-destination 192.168.1.99:3306


# PostgreSQL
iptables -t nat -A PREROUTING -p tcp --dport 54310 -j DNAT --to-destination 192.168.1.10:5432
iptables -t nat -A PREROUTING -p tcp --dport 54311 -j DNAT --to-destination 192.168.1.11:5432
iptables -t nat -A PREROUTING -p tcp --dport 54312 -j DNAT --to-destination 192.168.1.12:5432
iptables -t nat -A PREROUTING -p tcp --dport 54313 -j DNAT --to-destination 192.168.1.13:5432
iptables -t nat -A PREROUTING -p tcp --dport 54314 -j DNAT --to-destination 192.168.1.14:5432
iptables -t nat -A PREROUTING -p tcp --dport 54315 -j DNAT --to-destination 192.168.1.15:5432
iptables -t nat -A PREROUTING -p tcp --dport 54316 -j DNAT --to-destination 192.168.1.16:5432
iptables -t nat -A PREROUTING -p tcp --dport 54317 -j DNAT --to-destination 192.168.1.17:5432
iptables -t nat -A PREROUTING -p tcp --dport 54318 -j DNAT --to-destination 192.168.1.18:5432
iptables -t nat -A PREROUTING -p tcp --dport 54319 -j DNAT --to-destination 192.168.1.19:5432
iptables -t nat -A PREROUTING -p tcp --dport 54320 -j DNAT --to-destination 192.168.1.20:5432
iptables -t nat -A PREROUTING -p tcp --dport 54321 -j DNAT --to-destination 192.168.1.21:5432
iptables -t nat -A PREROUTING -p tcp --dport 54322 -j DNAT --to-destination 192.168.1.22:5432
iptables -t nat -A PREROUTING -p tcp --dport 54323 -j DNAT --to-destination 192.168.1.23:5432
iptables -t nat -A PREROUTING -p tcp --dport 54324 -j DNAT --to-destination 192.168.1.24:5432
iptables -t nat -A PREROUTING -p tcp --dport 54325 -j DNAT --to-destination 192.168.1.25:5432
iptables -t nat -A PREROUTING -p tcp --dport 54326 -j DNAT --to-destination 192.168.1.26:5432
iptables -t nat -A PREROUTING -p tcp --dport 54327 -j DNAT --to-destination 192.168.1.27:5432
iptables -t nat -A PREROUTING -p tcp --dport 54328 -j DNAT --to-destination 192.168.1.28:5432
iptables -t nat -A PREROUTING -p tcp --dport 54329 -j DNAT --to-destination 192.168.1.29:5432
iptables -t nat -A PREROUTING -p tcp --dport 54330 -j DNAT --to-destination 192.168.1.30:5432
iptables -t nat -A PREROUTING -p tcp --dport 54331 -j DNAT --to-destination 192.168.1.31:5432
iptables -t nat -A PREROUTING -p tcp --dport 54332 -j DNAT --to-destination 192.168.1.32:5432
iptables -t nat -A PREROUTING -p tcp --dport 54333 -j DNAT --to-destination 192.168.1.33:5432
iptables -t nat -A PREROUTING -p tcp --dport 54334 -j DNAT --to-destination 192.168.1.34:5432
iptables -t nat -A PREROUTING -p tcp --dport 54335 -j DNAT --to-destination 192.168.1.35:5432
iptables -t nat -A PREROUTING -p tcp --dport 54336 -j DNAT --to-destination 192.168.1.36:5432
iptables -t nat -A PREROUTING -p tcp --dport 54337 -j DNAT --to-destination 192.168.1.37:5432
iptables -t nat -A PREROUTING -p tcp --dport 54338 -j DNAT --to-destination 192.168.1.38:5432
iptables -t nat -A PREROUTING -p tcp --dport 54339 -j DNAT --to-destination 192.168.1.39:5432
iptables -t nat -A PREROUTING -p tcp --dport 54340 -j DNAT --to-destination 192.168.1.40:5432
iptables -t nat -A PREROUTING -p tcp --dport 54341 -j DNAT --to-destination 192.168.1.41:5432
iptables -t nat -A PREROUTING -p tcp --dport 54342 -j DNAT --to-destination 192.168.1.42:5432
iptables -t nat -A PREROUTING -p tcp --dport 54343 -j DNAT --to-destination 192.168.1.43:5432
iptables -t nat -A PREROUTING -p tcp --dport 54344 -j DNAT --to-destination 192.168.1.44:5432
iptables -t nat -A PREROUTING -p tcp --dport 54345 -j DNAT --to-destination 192.168.1.45:5432
iptables -t nat -A PREROUTING -p tcp --dport 54346 -j DNAT --to-destination 192.168.1.46:5432
iptables -t nat -A PREROUTING -p tcp --dport 54347 -j DNAT --to-destination 192.168.1.47:5432
iptables -t nat -A PREROUTING -p tcp --dport 54348 -j DNAT --to-destination 192.168.1.48:5432
iptables -t nat -A PREROUTING -p tcp --dport 54349 -j DNAT --to-destination 192.168.1.49:5432
iptables -t nat -A PREROUTING -p tcp --dport 54350 -j DNAT --to-destination 192.168.1.50:5432
iptables -t nat -A PREROUTING -p tcp --dport 54351 -j DNAT --to-destination 192.168.1.51:5432
iptables -t nat -A PREROUTING -p tcp --dport 54352 -j DNAT --to-destination 192.168.1.52:5432
iptables -t nat -A PREROUTING -p tcp --dport 54353 -j DNAT --to-destination 192.168.1.53:5432
iptables -t nat -A PREROUTING -p tcp --dport 54354 -j DNAT --to-destination 192.168.1.54:5432
iptables -t nat -A PREROUTING -p tcp --dport 54355 -j DNAT --to-destination 192.168.1.55:5432
iptables -t nat -A PREROUTING -p tcp --dport 54356 -j DNAT --to-destination 192.168.1.56:5432
iptables -t nat -A PREROUTING -p tcp --dport 54357 -j DNAT --to-destination 192.168.1.57:5432
iptables -t nat -A PREROUTING -p tcp --dport 54358 -j DNAT --to-destination 192.168.1.58:5432
iptables -t nat -A PREROUTING -p tcp --dport 54359 -j DNAT --to-destination 192.168.1.59:5432
iptables -t nat -A PREROUTING -p tcp --dport 54360 -j DNAT --to-destination 192.168.1.60:5432
iptables -t nat -A PREROUTING -p tcp --dport 54361 -j DNAT --to-destination 192.168.1.61:5432
iptables -t nat -A PREROUTING -p tcp --dport 54362 -j DNAT --to-destination 192.168.1.62:5432
iptables -t nat -A PREROUTING -p tcp --dport 54363 -j DNAT --to-destination 192.168.1.63:5432
iptables -t nat -A PREROUTING -p tcp --dport 54364 -j DNAT --to-destination 192.168.1.64:5432
iptables -t nat -A PREROUTING -p tcp --dport 54365 -j DNAT --to-destination 192.168.1.65:5432
iptables -t nat -A PREROUTING -p tcp --dport 54366 -j DNAT --to-destination 192.168.1.66:5432
iptables -t nat -A PREROUTING -p tcp --dport 54367 -j DNAT --to-destination 192.168.1.67:5432
iptables -t nat -A PREROUTING -p tcp --dport 54368 -j DNAT --to-destination 192.168.1.68:5432
iptables -t nat -A PREROUTING -p tcp --dport 54369 -j DNAT --to-destination 192.168.1.69:5432
iptables -t nat -A PREROUTING -p tcp --dport 54370 -j DNAT --to-destination 192.168.1.70:5432
iptables -t nat -A PREROUTING -p tcp --dport 54371 -j DNAT --to-destination 192.168.1.71:5432
iptables -t nat -A PREROUTING -p tcp --dport 54372 -j DNAT --to-destination 192.168.1.72:5432
iptables -t nat -A PREROUTING -p tcp --dport 54373 -j DNAT --to-destination 192.168.1.73:5432
iptables -t nat -A PREROUTING -p tcp --dport 54374 -j DNAT --to-destination 192.168.1.74:5432
iptables -t nat -A PREROUTING -p tcp --dport 54375 -j DNAT --to-destination 192.168.1.75:5432
iptables -t nat -A PREROUTING -p tcp --dport 54376 -j DNAT --to-destination 192.168.1.76:5432
iptables -t nat -A PREROUTING -p tcp --dport 54377 -j DNAT --to-destination 192.168.1.77:5432
iptables -t nat -A PREROUTING -p tcp --dport 54378 -j DNAT --to-destination 192.168.1.78:5432
iptables -t nat -A PREROUTING -p tcp --dport 54379 -j DNAT --to-destination 192.168.1.79:5432
iptables -t nat -A PREROUTING -p tcp --dport 54380 -j DNAT --to-destination 192.168.1.80:5432
iptables -t nat -A PREROUTING -p tcp --dport 54381 -j DNAT --to-destination 192.168.1.81:5432
iptables -t nat -A PREROUTING -p tcp --dport 54382 -j DNAT --to-destination 192.168.1.82:5432
iptables -t nat -A PREROUTING -p tcp --dport 54383 -j DNAT --to-destination 192.168.1.83:5432
iptables -t nat -A PREROUTING -p tcp --dport 54384 -j DNAT --to-destination 192.168.1.84:5432
iptables -t nat -A PREROUTING -p tcp --dport 54385 -j DNAT --to-destination 192.168.1.85:5432
iptables -t nat -A PREROUTING -p tcp --dport 54386 -j DNAT --to-destination 192.168.1.86:5432
iptables -t nat -A PREROUTING -p tcp --dport 54387 -j DNAT --to-destination 192.168.1.87:5432
iptables -t nat -A PREROUTING -p tcp --dport 54388 -j DNAT --to-destination 192.168.1.88:5432
iptables -t nat -A PREROUTING -p tcp --dport 54389 -j DNAT --to-destination 192.168.1.89:5432
iptables -t nat -A PREROUTING -p tcp --dport 54390 -j DNAT --to-destination 192.168.1.90:5432
iptables -t nat -A PREROUTING -p tcp --dport 54391 -j DNAT --to-destination 192.168.1.91:5432
iptables -t nat -A PREROUTING -p tcp --dport 54392 -j DNAT --to-destination 192.168.1.92:5432
iptables -t nat -A PREROUTING -p tcp --dport 54393 -j DNAT --to-destination 192.168.1.93:5432
iptables -t nat -A PREROUTING -p tcp --dport 54394 -j DNAT --to-destination 192.168.1.94:5432
iptables -t nat -A PREROUTING -p tcp --dport 54395 -j DNAT --to-destination 192.168.1.95:5432
iptables -t nat -A PREROUTING -p tcp --dport 54396 -j DNAT --to-destination 192.168.1.96:5432
iptables -t nat -A PREROUTING -p tcp --dport 54397 -j DNAT --to-destination 192.168.1.97:5432
iptables -t nat -A PREROUTING -p tcp --dport 54398 -j DNAT --to-destination 192.168.1.98:5432
iptables -t nat -A PREROUTING -p tcp --dport 54399 -j DNAT --to-destination 192.168.1.99:5432



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


