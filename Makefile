
TARGET=~

vim:
	ln -sf $(CURDIR)/.vim $(TARGET)/.vim
	ln -sf $(CURDIR)/.vimrc $(TARGET)/.vimrc
	vim +PluginInstall +qall
	-echo 'If any plugins need additional steps (like YCM), do them now'

git:
	ln -sf $(CURDIR)/.gitconfig $(TARGET)/.gitconfig

gdb:
	ln -sf $(CURDIR)/.gdbinit $(TARGET)/

bash:
	ln -sf $(CURDIR)/.prompt $(TARGET)/.prompt
	ln -sf $(CURDIR)/.bashrc $(TARGET)/.bashrc
