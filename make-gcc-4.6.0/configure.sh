#!/bin/bash

export LD_LIBRARY_PATH=/usr/local/ppl/ppl-0.11/lib:/usr/local/gmp/gmp-6.1.1/lib
LIBRARY_PATH=/usr/lib/i386-linux-gnu
export LIBRARY_PATH
export C_INCLUDE_PATH=/usr/include/i386-linux-gnu
export CPLUS_INCLUDE_PATH=/usr/include/i386-linux-gnu

MAKEDIRPATH=`pwd`
MAKEDIRNAME=${MAKEDIRPATH##*/}
SRCDIRNAME=${MAKEDIRNAME#*-}
DSTDIRNAME=$SRCDIRNAME
DSTDIRPATH=/usr/local/${DSTDIRNAME%%-*}/$DSTDIRNAME
PREFIX=$DSTDIRPATH
echo "PREFIX : "$PREFIX
rm -r -f build
mkdir -p build
cd build
cp -R ../../$SRCDIRNAME .
patch -u -p0 < ../$SRCDIRNAME.patch
./$SRCDIRNAME/configure --prefix=$PREFIX --with-mpc=/usr/local/mpc/mpc-1.0.3 --with-mpfr=/usr/local/mpfr/mpfr-3.1.4 --with-gmp=/usr/local/gmp/gmp-6.1.1 --with-cloog=/usr/local/cloog/cloog-0.16.1 --with-ppl=/usr/local/ppl/ppl-0.11 --enable-cloog-backend=isl --enable-languages=c,c++ | tee ../configure.txt | grep -i error
cd ..

