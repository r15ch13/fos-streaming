#!/usr/bin/env bash

# MariaDB
echo "Preparing MariaDB"
sudo apt-get install debconf-utils -y > /dev/null 2>&1
sudo MYSQL=$MYSQL_ROOT_PASSWORD sh -c 'echo "mariadb-server-5.5 mysql-server/root_password password $MYSQL" | debconf-set-selections'
sudo MYSQL=$MYSQL_ROOT_PASSWORD sh -c 'echo "mariadb-server-5.5 mysql-server/root_password_again password $MYSQL" | debconf-set-selections'

echo "Installing MariaDB"
sudo apt-get -y install mariadb-server-5.5 > /dev/null 2>&1
sudo service mysql restart

# MariaDB Configuration
echo "Configuring MariaDB"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE $MYSQL_DATABASE"
mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USERNAME'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD'"
