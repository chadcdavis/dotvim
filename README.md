Installation
git clone git://github.com/chadcdavis/dotvim.git ~/.vim
git submodule init && git submodule update

ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

Adding packages as git submodule pathogen bundles
git submodule add https://github.com/tpope/vim-fugitive.git bundle/fugitive
