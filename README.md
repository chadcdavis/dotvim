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

UPKEEP of Bundles
-----------------
git pull in each bundle -or- from the base dir 'git submodule foreach git pull origin master'

Then just git add .; git commit from the top.

Changing things in a bundle is fine; you'll have to deal with any conflicts from updates, but just commit back from the top. (In other words, we obviously don't want to make changes and try to commit from the bundle's directory to the bundle's repo, not that we could anyway.)
