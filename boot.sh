#!/bin/bash

# Stop and remove any existing container with the same name
docker stop ct >/dev/null 2>&1
docker rm ct >/dev/null 2>&1

# Create and run the Docker container
docker run --name ct -d -p 63000:63000 \
  --restart always \
  -v /root/downloads:/downloads \
  jpillora/cloud-torrent --port 63000

# Check if the container is running
if [[ "$(docker inspect -f '{{.State.Running}}' ct)" == "true" ]]; then
  echo "Cloud Torrent is running on port 63000."
else
  echo "Failed to start Cloud Torrent."
fi
