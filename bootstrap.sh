#!/usr/bin/env bash

apt-get update
apt-get install git -y

apt-get install -y apache2
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant/ieee-towers /var/www
fi
apt-get install ruby1.8 -y
