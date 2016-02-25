#!/usr/bin/env bash

echo "Provisioning virtual machine..."

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

# User
sudo useradd -s /sbin/nologin -U -d $FOS_HOME_DIR -m $FOS_USER
sudo sh -c 'echo "nameserver 8.8.8.8" >> /etc/resolv.conf'

echo "Installing Stuff"
sudo apt-get update > /dev/null 2>&1
sudo apt-get install -y wget curl git make build-essential unzip openssl librtmp0 librtmp-dev libjpeg8 > /dev/null 2>&1

. $PROVISION_DIR/nginx.sh
. $PROVISION_DIR/php.sh
. $PROVISION_DIR/repo.sh
. $PROVISION_DIR/ffmpeg.sh
. $PROVISION_DIR/mariadb.sh
. $PROVISION_DIR/final.sh

# CronJob
sudo FOS_INSTALL_DIR=$FOS_INSTALL_DIR sh -c 'echo "*/2 * * * * fosstreaming php $FOS_INSTALL_DIR/cron.php" >> /etc/crontab'

echo -e "\n\n\n********************************************************************************************\n"
echo -e "FOS-Streaming installed...\n"
echo -e "visit management page: 'http://localhost:8000' on Host-Maschine\n"
echo -e "Login:\n"
echo -e "Username: admin\n"
echo -e "Password: admin\n\n"
echo -e "IMPORTANT: After you logged in, go to settings and check your ip-address.\n"
echo -e "********************************************************************************************\n"
