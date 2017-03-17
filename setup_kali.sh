#!/bin/sh

# Script de instalación automatizada de herramientas de Pentesting
# v1.0 - EthelHub - Cybersecurity && Research

# Creacion de ruta /opt/EthelHub
TOOLBOX_HOME=/opt/ethelhub
mkdir -p $TOOLBOX_HOME
cd $TOOLBOX_HOME

# Update de las fuentes
apt-get update && apt-get install -y kali-linux-full && apt-get -y dist-upgrade

# Ming C Compiler (32 and 64 bits)
apt-get install -y mingw-w64

# Hyperion encryption program v1.0
wget http://web.archive.org/web/20130514132719/http://nullsecurity.net/tools/binary/Hyperion-1.0.zip
unzip Hyperion-1.0.zip
i686-w64-mingw32-c++ Hyperion-1.0/Src/Crypter/*.cpp -o hyperion.exe
cd $TOOLBOX_HOME

# Veil-Evasion
wget https://github.com/ChrisTruncer/Veil/archive/master.zip -O veil-evassion.zip
unzip veil-evassion.zip
cd Veil-Evasion-master/setup
./setup.sh -s
rm $TOOLBOX_HOME/veil-evassion.zip
cd $TOOLBOX_HOME

# Proxytest
git clone https://github.com/Kr0n0/proxy_test.git proxy_test

# Dockerscan
apt-get install -y python3-pip
python3.5 -m pip install -U pip
python3.5 -m pip install dockerscan

# Bruteforce-luks
apt-get install -y dh-autoreconf
apt-get install -y libcryptsetup-dev
git clone https://github.com/Kr0n0/bruteforce-luks.git bruteforce-luks
cd bruteforce-luks
./autogen.sh && ./configure && make
cd $TOOLBOX_HOME

# APKMagic
git clone https://github.com/Kr0n0/apkmagic.git apkmagic



