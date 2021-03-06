# Personal .vim files Makefile
#
# Gets all vim plugins and places into appropriate
# folder and then creates symlink to .vimrc

all: vimrc update

plugins: general-plugins python-plugins cpp-plugins go-plugins

general-plugins: nerdtree ctrlp tagbar supertab syntastic fugitive airline vim-gitgutter vim-rooter

python-plugins: flake8

cpp-plugins: omnicppcomplete

go-plugins: vim-go

vimrc:
	ln -sf ~/.vim/.vimrc ~/.vimrc

nerdtree:
	git submodule add https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

ctrlp:
	git submodule add https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim

tagbar:
	git submodule add https://github.com/majutsushi/tagbar.git ~/.vim/bundle/tagbar

supertab:
	git submodule add https://github.com/ervandew/supertab.git ~/.vim/bundle/supertab

syntastic:
	git submodule add https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic

fugitive:
	git submodule add https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive

flake8:
	git submodule add https://github.com/nvie/vim-flake8.git ~/.vim/bundle/vim-flake8

vim-go:
	git submodule add https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go

vim-gitgutter:
	git submodule add https://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter

vim-rooter:
	git submodule add https://github.com/airblade/vim-rooter.git ~/.vim/bundle/vim-rooter

omnicppcomplete:
	curl -o omnicppcomplete-0.41.zip http://www.vim.org/scripts/download_script.php?src_id=7722
	unzip -o omnicppcomplete-0.41.zip -d ~/.vim
	rm omnicppcomplete-0.41.zip

airline:
	git submodule add https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
	git submodule add https://github.com/powerline/fonts.git /tmp/airline-fonts
	bash /tmp/airline-fonts/install.sh

neovim:
	ln -s ~/.vim ~/.config/nvim
	ln -s ~/.vimrc ~/.config/nvim/init.vim

update:
	git pull --recurse-submodules

clean:
	rm -rf ~/.vim/bundle
