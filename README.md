# iptv-udp-scanner

Docker image of an UDP scanner which can be used to search for IPTV multicast.

docker build -f Dockerfile -t iptvudpscanner .

## Using IPTV bridged from router to separate PC network interface

in another shell run pipework
sudo ./pipework --direct-phys enp3s0 CONTAINERID 10.16.203.210/26@10.16.203.254

Connecting via pipework using DHCP is not working. Static as mentioned above works.

1. Set same IP adress in iterative_join.py

2. In container check network interface name using ifconfig
   then edit INTERFACE = "eth0" in log_active_groups.py accordingly

## Using IPTV routed from VLAN to normal LAN using IGMP proxy

Just run container in host/macvlan mode
Set same IP adress as host or macvlan assigned IP address in iterative_join.py

1. In container check network interface name using ifconfig
2. then edit INTERFACE = "eth0" in log_active_groups.py accordingly

## Listening

You can also configure
PER_GROUP_LISTEN_TIME and CONCURRENT_GROUPS
More groups means bigger load onto the ISP

Now you need to start container and create 2 terminal sessions inside it

Start container detached using -d
Exec into container using docker exec -it iptvudpscanner /bin/bash

Screen -S logger
./log_active_groups.py > output.txt
Detach screen (CTRL+A+D)

Screen -S joiner
./iterative_join.py
Detach screen (CTRL+A+D)

You can exit from container and log results
