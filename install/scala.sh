#!/bin/bash
wget http://apt.typesafe.com/repo-deb-build-0002.deb
dpkg -i repo-deb-build-0002.deb
apt-get update
apt-get install sbt
