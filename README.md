[![Build Status](https://travis-ci.org/samos123/docker-toolbox.svg?branch=master)](https://travis-ci.org/samos123/docker-toolbox)
# Docker Toolbox with tcpdump and other utilities
This image contains the handy tools such as tcpdump, ping, dig, netcat and
nmap. It's helpful for environments where you might have access to docker
containers but won't be able to download packages.

## Example
For example, run it on a docker host with following commands:
```
docker run --rm --network host --privileged -it samos123/docker-toolbox /bin/bash
ip a
tcpdump -i eth0
```

You can also run this image on K8s clusters with the following pod definition:
```
kubectl apply -f https://raw.githubusercontent.com/samos123/docker-toolbox/master/debug-pod.yaml
kubectl exec debug-pod -t -i bash
ip a
```
