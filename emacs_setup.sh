#!/bin/bash
MANUAL_PACKAGES="cobol-mode.el bison-mode.el flex-mode.el"
bash install_emacs.sh
mkdir ~/.emacs.d
mkdir ~/.emacs.d/lisp

for x in $MANUAL_PACKAGES
do
    cp $x ~/.emacs.d/lisp
done

cat new_dot_emacs.el > ~/.emacs

# Assumes git is set up
git clone https://github.com/gabrielelanaro/emacs-for-python.git ~/.emacs.d/emacs-for-python
