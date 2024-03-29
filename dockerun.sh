# docker build -f Dockerfile -t iptvudpscanner .
#sudo ./pipework --direct-phys enp3s0 CONTAINERID 10.16.203.210/26@10.16.203.254
docker run -itd \
  --network fyzicka \
  --ip 10.0.1.2 \
  -e PUID=1000 -e PGID=1000 \
  -e TZ=Europe/Prague \
  -v /etc/localtime:/etc/localtime:ro \
  --name iptvudpscanner \
  iptvudpscanner \
