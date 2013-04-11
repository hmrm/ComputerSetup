#!/bin/bash
#this should probably be a makefile? or some other way of specifying a dependency graph.

#beginning packages
bash get_rid_of_stuff.sh | tee loggetrid
sudo apt-get update 2>&1 | tee loginit1
sudo apt-get dist-upgrade -yq 2>&1 | tee loginit2

#Depends on nothing, others depend on
bash version_control_setup.sh 2>&1 | tee logvcsetup
bash install_utilities.sh 2>&1 | tee logiutil
bash install_java.sh 2>&1 | tee logijava

#Depends on nothing
bash ssh_setup.sh 2>&1 | tee logssh
bash install_d.sh 2>&1 | tee logid
sudo bash install_emacs.sh 2>&1 | tee logiemacs
bash install_haskell.sh 2>&1 | tee logihaskell
bash install_lua.sh 2>&1 | tee logilua
bash install_ocaml.sh 2>&1 | tee logiocaml
bash install_python.sh 2>&1 | tee logipython

#Depends on vc, util, java
bash bash_setup.sh 2>&1 | tee logbash
bash emacs_setup.sh 2>&1 | tee logemacs
bash install_clojure.sh #TODO: after altering check if this is still ok location
sudo bash install_erlang.sh 2>&1 | tee logierlang
sudo bash install_go.sh 2>&1 | tee logigo
bash install_node.sh 2>&1 | tee loginode
bash install_scala.sh 2>&1 | tee logiscala
bash install_ruby.sh 2>&1 | tee logiruby

#Depends on more
source ~/.rvm/scripts/rvm
bash install_css_stuff.sh 2>&1 | tee logicss

#has interaction at end
bash install_common_lisp.sh 2>&1 | tee logicl
sudo shutdown -r now
