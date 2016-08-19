#!/bin/bash
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
sudo mkdir -p $PREFIX
../../$SRCDIRNAME/configure --prefix=$PREFIX --with-gmp-prefix=/usr/local/gmp/gmp-6.1.1 | tee ../configure.txt | grep -i error
cd ..

