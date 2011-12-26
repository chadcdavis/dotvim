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

" Colors
" Darks / Mids
" color molokai
" color desert
" color blackboard
" color vibrantink
" color vividchalk
" color darkblue2
" color freya
" color tango
color vwilight

"color solarized
"set background=light

" Lights
" color eclipse
" color github
" color nuvola
" color soso
