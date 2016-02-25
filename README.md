# Docker/Vagrant FOS-Streaming

This repository contains a Dockerfile and a Vagrantfile to automagically setup [FOS-Streaming](https://github.com/zgelici/FOS-Streaming-v1).
Installs and configures MariaDB, NGINX and php5-fpm to run FOS-Streaming in a Container/VM.

## Docker

### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/r15ch13/fos-streaming/) from public [Docker Hub Registry](https://registry.hub.docker.com/):
```
> docker pull r15ch13/fos-streaming
```
Alternatively, you can build an image from Dockerfile:
```
> docker build -t="r15ch13/fos-streaming" github.com/r15ch13/fos-streaming
```

### Usage

```
> docker run -p 8000:80 r15ch13/fos-streaming
```

Open [http://&lt;container ip&gt;:8000/](http://&lt;container ip&gt;:8000/)

## Vagrant

### Installation

1. Install [Vagrant](https://www.vagrantup.com/).

2. Clone repository
```
> git clone https://github.com/r15ch13/fos-streaming
> cd fos-streaming
> vagrant up
```

Open http://localhost:8000/

## Environment Variables
```
FOS_HOME_DIR=/home/fos-streaming
FOS_GIT_DIR=$FOS_HOME_DIR/fos-streaming.git
FOS_INSTALL_DIR=$FOS_HOME_DIR/fos-streaming
FOS_USER=fosstreaming
FOS_HLS_CACHE=/hls-cache

MYSQL_ROOT_PASSWORD=fosstreaming
MYSQL_DATABASE=fosstreaming
MYSQL_USERNAME=fosstreaming
MYSQL_PASSWORD=fosstreaming
```

## License
[The MIT License (MIT)](http://r15ch13.mit-license.org/)