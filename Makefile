ifndef COMPSETINSTUSERNAME
COMPSETINSTUSERNAME := $(shell read -p "User name: " REPLY; echo $$REPLY ; fi )
endif

.PHONY: ubuntu_clean_install install gnome languages libraries graphical_programs bash_core bash ssh versioncontrol vim emacs ubuntu_cleanup css_utilities bash_aliases bashrc dircolors dotemacs dotprofile screenrc vimrc xmodmap git-prompt install_chrome install_clojure install_common_lisp install_django install_d install_emacs install_erlang install_go install_haskell install_java install_less install_lua install_node install_numpy install_ocaml install_python install_rails install_ruby install_sass install_scala install_ssh install_sublime install_utilities install_versioncontrol install_vim emacs_setup background_ubuntusimple gnome_setup ssh_setup versioncontrol_setup

#Full installation options
ubuntu_clean_install: ubuntu_cleanup background_ubuntusimple install

install: gnome languages libraries bash graphical_programs

#Utility Targets
gnome: install_utilities gnome_setup

languages: install_clojure install_common_lisp install_d install_erlang install_go install_haskell install_java install_lua install_node install_python install_ocaml install_ruby install_scala install_utilities

libraries: install_django install_rails css_utilities install_numpy

graphical_programs: install_chrome install_sublime

bash_core: bash_aliases bashrc dircolors dotprofile screenrc git-prompt

bash: bash_core vim emacs ssh versioncontrol install_utilities

ssh: install_ssh ssh_setup

versioncontrol: install_versioncontrol versioncontrol_setup

vim: vimrc install_vim

emacs: dotemacs install_emacs emacs_setup xmodmap

ubuntu_cleanup:
	bash get_rid_of_stuff.sh $(COMPSETINSTUSERNAME)

css_utilities: install_less install_sass

#Dotfile Targets
bash_aliases: install_emacs install_chrome install_utilities install_python
	cp -v dotfiles/DOTbash_aliases /home/$(COMPSETINSTUSERNAME)/.bash_aliases

bashrc: install_emacs git-prompt install_ruby
	cp -v dotfiles/DOTbashrc /home/$(COMPSETINSTUSERNAME)/.bashrc

dircolors:
	cp -v dotfiles/DOTdircolors /home/$(COMPSETINSTUSERNAME)/.dircolors

dotemacs: install_emacs emacs_setup
	cp -v dotfiles/DOTemacs /home/$(COMPSETINSTUSERNAME)/.emacs

dotprofile: xmodmap
	cp -v dotfiles/DOTprofile /home/$(COMPSETINSTUSERNAME)/.profile

screenrc:
	cp -v dotfiles/DOTscreenrc /home/$(COMPSETINSTUSERNAME)/.screenrc

vimrc: install_utilities install_vim
	cp -v dotfiles/DOTvimrc /home/$(COMPSETINSTUSERNAME)/.vimrc

xmodmap:
	cp -v dotfiles/DOTxmodmap /home/$(COMPSETINSTUSERNAME)/.xmodmap

#installation targets
git-prompt: install_versioncontrol
	$(MAKE) -C git-prompt
	$(MAKE) -C git-prompt install
	cp -vr git-prompt /home/$(COMPSETINSTUSERNAME)

install_chrome: install_utilities
	bash install/chrome.sh

install_clojure: install_utilities install_java
	bash install/clojure.sh

install_common_lisp: install_utilities install_versioncontrol
	bash install/common_lisp.sh $(COMPSETINSTUSERNAME)

install_django: install_python
	bash install/django.sh

install_d:
	bash install/d.sh

install_emacs:
	bash install/emacs.sh

install_erlang: install_versioncontrol install_utilities
	bash install/erlang.sh

install_go: install_versioncontrol install_utilities
	bash install/go.sh

install_haskell: 
	bash install/haskell.sh $(COMPSETINSTUSERNAME)

install_java:
	bash install/java.sh

install_less: install_node
	bash install/less.sh

install_lua:
	bash install/lua.sh

install_node: install_versioncontrol install_utilities
	bash install/node.sh

install_numpy: install_python
	bash install/numpy.sh

install_ocaml:
	bash install/ocaml.sh

install_python:
	bash install/python.sh

install_rails: install_ruby install_utilities
	su $(COMPSETINSTUSERNAME) -c "gem install rails"

install_ruby: install_utilities versioncontrol_setup
	bash install/ruby.sh $(COMPSETINSTUSERNAME)
	source /home/.rvm/scripts/rvm

install_sass: install_ruby
	su $(COMPSETINSTUSERNAME) -c "gem install sass"

install_scala: install_utilities install_java
	bash install/scala.sh $(COMPSETINSTUSERNAME)

install_ssh:
	bash install/ssh.sh

install_sublime:
	bash install/sublime.sh

install_utilities:
	bash install/utilities.sh

install_versioncontrol:
	bash install/versioncontrol.sh

install_vim:
	bash install/vim.sh

#setup targets
emacs_setup: install_emacs install_versioncontrol install_utilities
	bash setup/emacs.sh

background_ubuntusimple: install_utilities
	bash setup/background_ubuntu_simple.sh

gnome_setup: install_utilities
	bash setup/gnome.sh

ssh_setup: install_utilities
	bash setup/ssh.sh

versioncontrol_setup: install_versioncontrol
	bash setup/versioncontrol.sh

