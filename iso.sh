#!/bin/sh

cd linux-*

#combied with the created root fie system
make isoimage FDINITRD=../rootfs.cpio.gz

#move genarated iso file to the base directory
mv arch/x86/boot/image.iso ../BBTL.iso
