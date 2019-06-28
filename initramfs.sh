#!/bin/sh
# run as fakeroot
set -e 
mkdir initramfs
cd initramfs

mkdir dev
chmod 755 dev
chown root:root dev

mknod dev/console c 5 1
mknod dev/null c 1 3
chmod 644 dev/*

cp -r ../../../busybox/bin/* .
cp ../../../dropbear/bin/* ./bin
cp linuxrc init
