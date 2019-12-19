# Docker Toolbox with tcpdump and other utilities
This image contains the handy tools such as tcpdump, ping, dig, netcat and
nmap. It's helpful for environments where you might have access to docker
containers but won't be able to download packages.

## Example
For example, run it on a docker host with following commands:
```
docker run --rm --network host --privileged -it gcr.io/gsam-123/docker-toolbox /bin/bash
ip a
tcpdump -i eth0
```