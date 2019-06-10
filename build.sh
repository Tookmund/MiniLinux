#!/bin/sh
git submodule init

cd musl-cross-make
cp ../config.mak .
make -j4
make install

cd ../busybusy
make

cd ../dropbear
make

cd ../musl-cross-make/linux-*/
cp ../../.config .
make oldconfig
export PATH=$PWD/../../tools/bin:$PATH
../../initramfs.sh
make -j$(nproc)
cp arch/x86/boot/bzImage ../../
du -h ../../bzImage
