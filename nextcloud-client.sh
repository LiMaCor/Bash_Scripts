#!/bin/bash

# Made by OpenXarxes

#Instalar paquetes para compilar

echo "Instalando paquetes necesarios para compilar..."

sudo apt-get install build-essential git cmake openssl libssl-dev sqlite3 libsqlite3-dev qt5-default libqt5webkit5-dev qttools5-dev qttools5-dev-tools python-sphinx texlive-latex-base inotify-tools qt5keychain-dev

sudo apt-get install doxygen
sudo apt-get install extra-cmake-modules

echo "Compilando..."
cd 
git clone https://github.com/nextcloud/client_theming.git
cd client_theming
git submodule update --init
cd client
git submodule update --init
cd ..
mkdir build-linux
cd build-linux
cmake -D OEM_THEME_DIR=`pwd`/../nextcloudtheme ../client
sed -i 's/Icon=nextcloud/Icon=Nextcloud/g' src/gui/nextcloud.desktop
sed -i 's/Icon\[\(.*\)\]=nextcloud/Icon\[\1\]=Nextcloud/g' src/gui/nextcloud.desktop
sudo make && make install
sudo make install

echo /usr/local/lib/x86_64-linux-gnu >> /etc/ld.so.conf.d/x86_64-linux-gnu.conf
sudo ldconfig
