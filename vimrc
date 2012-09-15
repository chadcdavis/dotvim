" to disable pathogen plugins, add them here
let g:pathogen_disabled = []

" Powerline Fancify
let g:Powerline_symbols = 'fancy'

" disable plugins when not running gui vim
if !has('gui_running')
    call add(g:pathogen_disabled, 'xdebug')
    call add(g:pathogen_disabled, 'powerline')
endif

let mapleader=','
call pathogen#infect()
call pathogen#helptags()

" ------------------------------------------------------------------------------
" In Testing
" ------------------------------------------------------------------------------
"
" %% in the commandline resolves to the directory of the currently active
" buffer
cnoremap %% <C-R>=expand('%:p:h').'/'<cr>

" Prepopulate a global search-and-replace with the current word under the
" cursor
nnoremap <C-s> :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" ------------------------------------------------------------------------------


" ------------------------------------------------------------------------------
" Misc mappings
" ------------------------------------------------------------------------------

" ScratchOpen
map <Leader>s :ScratchOpen<CR>

" Make
map <Leader>m :make<CR>

" Quick FT Overrides
map <leader><leader>h :set ft=html<CR>
map <leader><leader>p :set ft=php<CR>
map <leader><leader>j :set ft=javascript<CR>

" clear search highlighting
noremap <silent><Leader>/ :nohls<CR>

" ------------------------------------------------------------------------------


" ------------------------------------------------------------------------------
" Time
" ------------------------------------------------------------------------------
nnoremap <Leader>h :exe ":sp ~/Dropbox/time/" . strftime("%Y-%m-%d") . ".txt"<CR>


" ------------------------------------------------------------------------------
" Abbreviations
" ------------------------------------------------------------------------------
iab lblog LB_Reef_Helper_Log::log ( );<LEFT><LEFT><LEFT>
iab ylog ylog ( );<LEFT><LEFT><LEFT>
iab pecho <?php echo ?><LEFT><LEFT><LEFT>


" ------------------------------------------------------------------------------
" Tagbar
" ------------------------------------------------------------------------------
map <Leader>c :TagbarToggle<CR>
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1


" ------------------------------------------------------------------------------
" Gundo
" ------------------------------------------------------------------------------
" let g:gundo_width=500
" let g:gundo_preview_height=30 

" toggle
map <Leader>g :GundoToggle<CR>

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

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" ------------------------------------------------------------------------------
" NERDTree
" ------------------------------------------------------------------------------
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
let NERDTreeChDirMode=2 " automatically CWD to whatever NERDTree root is
map <Leader>n :NERDTreeToggle<CR>
map <LEADER>f :NERDTreeFind<CR>

" ------------------------------------------------------------------------------
" ACK
" ------------------------------------------------------------------------------
let g:ackprg="ack -i -H --nocolor --nogroup --column --type-add=php=.view,.code --type-set=liquid=.liquid --type-set=json=.json"

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Splits
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
set wmh=0

" Scrolling 
set scroll=5
set scrolloff=5
map <C-U> kkkkk
map <C-D> jjjjj


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
"au BufNewFile,BufRead *.{code,view,phtml} set filetype=php.html
au BufNewFile,BufRead *.{code,view,phtml} set filetype=php
au BufNewFile,BufRead *.{kml} set filetype=xml

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

" Syntastic Settings
" let g:syntastic_enable_signs=1 " Use signs to 
" let g:syntastic_quiet_warnings=1 " If only warnings are detected, don't show them

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
