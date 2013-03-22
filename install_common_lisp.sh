#!/bin/bash
sudo apt-get install sbcl -yq
git clone git://sbcl.git.sourceforge.net/gitroot/sbcl/sbcl.git
cd sbcl
sudo bash make.sh
sudo apt-get purge sbcl
sudo bash install.sh
cd ..
hash -r
wget http://beta.quicklisp.org/quicklisp.lisp -O ~/quicklisp.lisp
sbcl --script setting-up-quicklisp.lisp
