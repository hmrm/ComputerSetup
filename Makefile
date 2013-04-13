ifndef USERNAME
USERNAME := $(shell read -p "User name: " REPLY; echo $$REPLY ; fi )
endif

.PHONY: utils versioncontrol bash vimrc vim git-prompt

ubuntu_cleanup:
	bash get_rid_of_stuff.sh $(USERNAME)

bash_aliases: install_emacs install_chrome install_utilities install_python
	cp -v dotfiles/DOTbash_aliases /home/$(USERNAME)/.bash_aliases

bashrc: install_emacs git-prompt install_ruby
	cp -v dotfiles/DOTbashrc /home/$(USERNAME)/.bashrc

dircolors:
	cp -v dotfiles/DOTdircolors /home/$(USERNAME)/.dircolors

dotemacs: install_emacs emacs_setup
	cp -v dotfiles/DOTemacs /home/$(USERNAME)/.emacs

dotprofile: xmodmap
	cp -v dotfiles/DOTprofile /home/$(USERNAME)/.profile

screenrc:
	cp -v dotfiles/DOTscreenrc /home/$(USERNAME)/.screenrc

vimrc: install_latex install_vim vim_setup
	cp -v dotfiles/DOTvimrc /home/$(USERNAME)/.vimrc

xmodmap:
	cp -v dotfiles/DOTxmodmap /home/$(USERNAME)/.xmodmap

git-prompt: install_versioncontrol
	$(MAKE) -C git-prompt
	$(MAKE) -C git-prompt install
	cp -vr git-prompt /home/$(USERNAME)

install_chrome: install_utilities
	bash install/install_chrome.sh

install_clojure: install_utilities install_java
	bash install/install_clojure.sh

install_common_lisp: install_utilities install_versioncontrol
	bash install/install_common_lisp.sh $(USERNAME)

install_django: install_python
	bash install/install_django.sh

install_d:
	bash install/install_d.sh

install_emacs:
	bash install/install_emacs.sh

install_erlang: install_versioncontrol install_utilities
	bash install/install_erlang.sh

install_go: install_versioncontrol install_utilities
	bash install/install_go.sh

install_haskell: 
	bash install/install_haskell.sh $(USERNAME)

install_java:
	bash install/install_java.sh

install_less: install_node
	bash install/install_less.sh

install_lua:
	bash install/install_lua.sh

install_node: install_versioncontrol install_utilities
	bash install/install_node.sh

install_numpy: install_python
	bash install/install_numpy.sh

install_ocaml:
	bash install/install_ocaml.sh

install_python:
	bash install/install_python.sh

install_rails: install_ruby install_utilities
	su $(USERNAME) -c "gem install rails"

install_utilities:
	bash install/install_utilities.sh

install_versioncontrol:
	bash setup/version_control_setup.sh

bash: utils versioncontrol
	bash setup/bash_setup.sh

vim:
	bash setup/vim_setup.sh

sass: ruby
	bash install/install_sass.sh

less: node
	bash install/install_less.sh

cssutils: sass less
