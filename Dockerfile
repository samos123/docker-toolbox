FROM ubuntu:18.04

RUN apt-get update && apt-get install -y tcpdump iputils-ping iputils-arping \
        iproute2 netcat nmap dnsutils host iptables docker.io curl wget vim traceroute \
        fdisk mdadm lvm2 fuse \
    && rm -rf /var/lib/apt/lists/*

ADD https://github.com/samos123/docker-veth/raw/master/docker-veth.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-veth.sh
