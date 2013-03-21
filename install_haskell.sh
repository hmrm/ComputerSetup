#!/bin/bash
sudo apt-get install ghc ghc-prof ghc-doc cabal-install -yq
cabal update
cabal install alex happy
git clone git://github.com/nominolo/scion.git
cd scion
cabal install
cd emacs
cp * ~/.emacs.d/lisp
cd ../..
git clone https://gist.github.com/1241059.git ~/tmpe
cp ~/tmpe/* ~/.emacs.d/lisp
rm -r ~/tmpe
git clone https://gist.github.com/1241063.git ~/tmpe
cp ~/tmpe/* ~/.emacs.d/lisp
rm -r ~/tmpe
