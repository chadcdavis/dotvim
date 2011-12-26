call pathogen#infect()


syntax on
filetype plugin indent on
set visualbell

" Splits
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
set wmh=0

" Adding Filetypes
au BufNewFile,BufRead *.code set filetype=php
au BufNewFile,BufRead *.view set filetype=php
