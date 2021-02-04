FROM ubuntu:18.04

ARG CLOUD_SDK_VERSION=326.0.0
ENV CLOUD_SDK_VERSION=$CLOUD_SDK_VERSION

RUN apt-get update && apt-get install -y tcpdump iputils-ping iputils-arping \
        iproute2 netcat nmap dnsutils host iptables docker.io curl wget vim traceroute \
        fdisk mdadm lvm2 fuse \
        curl \
        python3-dev \
        python3-crcmod \
        python-crcmod \
        apt-transport-https \
        lsb-release \
        openssh-client \
        git \
        make \
        gcc \
        python3-pip \
        gnupg && \
    export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb https://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" > /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update && \
    apt-get install -y google-cloud-sdk=${CLOUD_SDK_VERSION}-0 \
        google-cloud-sdk-app-engine-python=${CLOUD_SDK_VERSION}-0 \
        google-cloud-sdk-app-engine-python-extras=${CLOUD_SDK_VERSION}-0 \
        google-cloud-sdk-app-engine-java=${CLOUD_SDK_VERSION}-0 \
        google-cloud-sdk-app-engine-go=${CLOUD_SDK_VERSION}-0 \
        google-cloud-sdk-datalab=${CLOUD_SDK_VERSION}-0 \
        google-cloud-sdk-datastore-emulator=${CLOUD_SDK_VERSION}-0 \
        google-cloud-sdk-pubsub-emulator=${CLOUD_SDK_VERSION}-0 \
        google-cloud-sdk-bigtable-emulator=${CLOUD_SDK_VERSION}-0 \
        google-cloud-sdk-firestore-emulator=${CLOUD_SDK_VERSION}-0 \
        google-cloud-sdk-spanner-emulator=${CLOUD_SDK_VERSION}-0 \
        google-cloud-sdk-cbt=${CLOUD_SDK_VERSION}-0 \
        kubectl && \
    gcloud --version && \
    docker --version && kubectl version --client && \
    export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s` && \
    echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | tee /etc/apt/sources.list.d/gcsfuse.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update && \
    apt-get install gcsfuse && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install pyopenssl
RUN git config --system credential.'https://source.developers.google.com'.helper gcloud.sh
VOLUME ["/root/.config", "/root/.kube"]

ADD https://github.com/samos123/docker-veth/raw/master/docker-veth.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-veth.sh
