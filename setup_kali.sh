#!/bin/sh

# Script de instalación automatizada de herramientas de Pentesting
# v1.0 - EthelHub - Cybersecurity && Research

# Creacion de ruta /opt/EthelHub
TOOLBOX_HOME=/opt/ethelhub
mkdir -p $TOOLBOX_HOME
cd $TOOLBOX_HOME

# Update de las fuentes
apt-get update && apt-get install -y kali-linux-full && apt-get -y dist-upgrade && apt-get install -y apt-file && apt-file update

# Ming C Compiler (32 and 64 bits)
apt-get install -y mingw-w64
ln -s /usr/x86_64-w64-mingw32/include/winuser.sh /usr/x86_64-w64-mingw32/include/Winuser.sh

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

# SSLStrip2 
git clone https://github.com/byt3bl33d3r/sslstrip2.git sslstrip2
cd sslstrip2
cp README.md README
python ./setup.py install
chmod +x sslstrip.py
cd $TOOLBOX_HOME

# DNS2Proxy para SSLStrip2
git clone https://github.com/singe/dns2proxy.git dns2proxy

# Dradis
apt-get install -y libmariadbclient-dev-compat libmariadb-client-lgpl-dev mariadb-client-10.1 mariadb-server-10.1 radis-server dradis
git clone https://github.com/dradis/metasploit-dradis metasploit-dradis
cd $HOME/.msf4/plugins 
ln -s $TOOLBOX_HOME/metasploit-dradis/lib/dradis.rb .
cd $TOOLBOX_HOME

# Nikto2 (bug en version de Kali)
git clone https://github.com/sullo/nikto.git nikto
cd $TOOLBOX_HOME

# Nishang - PowerShell Scripts 
git clone https://github.com/samratashok/nishang.git nishang
cd $TOOLBOX_HOME

# Windows Exploit Suggester
apt-get install python-pip python-xlrd
pip install xlrd upgrade
git clone https://github.com/GDSSecurity/Windows-Exploit-Suggester.git WindowsExploitSuggester
cd WindowsExploitSuggester
./windows-exploit-suggester.py --update
ln -s *xls latest.xls
cd $TOOLBOX_HOME

# Linux Exploit Suggester
git clone https://github.com/PenturaLabs/Linux_Exploit_Suggester LinuxExploitSuggester
cd $TOOLBOX_HOME

# OSCP - Linux Priv Checker
mkdir linuxprivchecker && cd linuxprivchecker && wget -c https://www.securitysift.com/download/linuxprivchecker.py
cd $TOOLBOX_HOME

# OSCP - recon_scan
mkdir recon_scan && cd recon_scan && wget -c https://www.securitysift.com/download/recon_scan.zip && unzip recon_scan.zip
cd $TOOLBOX_HOME

# OSCP - WrapMap
git clone https://github.com/n3ko1/WrapMap WrapMap


