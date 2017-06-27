#!/bin/sh
# update & upgrade #
cd
sudo apt-get update
sudo apt-get -y upgrade
# get dependencies #
sudo apt-get install build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python zlib1g-dev wget bsdmainutils automake
# get the coins #
git clone https://github.com/ZencashOfficial/zen.git
git clone https://github.com/z-classic/zclassic.git
git clone https://github.com/MyHush/hush.git
# make the configs #
mkdir -p ~/.zen
mkdir -p ~/.hush
mkdir -p ~/.zclassic
#Zclassic.conf file
echo "server=1"  > ~/.zclassic/zclassic.conf
echo "daemon=1"  >> ~/.zclassic/zclassic.conf
echo "listen=1"  >> ~/.zclassic/zclassic.conf
echo "txindex=1"  >> ~/.zclassic/zclassic.conf
echo "logtimestamps=1"  >> ~/.zclassic/zclassic.conf
echo "rpcuser=znodeuser"  >> ~/.zclassic/zclassic.conf
echo "`head -c 32 /dev/urandom | base64`" >> ~/.zclassic/zclassic.conf
echo "addnode=dnsseed.zclassic.org" >> ~/.zclassic/zclassic.conf
echo "addnode=dnsseed.rotorproject.org" >> ~/.zclassic/zclassic.conf
#Zen.conf File
echo "server=1"  > ~/.zen/zen.conf
echo "daemon=1"  >> ~/.zen/zen.conf
echo "listen=1"  >> ~/.zen/zen.conf
echo "txindex=1"  >> ~/.zen/zen.conf
echo "logtimestamps=1"  >> ~/.zen/zen.conf
echo "rpcuser=znodeuser"  >> ~/.zen/zen.conf
echo "`head -c 32 /dev/urandom | base64`"  >> ~/.zen/zen.conf
#Zdash.conf File
echo "server=1"  > ~/.hush/hush.conf
echo "daemon=1"  >> ~/.hush/hush.conf
echo "listen=1"  >> ~/.hush/hush.conf
echo "txindex=1"  >> ~/.hush/hush.conf
echo "logtimestamps=1"  >> ~/.hush/hush.conf
echo "rpcuser=znodeuser"  >> ~/.hush/hush.conf
echo "`head -c 32 /dev/urandom | base64`"  >> ~/.hush/hush.conf
#Last coins bit
cd zen
git checkout master
./zcutil/fetch-params.sh
./zcutil/build.sh -j$(nproc)
cd
cd zclassic
git checkout master
./zcutil/fetch-params.sh
./zcutil/build.sh -j$(nproc)
cd
cd hush
git checkout master
./zcutil/fetch-params.sh
./zcutil/build.sh -j$(nproc)
cd
