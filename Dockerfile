FROM ubuntu:18.04

RUN apt-get update && apt-get install -y tcpdump iputils-ping iputils-arping \
        iproute2 netcat nmap dnsutils host iptables docker.io curl wget vim \
    && rm -rf /var/lib/apt/lists/*

COPY docker-veth.sh /usr/local/bin/
