#!/bin/bash
cd build
make clean | tee ../make-clean.txt | grep -i error
make | tee ../make.txt | grep -i error
cd ..

