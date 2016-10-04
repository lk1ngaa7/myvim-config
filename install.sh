#########################################################################
# File Name: install.sh
# Author: lk1ngaa7
# mail: lk1ngaa7@gmail.com
# Created Time: Tue Oct  4 17:28:55 2016
#########################################################################
#!/bin/bash
if [!-d "~/.vim"]; then
	mkdir ~/.vim
fi
if [!-d "~/.vim/plugin" ]; then
	mkdir ~/.vim/pulgin
fi
if [!-d "~/.vim/doc"]; then
	mkdir ~/.vim/doc
fi
cp ~/.vimrc ~/.vimrc_back && cp vimrc ~/.vimrc
cd solarized && cp -rf ./* ~/.vim/ && cd .. && cd vimcdoc-1.9.0 && sh vimcdoc.sh -i &&cd plugin/NERD_commenter/ && cp -f NERD_commenter.vim ~/.vim/plugin && cp -f NERD_commenter.txt ~/.vim/doc

