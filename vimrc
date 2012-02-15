" to disable pathogen plugins, add them here
let g:pathogen_disabled = []

" disable plugins when not running gui vim
if !has('gui_running')
    call add(g:pathogen_disabled, 'xdebug')
endif

let mapleader=','
call pathogen#infect()

" ------------------------------------------------------------------------------
" In Testing
" ------------------------------------------------------------------------------

" spacebar mapping to something useful
map <SPACE> <C-W><C-W>

" Gundo toggle
map <Leader>g :GundoToggle<CR>

" ------------------------------------------------------------------------------


" ------------------------------------------------------------------------------
" Misc mappings I dig
" ------------------------------------------------------------------------------

" ScratchOpen
map <Leader>s :ScratchOpen<CR>

" reveal current file in NERDTree
map <LEADER>f :NERDTreeFind<CR>

" TagBarToggle... "c" for "class"
map <Leader>c :TagbarToggle<CR>

" Make
map <Leader>m :make<CR>
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" LB Core stuff
" ------------------------------------------------------------------------------
ab lblog LB_Reef_Helper_Log::log ();<LEFT><LEFT>

set nocompatible
set ruler

" Bigger history
set history=1000

" Whitespace stuff
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set list listchars=tab:\ \ ,trail:·

" Status bar
set laststatus=2

" Set encoding
set encoding=utf-8

set visualbell

" Swap the ` and ' for marker jumping
" nnoremap ' `
" nnoremap ` '

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Splits
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
set wmh=0

" Scrolling 
set scroll=3
set scrolloff=3
map <C-U> kkk
map <C-D> jjj


" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Hammer<CR>
endfunction

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Filetypes
au BufNewFile,BufRead *.{code,view,phtml} set filetype=php.html

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

au BufRead,BufNewFile *.txt call s:setupWrapping()

syntax on
filetype plugin indent on

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" gist-vim defaults
if has("mac")
  let g:gist_clip_command = 'pbcopy'
elseif has("unix")
  let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Use modeline overrides
set modeline
set modelines=10

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Turn off jslint errors by default
let g:JSLintHighlightErrorLine = 0

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" Show (partial) command in the status line
set showcmd

" statusline Stuff
" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" format markers:
"   %< truncation point
"   %n buffer number
"   %f relative path to file
"   %m modified flag [+] (modified), [-] (unmodifiable) or nothing
"   %r readonly flag [RO]
"   %y filetype [ruby]
"   %= split point for left and right justification
"   %-35. width specification
"   %l current line number
"   %L number of lines in buffer
"   %c current column number
"   %V current virtual column number (-n), if different from %c
"   %P percentage through buffer
"   %) end of width specification
"   %{fugitive#statusline()}

" Base Statusline
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
" Add Fugitive if it's loaded
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}


" vimrc editing
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif
