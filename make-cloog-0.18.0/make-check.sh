#!/bin/bash
cd build
make -k check | tee ../make-check.txt | grep -i error
cd ..

