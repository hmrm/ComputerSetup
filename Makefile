ifndef COMPSETINSTUSERNAME
COMPSETINSTUSERNAME := $(shell read -p "User name: " REPLY; echo $$REPLY ; fi )
endif

.PHONY: install languages libraries
.PHONY: vim vimrc install_vim emacs dotemacs install_emacs emacs_setup
.PHONY: bash_core bash bash_aliases bashrc dotprofile dircolors xmodmap ssh install_ssh ssh_setup screenrc
.PHONY: versioncontrol install_versioncontrol versioncontrol_setup git-prompt
.PHONY: graphical_programs ubuntu_clean_install ubuntu_cleanup background_ubuntusimple gnome gnome_setup install_sublime install_chrome
.PHONY: install_utilities css_utilities install_less 
.PHONY: install_clojure install_common_lisp install_django install_d install_erlang install_go install_haskell install_java install_lua install_node install_numpy install_ocaml install_python install_rails install_ruby install_sass install_scala
.PHONY: dns_server dns_client install_dns

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

#not included in default install
install_rtorrent:
	bash install/rtorrent.sh

#not included in default install
install_dns:
	bash install/dns.sh

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
	bash setup/background_ubuntu_simple.sh $(COMPSETINSTUSERNAME)

gnome_setup: install_utilities
	bash setup/gnome.sh

ssh_setup: install_utilities
	bash setup/ssh.sh

versioncontrol_setup: install_versioncontrol
	bash setup/versioncontrol.sh

#utility targets for specific services. Not currently included in the default install
#not included in default install
rtorrent: install_rtorrent
	bash setup/setup_rtorrent.sh $(COMPSETINSTUSERNAME)

#one or the other, but not both of these, should be invoked. dns_server expects host records to be in ~/addl_hosts
#not included in default install
dns_server: install_dns
	bash setup/dns_server.sh $(COMPSETINSTUSERNAME)

#not included in default install
dns_client: install_dns
	bash setup/dns_client.sh

#not included in default install
ftp_server:
	bash install/ftp.sh

#not included in default install
media_players:
	bash install/media_players.sh
