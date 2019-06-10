#!/bin/sh
git submodule init

cd musl-cross-make
cp ../config.mak .
make -j4
make install
cd ..
