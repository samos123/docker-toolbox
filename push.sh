#!/bin/bash

docker build -t samos123/docker-toolbox:latest . && \
  docker push samos123/docker-toolbox:latest
