ifndef USERNAME
USERNAME := $(shell read -p "User name: " REPLY; echo $$REPLY ; fi )
endif

.PHONY: utils versioncontrol bash vimrc vim git-prompt

ubuntu_cleanup:
	bash get_rid_of_stuff.sh $(USERNAME)

utils:
	bash install/install_utilities.sh

versioncontrol:
	bash setup/version_control_setup.sh

bash: utils versioncontrol
	bash setup/bash_setup.sh

vimrc: vim
	cp dotfiles/DOTvimrc ~/.vimrc

vim:
	bash setup/vim_setup.sh

git-prompt: versioncontrol
	$(MAKE) -C git-prompt
	$(MAKE) -C git-prompt install

sass: ruby
	bash install/install_sass.sh

less: node
	bash install/install_less.sh

cssutils: sass less
