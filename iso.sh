#!/bin/sh

cd linux-*
make isoimage FDINITRD=../rootfs.cpio.gz
mv arch/x86/boot/image.iso ../BBTL.iso
