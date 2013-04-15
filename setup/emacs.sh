#!/bin/bash
MANUAL_PACKAGES="cobol-mode.el bison-mode.el flex-mode.el"
mkdir ~/.emacs.d
mkdir ~/.emacs.d/lisp

for x in $MANUAL_PACKAGES
do
    cp -v "elispfiles/"$x ~/.emacs.d/lisp
done

# Assumes git is set up
git clone https://github.com/hmrm/emacs-for-python.git ~/.emacs.d/emacs-for-python

#installing ensime
wget "https://dl.dropbox.com/sh/ryd981hq08swyqr/ZiCwjjr_vm/ENSIME%20Releases/ensime_2.10.0-0.9.8.9.tar.gz?token_hash=AAHpPjuDRijzZt1Qhvh6BJnRiaLjPCtPGMzvd-x5VIHcJA&dl=1" -O ensime.tar.gz
tar xzvf ensime.tar.gz -C ~/.emacs.d
mv ~/.emacs.d/ensime_2.10.0-0.9.8.9 ~/.emacs.d/ensime
mkdir ~/.sbt
mkdir ~/.sbt/plugins
echo 'addSbtPlugin("org.ensime" % "ensime-sbt-cmd" % "VERSION")' >> ~/.sbt/plugins/plugins.sbt
