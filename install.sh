#########################################################################
# File Name: install.sh
# Author: lk1ngaa7
# mail: lk1ngaa7@gmail.com
# Created Time: Tue Oct  4 17:28:55 2016
#########################################################################
#!/bin/bash
if [ ! -d `eval echo ~/.vim` ]; then
	mkdir ~/.vim
fi
if [ ! -d `eval echo ~/.vim/doc` ]; then
	mkdir ~/.vim/doc
fi
cd solarized && cp -rf ./* ~/.vim/ && echo 'solarized succceed' 
cd .. && cd vimcdoc-1.9.0 && sh vimcdoc.sh -i && echo "vim chinese doc install succeed" 

