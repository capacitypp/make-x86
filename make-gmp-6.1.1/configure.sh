#!/bin/bash
rm -r -f build
mkdir -p build
cd build
../../gmp-6.1.1/configure --prefix=/usr/local/gmp/gmp-6.1.1 | tee cfg.txt | grep -i error
cd ..

