#!/bin/bash
apt-get install sbcl -yq
git clone git://sbcl.git.sourceforge.net/gitroot/sbcl/sbcl.git
cd sbcl
bash make.sh
apt-get purge sbcl -yq
bash install.sh
cd ..
hash -r
wget http://beta.quicklisp.org/quicklisp.lisp -O ~/quicklisp.lisp
sbcl --script setting-up-quicklisp.lisp
