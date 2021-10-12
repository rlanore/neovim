#!/bin/bash
dir=`dirname $0`

IMAGE="rla/nvim"
TAG="latest"

# RLA Launch
sudo docker run -t \
  --user root \
  --rm \
  -v ~/Documents/git/github/rlanore/nvim:/git/ \
  -i ${IMAGE}:${TAG} /bin/bash

