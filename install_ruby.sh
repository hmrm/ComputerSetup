#!/bin/bash
\curl -L https://get.rvm.io | bash -s stable --ruby
rvm pkg install openssl
rvm reinstall all --force
gem install rails
