#!/usr/bin/env bash

echo "Updating virtual machine..."

PROVISION_DIR=${PROVISION_DIR:-/vagrant/provision}
FOS_HOME_DIR=${FOS_HOME_DIR:-/home/fos-streaming}
FOS_GIT_DIR=${FOS_GIT_DIR:-$FOS_HOME_DIR/fos-streaming.git}
FOS_INSTALL_DIR=${FOS_INSTALL_DIR:-$FOS_HOME_DIR/fos-streaming}
FOS_USER=${FOS_USER:-fosstreaming}
FOS_HLS_CACHE=${FOS_HLS_CACHE:-/vagrant/hls-cache}

MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD:-fosstreaming}
MYSQL_DATABASE=${MYSQL_DATABASE:-fosstreaming}
MYSQL_USERNAME=${MYSQL_USERNAME:-fosstreaming}
MYSQL_PASSWORD=${MYSQL_PASSWORD:-fosstreaming}

echo "Upgrading Stuff"
sudo apt-get update > /dev/null 2>&1
sudo apt-get -y upgrade > /dev/null 2>&1

if [ -d $FOS_GIT_DIR ]; then
    sudo rm -rf $FOS_GIT_DIR
fi
if [ -d $FOS_INSTALL_DIR ]; then
    sudo rm -rf $FOS_INSTALL_DIR
fi

. $PROVISION_DIR/ffmpeg.sh
sudo composer selfupdate
. $PROVISION_DIR/repo.sh
. $PROVISION_DIR/final.sh
