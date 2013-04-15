#!/bin/bash
apt-get purge ruby rubygems -yq
su $1
\curl -L https://get.rvm.io | bash -s stable --ruby
source ~/.rvm/scripts/rvm
rvm pkg install openssl
rvm reinstall all --force
exit
