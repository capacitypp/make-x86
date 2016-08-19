#!/bin/bash
cd build
make tests | tee ../make-check.txt | grep -i error
cd ..

