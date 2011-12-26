if (has("win32"))
	set guifont=Meslo_LG_M_DZ:h9:cANSI
	map <F11> <ESC>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
elseif (has("gui_macvim"))
	set guifont=Menlo\ Regular:h13
	" Fullscreen takes up entire screen
	set fuoptions=maxhorz,maxvert
	" Command-Return for fullscreen
	macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>
	" Command-Shift-F for Ack
	map <D-F> :Ack!<space>
	" Command-e for ConqueTerm
	map <D-e> :call StartTerm()<CR>
  " Command-][ to increase/decrease indentation
  vmap <D-]> >gv
  vmap <D-[> <gv
endif

" Start without the toolbar
set guioptions-=T

" Move to vimrc?
" Adjust viewports to the same size
map <Leader>= <C-w>=
imap <Leader>= <Esc> <C-w>=


" ConqueTerm wrapper
function StartTerm()
  execute 'ConqueTerm ' . $SHELL . ' --login'
  setlocal listchars=tab:\ \ 
endfunction

" COLORS
" Darks / Mids
" color molokai
" color desert
" color blackboard
" color vibrantink
" color vividchalk
" color darkblue2
" color freya
" color tango
" color vwilight
set background=dark
color solarized

" Lights
" color eclipse
" color github
" color nuvola
" color soso

" NERDTree Stuff
if exists("loaded_nerd_tree")
  autocmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
  autocmd FocusGained * call s:UpdateNERDTree()
endif

" If the parameter is a directory, cd into it
function s:CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . fnameescape(a:directory)
  endif

  " Allows reading from stdin
  " ex: git diff | mvim -R -
  if strlen(a:directory) == 0 
    return
  endif

  if directory
    NERDTree
    wincmd p
    bd
  endif

  if explicitDirectory
    wincmd p
  endif
endfunction

" NERDTree utility function
function s:UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      end
    endif
  endif

  if exists(":CommandTFlush") == 2
    CommandTFlush
  endif
endfunction

