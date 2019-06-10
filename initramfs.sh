#!/bin/sh
cp ../../initramfs .
for i in `ls ../../busybox/bin`
do
	echo "dir /$i	755	0	0" >> initramfs
	for d in `ls ../../busybox/bin/$i`
	do
		echo "file /bin/$d	../../busybox/bin/$i/$d	755	0	0" >> initramfs
	done
done

for i in `ls ../../dropbear/bin`
do
	echo "file /bin/$i	../../dropbear/bin/$i" >> initramfs
done
