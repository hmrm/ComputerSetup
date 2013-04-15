#!/bin/bash
#intended to be run sudo
git clone git://github.com/erlang/otp.git
cd otp
export ERL_TOP=$PWD
export PATH=$ERL_TOP/bin:$PATH
./otp_build autoconf
./configure
make
make install
cd ..
