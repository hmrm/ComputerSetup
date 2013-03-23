#!/bin/bash
hg clone -u release https://code.google.com/p/go
cd go/src
./all.bash
cd ../..
