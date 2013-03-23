#!/bin/bash
sudo apt-get install openssh-client openssh-server -yq;
ssh-keygen -t rsa
#TODO: setup a separate probably-gist for this
cat ~/.ssh/id_rsa.pub >> publickeys
git add publickeys
git commit -m "added new key for new machine"
git push origin master
