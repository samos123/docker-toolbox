#!/bin/bash

docker build -t gcr.io/gsam-123/docker-toolbox:latest . && \
  docker push gcr.io/gsam-123/docker-toolbox:latest
