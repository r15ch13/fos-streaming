#!/usr/bin/env bash

# Nginx
echo "Installing Nginx"
sudo apt-get install -y nginx > /dev/null 2>&1

# Nginx Configuration
echo "Configuring Nginx"
sudo cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.default
sudo FOS_USER=$FOS_USER sh -c 'sed -i "s/user .*;/user $FOS_USER;\nworker_rlimit_nofile 100000;/g" /etc/nginx/nginx.conf'
sudo sh -c 'sed -i "s/worker_connections [0-9]\+;/worker_connections 10240;/g" /etc/nginx/nginx.conf'

sudo rm /etc/nginx/sites-enabled/default
sudo cp $PROVISION_DIR/config/fosstreaming.conf /etc/nginx/sites-available/fosstreaming.conf
sudo ln -s /etc/nginx/sites-available/fosstreaming.conf /etc/nginx/sites-enabled/fosstreaming.conf

sudo service nginx restart > /dev/null 2>&1
