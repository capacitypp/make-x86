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
patch -u -p0 < ../ppl-0.11.patch
./$SRCDIRNAME/configure --prefix=$PREFIX --with-gmp-prefix=/usr/local/gmp/gmp-6.1.1 | tee ../configure.txt | grep -i error
cd ..

