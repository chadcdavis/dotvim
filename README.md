Organization
------------

This organization is based off of [Vim Casts #27: Synchronizing plugins with git submodules and pathogen] [vc]. I like to keep my vimstuff in Dropbox and link into the distribution there so any changes are automatically synced to different machines. If I just kept everything in Github then I'd have to be mindful to pull changes & update submodules when moving between machines.

[vc]: http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

~/Dropbox/chadcdavis_dotvim == github.com:chadcdavis/dotvim 

Symlinks
-------

* ` ~/.vimrc  -> ~/Dropbox/chadcdavis_dotvim/vimrc`
*  `~/.gvimrc -> ~/Dropbox/chadcdavis_dotvim/gvimrc`
*  `~/.vim    -> ~/Dropbox/chadcdavis_dotvim`

Additions
---------

Add packages as git submodule pathogen bundles

`git submodule add https://github.com/tpope/vim-fugitive.git bundle/fugitive`

`git submodule init && git submodule update`

