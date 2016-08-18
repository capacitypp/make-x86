#!/bin/bash
MAKEDIRPATH=`pwd`
MAKEDIRNAME=${MAKEDIRPATH##*/}
SRCDIRNAME=${MAKEDIRNAME#*-}
DSTDIRNAME=$SRCDIRNAME
DSTDIRPATH=/usr/local/${DSTDIRNAME%%-*}/$DSTDIRNAME
PREFIX=$DSTDIRPATH
echo "PREFIX : "$PREFIX
src=$PREFIX/bin
dst=/usr/bin
command="sudo update-alternatives --install $dst/iconv iconv $src/iconv 114 "
for name in `ls $src | grep -v iconv`; do
command=$command"--slave $dst/$name $name $src/$name "
done
sudo $command

