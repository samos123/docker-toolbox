FROM ubuntu:18.04

RUN apt-get update && apt-get install -y tcpdump iputils-ping netcat nmap dnsutils host \
    && rm -rf /var/lib/apt/lists/*

