#!/bin/bash

export LD_LIBRARY_PATH=/usr/local/ppl/ppl-0.11/lib:/usr/local/gmp/gmp-4.3.2/lib:/usr/local/cloog/cloog-0.16.1/lib
export LIBRARY_PATH=/usr/lib/i386-linux-gnu
export C_INCLUDE_PATH=/usr/include/i386-linux-gnu:/usr/local/gcc/gcc-4.6.0/include/c++/4.6.0/:/usr/local/gcc/gcc-4.6.0/include/c++/4.6.0/i686-pc-linux-gnu/
export CPLUS_INCLUDE_PATH=$C_INCLUDE_PATH

cd build
make clean | tee ../make-clean.txt | grep -i error
make | tee ../make.txt | grep -i error
cd ..

