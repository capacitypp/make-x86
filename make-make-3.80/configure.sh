#!/bin/bash
rm -r -f build
mkdir -p build
cd build
../../make-3.80/configure --prefix=/usr/local/make/make-3.80 | tee cfg.txt | grep -i error
cd ..

