#!/bin/bash
rm -r -f build
mkdir -p build
cd build
../../mpc-1.0.3/configure --prefix=/usr/local/mpc/mpc-1.0.3 --with-mpfr=/usr/local/mpfr-3.1.4 --with-gmp=/usr/local/gmp/gmp-6.1.1 | tee ../configure.txt | grep -i error
cd ..

