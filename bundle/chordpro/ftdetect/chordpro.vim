autocmd BufNewFile,BufRead *.pro,*.chordpro
      \ if &ft =~# '^\%(conf\|modula2\)$' |
      \   set ft=chordpro |
      \ else |
      \   setf chordpro |
      \ endif
