#!/bin/bash
#oracle is really annoying
add-apt-repository ppa:webupd8team/java -y
apt-get update
apt-get-install oracle-java6-installer oracle-java7-installer oracle-java8-installer -yq
apt-get install oracle-java7-set-default -yq
