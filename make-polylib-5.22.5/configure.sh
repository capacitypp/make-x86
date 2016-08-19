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
#cp -R ../../$SRCDIRNAME .
#cd $SRCDIRNAME
#patch -u < ../../configure.patch
#cd ..
../../$SRCDIRNAME/configure --prefix=$PREFIX --enable-int-lib --enable-longint-lib --enable-longlongint-lib --enable-extra-suffix --with-libgmp=/usr/local/gmp/gmp-6.1.1 | tee ../configure.txt | grep -i error
cd ..

