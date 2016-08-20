#!/bin/bash

export LD_LIBRARY_PATH=/usr/local/ppl/ppl-0.11/lib:/usr/local/gmp/gmp-4.3.2/lib:/usr/local/cloog/cloog-0.16.1/lib
export LIBRARY_PATH=/usr/lib/i386-linux-gnu
export C_INCLUDE_PATH=/usr/include/i386-linux-gnu:/usr/local/gcc/gcc-4.6.0/include/c++/4.6.0/:/usr/local/gcc/gcc-4.6.0/include/c++/4.6.0/i686-pc-linux-gnu/
export CPLUS_INCLUDE_PATH=$C_INCLUDE_PATH

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
patch -u -p0 < ../ppl-0.10.patch
./$SRCDIRNAME/configure --prefix=$PREFIX --with-libgmp-prefix=/usr/local/gmp/gmp-4.3.2 --with-libgmpxx-prefix=/usr/local/gmp/gmp-4.3.2 | tee ../configure.txt | grep -i error
cd ..

