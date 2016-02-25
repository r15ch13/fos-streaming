#!/usr/bin/env bash

# PHP
echo "Installing PHP"
sudo apt-get install php5-common php5-dev php5-cli php5-fpm -y > /dev/null 2>&1

echo "Installing PHP extensions"
sudo apt-get install curl php5-curl php5-mcrypt php5-mysql -y > /dev/null 2>&1

echo "Configuring PHP"
sudo cp /etc/php5/fpm/php-fpm.conf /etc/php5/fpm/php-fpm.conf.default
sudo cp /etc/php5/fpm/pool.d/www.conf /etc/php5/fpm/pool.d/www.conf.default
sudo FOS_USER=$FOS_USER sh -c 'sed -i "s/\(listen.\)\?\(user\|group\|owner\) = .*/\1\2 = $FOS_USER/g" /etc/php5/fpm/pool.d/www.conf'
sudo sh -c 'sed -i "s/listen = \/var\/run\/php5-fpm.sock/listen = \/var\/run\/php5-fos-fpm.sock/g" /etc/php5/fpm/pool.d/www.conf'

echo "Installing Composer"
curl -sS https://getcomposer.org/installer | sudo -H php -- --install-dir=/usr/local/bin --filename=composer

sudo service php5-fpm restart > /dev/null 2>&1
