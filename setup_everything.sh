#!/bin/bash
#this should probably be a makefile? or some other way of specifying a dependency graph.

#beginning packages
sudo apt-get update &> loginit1
sudo apt-get dist-upgrade -yq &> loginit2

#Depends on nothing, others depend on
bash version_control_setup.sh &> logvcsetup
bash install_utilities.sh &> logiutil
bash install_java.sh &> logijava

#Depends on nothing
bash ssh_setup.sh &> logssh
bash install_d.sh &> logid
sudo bash install_emacs.sh &> logiemacs
bash install_haskell.sh &> logihaskell
bash install_lua.sh &> logilua
bash install_ocaml.sh &> logiocaml
bash install_python.sh &> logipython

#Depends on vc, util, java
bash bash_setup.sh &> logbash
bash emacs_setup.sh &> logemacs
#bash install_clojure.sh #TODO: after altering check if this is still ok location
sudo bash install_erlang.sh &> logierlang
sudo bash install_go.sh &> logigo
bash install_node.sh &> loginode
bash install_scala.sh &> logiscala
bash install_ruby.sh &> logiruby

#Depends on more
source ~/.rvm/scripts/rvm
bash install_css_stuff.sh &> logicss

#has interaction at end
bash install_common_lisp.sh &> logicl
sudo shutdown -r now
