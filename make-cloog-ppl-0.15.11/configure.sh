#!/bin/bash

export LD_LIBRARY_PATH=/usr/local/cloog/cloog-0.16.1/lib:/usr/local/ppl/ppl-0.11/lib:/usr/local/gmp/gmp-6.1.1/lib
#export LD_LIBRARY_PATH=/usr/local/ppl/ppl-0.11/lib:/usr/local/gmp/gmp-6.1.1/lib
export LIBRARY_PATH=/usr/lib/i386-linux-gnu
export C_INCLUDE_PATH=/usr/include/i386-linux-gnu
export CPLUS_INCLUDE_PATH=/usr/include/i386-linux-gnu

MAKEDIRPATH=`pwd`
MAKEDIRNAME=${MAKEDIRPATH##*/}
SRCDIRNAME=${MAKEDIRNAME#*-}
DSTDIRNAME=$SRCDIRNAME
DSTDIRPATH=/usr/local/${DSTDIRNAME%-*}/$DSTDIRNAME
PREFIX=$DSTDIRPATH
echo "PREFIX : "$PREFIX
rm -r -f build
mkdir -p build
cd build
cp -R ../../$SRCDIRNAME .
patch -u -p0 < ../$SRCDIRNAME.patch
./$SRCDIRNAME/configure --prefix=$PREFIX --with-ppl=/usr/local/ppl/ppl-0.11 --with-gmp=/usr/local/gmp/gmp-6.1.1 | tee ../configure.txt | grep -i error
cd ..

