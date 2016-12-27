#!/bin/bash
# this file, if executed, will remove all docker images and containers from your computer... make sure that you really want to do that!

# Delete all containers
sudo docker rm $(sudo docker ps -a -q)

# Delete all images
sudo docker rmi $(sudo docker images -q)
