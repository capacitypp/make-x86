#!/bin/bash
rm -r -f build
mkdir -p build
cd build
../../mpfr-3.1.4/configure --prefix=/usr/local/mpfr/mpfr-3.1.4 --with-gmp=/usr/local/gmp/gmp-6.1.1 | tee ../cfg.txt | grep -i error
cd ..

