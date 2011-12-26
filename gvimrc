if (has("win32"))
		set guifont=Meslo_LG_M_DZ:h9:cANSI
		map <F11> <ESC>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
elseif (has("macunix"))
		set guifont=Menlo\ Regular:h13
endif

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
