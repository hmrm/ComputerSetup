#!/bin/bash
#this should probably be a makefile? or some other way of specifying a dependency graph.

#Depends on nothing, others depend on
bash version_control_setup.sh
bash install_utilities.sh
bash install_java.sh

#Depends on nothing
bash ssh_setup.sh
bash install_d.sh
sudo bash install_emacs.sh
bash install_haskell.sh
bash install_lua.sh
bash install_ocaml.sh
bash install_python.sh

#Depends on vc, util, java
bash bash_setup.sh
bash emacs_setup.sh
bash install_clojure.sh #TODO: after altering check if this is still ok location
bash install_common_lisp.sh
sudo bash install_erlang.sh
sudo bash install_go.sh
bash install_node.sh
bash install_scala.sh
bash install_ruby.sh

#Depends on more
bash install_css_stuff.sh
