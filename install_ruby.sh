#!/bin/bash
\curl -L https://get.rvm.io | bash -s stable --ruby
source ~/.rvm/scripts/rvm
rvm pkg install openssl
rvm reinstall all --force
gem install rails
