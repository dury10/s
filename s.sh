#!/bin/bash
#script for samsung

#apt-get update -y -qq
#apt-get upgrade -y -qq
apt install -y -qq git gcc g++ autogen
apt-get install -y -qq automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev zlib1g-dev
git clone https://github.com/fireworm71/veriumMiner
cd veriumMiner
./autogen.sh
./configure CFLAGS="-march=native" --with-crypto --with-curl
make -j4
./build.sh
#strip -s cpuminer 
./cpuminer -n 1048576 -o stratum+tcp://eu.vrm.mining-pool.ovh:3032 -u dury.pi7 -p durycel -t 0 -1 4 --cpu-affinity-stride 1 --cpu-affinity-default-index 0 --cpu-affinity-oneway-index 4
