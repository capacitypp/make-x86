#!/bin/bash
rm -r -f build
mkdir -p build
cd build
PREFIX=/usr/local/isl/isl-0.12.2
sudo mkdir -p $PREFIX
../../isl-0.12.2/configure --prefix=$PREFIX --with-gmp-prefix=/usr/local/gmp/gmp-6.1.1 | tee ../configure.txt | grep -i error
cd ..

