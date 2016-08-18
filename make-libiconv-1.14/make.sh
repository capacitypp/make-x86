#!/bin/bash
cd build
make clean | tee ../make-clean.txt | grep -i error
make > /dev/null 2>&1
cd srclib
patch -u < ../../stdio.h.patch
cd ../
make | tee ../make.txt | grep -i error
cd ..

