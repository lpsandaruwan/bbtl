#!/bin/sh

wget http://www.busybox.net/downloads/busybox-1.23.1.tar.bz2
tar -xvf busybox-*
cd busybox-*
make defconfig
sed -i "s/.*CONFIG_STATIC.*/CONFIG_STATIC=y/" .config
make busybox
make install
