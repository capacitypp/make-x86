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
cp -R ../../$SRCDIRNAME .
cd $SRCDIRNAME
patch -u < ../../configure.patch
cd ..
./$SRCDIRNAME/configure --prefix=$PREFIX --with-mpc=/usr/local/mpc/mpc-1.0.3 --with-mpfr=/usr/local/mpfr/mpfr-3.1.4 --with-gmp=/usr/local/gmp/gmp-6.1.1 --with-cloog=/usr/local/cloog/cloog-0.18.0 --with-isl=/usr/local/isl/isl-0.11.1 --enable-languages=c,c++ | tee ../configure.txt | grep -i error
cd ..

