#!/bin/bash
MAKEDIRPATH=`pwd`
MAKEDIRNAME=${MAKEDIRPATH##*/}
SRCDIRNAME=${MAKEDIRNAME#*-}
DSTDIRNAME=$SRCDIRNAME
PGNAME=${DSTDIRNAME%%-*}
DSTDIRPATH=/usr/local/$PGNAME/$DSTDIRNAME
PREFIX=$DSTDIRPATH
echo "PREFIX : "$PREFIX
src=$PREFIX/bin
dst=/usr/bin
command="sudo update-alternatives --install $dst/$PGNAME $PGNAME $src/$PGNAME 0161 "
for name in `ls $src | grep -x -v $PGNAME`; do
command=$command"--slave $dst/$name $name $src/$name "
done
#echo $command
sudo $command

