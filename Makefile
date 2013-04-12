.PHONY: utils versioncontrol bash vimrc vim git-prompt

utils:
	bash install/install_utilities.sh

bash: utils versioncontrol
	bash setup/bash_setup.sh

vimrc: vim
	cp dotfiles/DOTvimrc ~/.vimrc

vim:
	bash setup/vim_setup.sh

git-prompt: versioncontrol
	$(MAKE) -C git-prompt
	$(MAKE) -C git-prompt install
