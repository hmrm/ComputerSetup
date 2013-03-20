#!/bin/bash
wget http://www.scala-lang.org/downloads/distrib/files/scala-2.10.1.tgz -O scala.tgz
tar xzvf scala.tgz -C ~
mv ~/scala ~/.scala

#installing sbt
wget http://scalasbt.artifactoryonline.com/scalasbt/sbt-native-packages/org/scala-sbt/sbt//0.12.2/sbt.deb
sudo dpkg -i sbt.deb

#installing ensime
wget "https://dl.dropbox.com/sh/ryd981hq08swyqr/ZiCwjjr_vm/ENSIME%20Releases/ensime_2.10.0-0.9.8.9.tar.gz?token_hash=AAHpPjuDRijzZt1Qhvh6BJnRiaLjPCtPGMzvd-x5VIHcJA&dl=1" -O ensime.tar.gz
tar xzvf ensime.tar.gz -C ~/.emacs.d
echo 'addSbtPlugin("org.ensime" % "ensime-sbt-cmd" % "VERSION")' >> ~/.sbt/plugins/plugins.sbt
