#!/bin/bash
MANUAL_PACKAGES="cobol-mode.el bison-mode.el flex-mode.el"
mkdir ~/.emacs.d
mkdir ~/.emacs.d/lisp

for x in $MANUAL_PACKAGES
do
    cp -v $x ~/.emacs.d/lisp
done

# Assumes git is set up
git clone https://github.com/gabrielelanaro/emacs-for-python.git ~/.emacs.d/emacs-for-python
