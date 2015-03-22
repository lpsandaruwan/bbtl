#!/bin/sh

##### Lahiru Pathirage
##### lpsandaruwan@gmail.com
##### 


#genarate kernel binaries
sh kernel.sh

#genarate busybox binaries
sh busybox.sh

#create the root file system
sh rootfs.sh

#genarate the iso
sh iso.sh