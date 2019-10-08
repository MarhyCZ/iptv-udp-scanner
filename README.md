# iptv-udp-scanner
Docker image of an UDP scanner which can be used to search for IPTV multicast. 


docker build -f Dockerfile -t iptvudpscanner .
docker run it

in another shell run pipework
sudo ./pipework --direct-phys enp3s0 CONTAINERID 10.16.203.210/26@10.16.203.254

in container ifconfig
edit INTERFACE = "eth0" in log_active_groups.py accordingly