#!/usr/bin/env bash

apt-get update
apt-get install git -y
apt-get install vim -y

apt-get install -y apache2
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant/ieee-towers /var/www
fi

apt-get install ruby1.8 -y
# Link for ruby binary as if it is in the sakura 
ln -s /usr/bin/ruby /usr/local/bin/ruby


# Enable CGI
sed -i -e "/..*Directory \/var\/www..*/a\ \t\tAddHandler cgi-script .cgi" /etc/apache2/sites-available/default
sed -i '/Directory \/var\/www/,/\/Directory/s/Options/Options ExecCGI/' /etc/apache2/sites-available/default
service apache2 restart