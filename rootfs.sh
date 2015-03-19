#!/bin/sh 


mv busybox-*/_install rootfs
cd rootfs
mkdir dev etc proc src sys tmp
cd etc
touch startup.txt
echo '  ###########################################' >> startup.txt
echo '  #                                         #' >> startup.txt
echo '  #  Welcome to "Busybox Based Tiny Linux"  #' >> startup.txt
echo '  #                                         #' >> startup.txt
echo '  ###########################################' >> startup.txt
      
cd ..
rm -f linuxrc
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
chmod +x init

find . | cpio -H newc -o | gzip > ../rootfs.cpio.gz
