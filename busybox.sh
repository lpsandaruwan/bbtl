#!/bin/sh

#download busybox source
wget http://www.busybox.net/downloads/busybox-1.23.1.tar.bz2

#extract busybox source and change current directory in to it
tar -xvf busybox-*
cd busybox-*

#configure
make defconfig
sed -i "s/.*CONFIG_STATIC.*/CONFIG_STATIC=y/" .config

#compile and install
make busybox
make install
