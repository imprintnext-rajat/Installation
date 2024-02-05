#!/bin/bash
apt update -y
## jenkins image (jenkins/jenkins:2.391-jdk11)
apt install -y php7.4
apt install -y nano
# install nodejs
curl -sL https://deb.nodesource.com/setup_12.x -o /tmp/nodesource_setup.sh
bash /tmp/nodesource_setup.sh
apt update -y
apt -y install nodejs
npm install -g gulp-cli
npm install -g @angular/cli@6.1.1

#check version
#node -v

 #install  composer
 apt update -y
 apt install -y php-cli unzip

cd ~
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
echo $HASH
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
 php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer

#check version
#composer