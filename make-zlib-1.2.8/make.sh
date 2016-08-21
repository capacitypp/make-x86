#!/bin/bash

MAKEDIRPATH=`pwd`
MAKEDIRNAME=${MAKEDIRPATH##*/}
SRCDIRNAME=${MAKEDIRNAME#*-}
DSTDIRNAME=$SRCDIRNAME
DSTDIRPATH=/usr/local/${DSTDIRNAME%%-*}/$DSTDIRNAME
PREFIX=$DSTDIRPATH
echo "PREFIX : "$PREFIX

cd build
#make clean | tee ../make-clean.txt | grep -i error
export LD_LIBRARY_PATH=/usr/local/ppl/ppl-0.11/lib:/usr/local/gmp/gmp-6.1.1/lib:/usr/local/cloog/cloog-0.16.1/lib
LIBRARY_PATH=/usr/lib/i386-linux-gnu
export LIBRARY_PATH
export C_INCLUDE_PATH=/usr/include/i386-linux-gnu
export CPLUS_INCLUDE_PATH=/usr/include/i386-linux-gnu
cd $SRCDIRNAME
make | tee ../../make.txt | grep -i error
cd ..

