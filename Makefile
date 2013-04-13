ifndef USERNAME
USERNAME := $(shell read -p "User name: " REPLY; echo $$REPLY ; fi )
endif

.PHONY: utils versioncontrol bash vimrc vim git-prompt

ubuntu_cleanup:
	bash get_rid_of_stuff.sh $(USERNAME)

bash_aliases:
	cp -v dotfiles/DOTbash_aliases /home/$(USERNAME)/.bash_aliases

bashrc:
	cp -v dotfiles/DOTbashrc /home/$(USERNAME)/.bashrc

dircolors:
	cp -v dotfiles/DOTdircolors /home/$(USERNAME)/.dircolors

dotemacs:
	cp -v dotfiles/DOTemacs /home/$(USERNAME)/.emacs

dotprofile:
	cp -v dotfiles/DOTprofile /home/$(USERNAME)/.profile

screenrc:
	cp -v dotfiles/DOTscreenrc /home/$(USERNAME)/.screenrc

vimrc:
	cp -v dotfiles/DOTvimrc /home/$(USERNAME)/.vimrc

xmodmap:
	cp -v dotfiles/DOTxmodmap /home/$(USERNAME)/.xmodmap

git-prompt: versioncontrol
	$(MAKE) -C git-prompt
	$(MAKE) -C git-prompt install

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

sass: ruby
	bash install/install_sass.sh

less: node
	bash install/install_less.sh

cssutils: sass less
