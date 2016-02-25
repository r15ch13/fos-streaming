#!/usr/bin/env bash

echo "Configuring FOS-Streaming"
sudo mkdir -p $FOS_HLS_CACHE && sudo chown $FOS_USER:$FOS_USER $FOS_HLS_CACHE
sudo -u $FOS_USER chmod -R 755 $FOS_HLS_CACHE && sudo -u $FOS_USER ln -s $FOS_HLS_CACHE $FOS_INSTALL_DIR/hl
sudo mkdir -p $FOS_INSTALL_DIR/cache && sudo chown $FOS_USER:$FOS_USER $FOS_INSTALL_DIR/cache
sudo -u $FOS_USER chmod -R 755 $FOS_INSTALL_DIR/cache
sudo -u $FOS_USER mkdir -p /home/fos-streaming/fos/ && sudo -u $FOS_USER ln -s $FOS_INSTALL_DIR /home/fos-streaming/fos/www

# Database Settings
sudo -u $FOS_USER sh -c "sed -i \"s/\('database'\s\+=>\s\+'\).*\(',\)/\1$MYSQL_DATABASE\2/g\" $FOS_INSTALL_DIR/config.php"
sudo -u $FOS_USER sh -c "sed -i \"s/\('username'\s\+=>\s\+'\).*\(',\)/\1$MYSQL_USERNAME\2/g\" $FOS_INSTALL_DIR/config.php"
sudo -u $FOS_USER sh -c "sed -i \"s/\('password'\s\+=>\s\+'\).*\(',\)/\1$MYSQL_PASSWORD\2/g\" $FOS_INSTALL_DIR/config.php"

sudo service php5-fpm restart && sudo service mysql restart && sudo service nginx restart

echo "Running FOS-Streaming Installation"
curl -sS "http://127.0.0.1:80/install.php?install"

echo "Running FOS-Streaming Update"
curl -sS "http://127.0.0.1:80/install.php?update"

echo "Cleanup"
sudo rm -f $FOS_INSTALL_DIR/install.php
sudo rm -f $FOS_INSTALL_DIR/install_panel.php
