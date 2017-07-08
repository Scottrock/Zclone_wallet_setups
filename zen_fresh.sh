#!/bin/sh
# update & upgrade #
cd
sudo apt-get update
sudo apt-get -y upgrade
#
# get dependencies #
#
sudo apt-get install build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python zlib1g-dev wget bsdmainutils automake
#
# get the files #
#
git clone https://github.com/ZencashOfficial/zen.git
#
# make the configs #
#
mkdir -p ~/.zen
#
#Zen.conf File
#
echo "server=1"  > ~/.zen/zen.conf
echo "# Un-comment the next line to run in daemon mode"  >> ~/.zen/zen.conf
echo "#daemon=1"  >> ~/.zen/zen.conf
echo "listen=1"  >> ~/.zen/zen.conf
echo "txindex=1"  >> ~/.zen/zen.conf
echo "logtimestamps=1"  >> ~/.zen/zen.conf
echo "rpcuser=znodeuser"  >> ~/.zen/zen.conf
echo "`head -c 32 /dev/urandom | base64`"  >> ~/.zen/zen.conf
#
#Last coins bit
#
cd zen
git checkout master
./zcutil/fetch-params.sh
./zcutil/build.sh -j$(nproc)
cd
