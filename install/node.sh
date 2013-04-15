#!/bin/bash
git clone https://github.com/joyent/node.git
cd node
./configure
make
make install
cd ..
