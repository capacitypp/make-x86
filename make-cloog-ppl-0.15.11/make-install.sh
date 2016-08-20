#!/bin/bash
cd build
sudo make install | tee ../make-install.txt | grep -i error
cd ..

