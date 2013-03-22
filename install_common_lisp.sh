#!/bin/bash
git clone git://sbcl.git.sourceforge.net/gitroot/sbcl/sbcl.git
sudo apt-get install clisp -yq
cd sbcl
sudo bash make.sh --xc... #should it be sudo?
