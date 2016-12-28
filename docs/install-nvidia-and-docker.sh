# This file shows (more or less) how to setup a ubuntu with the nvidia drives, docker and nvidia docker
# based on a ubuntu 16.04 64bits

# Nvidia driver
lspci | grep -i nvidia
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt-get install nvidia-352
# Do a reboot!
cat /proc/driver/nvidia/version

#docker
sudo apt-get update
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
sudo apt-get update
apt-cache policy docker-engine
sudo apt-get install -y docker-engine
sudo systemctl restart docker
sudo usermod -aG docker $(whoami)

#nvidia-docker
wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.0-rc.3/nvidia-docker_1.0.0.rc.3-1_amd64.deb
sudo dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb

# clear repos
sudo rm -vf /var/lib/apt/lists/*
sudo apt-get update

# Test using nvidia-smi
sudo nvidia-docker run --rm nvidia/cuda nvidia-smi

# Creating the container
sudo nvidia-docker run -it -p 8888:8888 -p 6006:6006 -v /sharedfolder:/root/sharedfolder renangbarreto/deeplearning:gpu /bin/bash


# If you want to build the image, you need to do something like this:

# sudo nvidia-docker build -t renangbarreto/deeplearning:gpu -f Dockerfile.gpu .
# sudo nvidia-docker run -it -p 8888:8888 -p 6006:6006 -v /media/renan/Documentos/GEORANKER/spider-cluster/crawler/anti-piracy:/root/shared renangbarreto/deeplearning:gpu
# or
# sudo docker build -t renangbarreto/deeplearning:cpu -f Dockerfile.cpu .
# sudo docker run -it -p 8888:8888 -p 6006:6006 -v /media/renan/Documentos/GEORANKER/spider-cluster/crawler/anti-piracy:/root/shared renangbarreto/deeplearning:cpu



