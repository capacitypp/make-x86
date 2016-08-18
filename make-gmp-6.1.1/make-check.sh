#!/bin/bash
cd build
make check | tee make-check.txt | grep -i error
cd ..

