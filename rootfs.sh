#!/bin/sh 

#move the busybox binaries to create the root file system
mv busybox-*/_install rootfs
cd rootfs

#create the other directories
mkdir dev etc proc src sys tmp
cd etc

#create a welcome text
touch startup.txt
echo '  ###########################################' >> startup.txt
echo '  #                                         #' >> startup.txt
echo '  #  Welcome to "Busybox Based Tiny Linux"  #' >> startup.txt
echo '  #                                         #' >> startup.txt
echo '  ###########################################' >> startup.txt
      
cd ..

#linuxrc file, genarated with busybox shoud be deleted, because system is init based
rm -f linuxrc

#make the init file
touch init
echo '#!/bin/sh' >> init
echo 'dmesg -n 1' >> init
echo 'mount -t devtmpfs none /dev' >> init
echo 'mount -t proc none /proc' >> init
echo 'mount -t sysfs none /sys' >> init
echo 'cat /etc/welcome.txt' >> init
echo 'while true' >> init
echo 'do' >> init
echo 'setsid cttyhack /bin/sh' >> init
echo 'done' >> init
echo >> init

#change init to a executable file
chmod +x init

#pack and compress the created root file system
find . | cpio -H newc -o | gzip > ../rootfs.cpio.gz
