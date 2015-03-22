#!/bin/sh 

#download Linux kernel
wget https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.18.9.tar.xz

#extract Linux archive
tar -xvf linux-*

#change current directory to the kernel directory
cd linux-*

#configure
make tinyconfig #set the minimal configuration

#change the default host name
sed -i "s/.*CONFIG_DEFAULT_HOSTNAME.*/CONFIG_DEFAULT_HOSTNAME=\"BBTL\"/" .config 

#compile
make vmlinux