#!/bin/bash
#TODO: see if there's a way not to hard code the version number
wget http://www.scala-lang.org/downloads/distrib/files/scala-2.10.1.tgz -O scala.tgz
tar xzvf scala.tgz -C ~
mv ~/scala-2.10.1 ~/.scala

#installing sbt
wget http://scalasbt.artifactoryonline.com/scalasbt/sbt-native-packages/org/scala-sbt/sbt//0.12.2/sbt.deb
sudo dpkg -i sbt.deb

