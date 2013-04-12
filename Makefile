.PHONY vim git-prompt

vimrc: vim
	cp dotfiles/DOTvimrc ~/.vimrc

vim:
	bash setup/vim_setup.sh

git-prompt:
	$(MAKE) -C git-prompt
	$(MAKE) -C git-prompt install
