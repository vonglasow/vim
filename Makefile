GREP := grep
VGREP:= $(GREP) -Ev
AWK  := awk
SORT := sort

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	PR   := pr --omit-pagination --width=80 --columns=4
	GREPSTRING := Makefile
endif
ifeq ($(UNAME_S),Darwin)
	PR   := pr -4 -t -w 80
	GREPSTRING := 'Makefile|0x1F5:0:9'
endif

help:
	@make -pq | 									\
	$(VGREP) $(GREPSTRING) |						\
	$(AWK) '/(^[^.%][-A-Za-z0-9_]*):/ 				\
		{ print substr($$1, 1, length($$1)-1) }' | 	\
	$(SORT) | $(PR)

all: vim

vim: /usr/bin/cmake ~/.vimrc ~/.vim

/usr/bin/cmake:
	sudo apt install cmake

~/.vimrc:
	ln -s $(CURDIR)/vimrc $@

~/.vim:
	@echo 'Deploy vim config'
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
	cd ~/.vim/bundle/YouCompleteMe && ./install.py

remove-vim:
	@echo 'Remove Vim config'
	rm -rf ~/.vimrc
	rm -rf ~/.vim

clean: remove-vim

.PHONY: clean help remove-vim
