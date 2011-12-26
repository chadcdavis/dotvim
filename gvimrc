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

" Command-T
let g:CommandTMaxFiles=15000
CommandTFlush

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

" Utility functions to create file commands
function s:CommandCabbr(abbreviation, expansion)
    execute 'cabbrev ' . a:abbreviation . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' . a:expansion . '" : "' . a:abbreviation . '"<CR>'
endfunction

function s:FileCommand(name, ...)
    if exists("a:1")
        let funcname = a:1
    else
        let funcname = a:name
    endif

    execute 'command -nargs=1 -complete=file ' . a:name . ' :call ' . funcname . '(<f-args>)'
endfunction

function s:DefineCommand(name, destination)
    call s:FileCommand(a:destination)
    call s:CommandCabbr(a:name, a:destination)
endfunction

" Public NERDTree-aware versions of builtin functions
function ChangeDirectory(dir, ...)
    execute "cd " . fnameescape(a:dir)
    let stay = exists("a:1") ? a:1 : 1

    NERDTree

    if !stay
        wincmd p
    endif
endfunction

function Touch(file)
    execute "!touch " . shellescape(a:file, 1)
    call s:UpdateNERDTree()
endfunction

function Remove(file)
    let current_path = expand("%")
    let removed_path = fnamemodify(a:file, ":p")

    if (current_path == removed_path) && (getbufvar("%", "&modified"))
        echo "You are trying to remove the file you are editing. Please close the buffer first."
    else
        execute "!rm " . shellescape(a:file, 1)
    endif

    call s:UpdateNERDTree()
endfunction

function Mkdir(file)
    execute "!mkdir " . shellescape(a:file, 1)
    call s:UpdateNERDTree()
endfunction

function Edit(file)
    if exists("b:NERDTreeRoot")
        wincmd p
    endif

    execute "e " . fnameescape(a:file)
ruby << RUBY
    destination = File.expand_path(VIM.evaluate(%{system("dirname " . shellescape(a:file, 1))}))
    pwd         = File.expand_path(Dir.pwd)
    home        = pwd == File.expand_path("~")

    if home || Regexp.new("^" + Regexp.escape(pwd)) !~ destination
        VIM.command(%{call ChangeDirectory(fnamemodify(a:file, ":h"), 0)})
    end
RUBY
endfunction

" Define the NERDTree-aware aliases
if exists("loaded_nerd_tree")
    call s:DefineCommand("cd", "ChangeDirectory")
    call s:DefineCommand("touch", "Touch")
    call s:DefineCommand("rm", "Remove")
    call s:DefineCommand("e", "Edit")
    call s:DefineCommand("mkdir", "Mkdir")
    cabbrev Edit! e!
endif
