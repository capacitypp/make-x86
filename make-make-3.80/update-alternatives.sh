#!/bin/bash
src=/usr/local/make/make-3.80/bin
dst=/usr/bin
command="sudo update-alternatives --install $dst/make make $src/make 380"
sudo $command

