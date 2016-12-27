# Docker images for deep learning and neural network tools 
Docker images for machine learning and neural networks development with a bit of web scraping. Includes CPU and GPU versions.

Software installed:

- THEANO
- TENSORFLOW
- KERAS
- SCRAPY
- JUPYTER NOTEBOOK
- TENSORBOARD

## What do you need
If you want to use the GPU version, you need to use linux. Software you need: nvidia drives, docker, nvidia-docker

## How to use the images

### Pull the images from the online repository

``` nvidia-docker pull renangbarreto/deeplearning:cpu ```

or

``` nvidia-docker pull renangbarreto/deeplearning:gpu ```

### Build from the dockerfiles
If the images are not avaiable, you can build using one of the following commands:

``` nvidia-docker build -t renangbarreto/deeplearning:gpu -f Dockerfile.gpu . ``` 

or

``` nvidia-docker build -t renangbarreto/deeplearning:cpu -f Dockerfile.cpu . ``` 

## How to run

Use the command:

``` sudo nvidia-docker run -it -p 8888:8888 -p 6006:6006 -v /shared:/root/shared renangbarreto/deeplearning:gpu``` 

or 

``` sudo nvidia-docker run -it -p 8888:8888 -p 6006:6006 -v /shared:/root/shared renangbarreto/deeplearning:cpu``` 
