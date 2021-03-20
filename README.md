# iptv-udp-scanner

Docker image of an UDP scanner which can be used to search for IPTV multicast.

docker build -f Dockerfile -t iptvudpscanner .
docker run it

in another shell run pipework
sudo ./pipework --direct-phys enp3s0 CONTAINERID 10.16.203.210/26@10.16.203.254

Connecting via pipework using DHCP is not working. Static as mentioned above works.

Set same IP adress in iterative_join.py

In container check network interface name using ifconfig
then edit INTERFACE = "eth0" in log_active_groups.py accordingly

You can also configure
PER_GROUP_LISTEN_TIME and CONCURRENT_GROUPS
More groups means bigger load onto the ISP

Listening

Start container detached using -d
Exec into container using docker exec -it iptvudpscanner /bin/bash
Screen -S logger
./log_active_groups.py > output.txt
Detach screen (CTRL+A+D)
Screen -S joiner
./iterative_join.py
Detach screen (CTRL+A+D)

You can exit from container
