#!/bin/bash
#TODO: see if there's a way not to hard code the version number
wget http://www.scala-lang.org/downloads/distrib/files/scala-2.10.1.tgz -O scala.tgz
tar xzvf scala.tgz -C ~
mv ~/scala-2.10.1 ~/.scala

#installing sbt
wget http://scalasbt.artifactoryonline.com/scalasbt/sbt-native-packages/org/scala-sbt/sbt//0.12.2/sbt.deb
sudo dpkg -i sbt.deb

#installing ensime
wget "https://dl.dropbox.com/sh/ryd981hq08swyqr/ZiCwjjr_vm/ENSIME%20Releases/ensime_2.10.0-0.9.8.9.tar.gz?token_hash=AAHpPjuDRijzZt1Qhvh6BJnRiaLjPCtPGMzvd-x5VIHcJA&dl=1" -O ensime.tar.gz
tar xzvf ensime.tar.gz -C ~/.emacs.d
mv ~/.emacs.d/ensime_2.10.0-0.9.8.9 ~/.emacs.d/ensime
mkdir ~/.sbt
mkdir ~/.sbt/plugins
echo 'addSbtPlugin("org.ensime" % "ensime-sbt-cmd" % "VERSION")' >> ~/.sbt/plugins/plugins.sbt
