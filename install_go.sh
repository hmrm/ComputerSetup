#!/bin/bash
#TODO: check if needs to be sudo
hg clone -u release https://code.google.com/p/go
cd go/src
./all.bash
cd ../..
