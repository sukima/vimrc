" GVIM rc $Revision$

" Section: Options {{{1
set mousehide
set guioptions=agmrbtT
set listchars+=tab:¨≠
set nohlsearch

" Section: Syntax Highlighting {{{1 
" Fixes coloring bug when gvim opened from a dark term.
set background=light
highlight Normal guibg=#ffffe6 " Change the bgcolor.
syntax enable

" Section: OS Specifics {{{1
" Standard Sizing {{{2
" start gui with a standard size. (in case the calling term is not 80x25)
set lines=45
if &diff
    set columns=140
else
   " 80 plus the 9 for the numbers in 'set nu' plus 2 for foldcolumn
    set columns=91
endif

" Windows Based Platforms {{{2 
if has ("gui_win32") " Imfamous Win Hell
    " Windows PocketPC Only {{{
    " Vim on PocketPC requires CeLib which sets $CELIBVERSION
    if exists("$CELIBVERSION")
	" Options {{{
	set guioptions=lb
	set nonumber
	set laststatus=0	" Never have a status line
	set noshowmatch
	set noshowcmd
	set foldcolumn=0
	" force swapfiles to temp folder on main memory for better performance.
	set directory=/Temp
	set updatecount=50
	" On PocketPC 'set guifont' adds 2 lines.
	set lines=11
	set columns=37
	" }}} 
	" MessagEase maps {{{
	inoremap <C-z> <Esc>
	inoremap <C-x> <Esc>
	vnoremap <C-z> <Esc>
	vnoremap <C-x> <Esc>
	" move display to the top for ease with Big MessagEase
	" (south of 'S' is ^[ or <Esc>
	inoremap ∞ <C-o>zt
	inoremap <PageUp> <C-p>
	inoremap <PageDown> <C-n>
	noremap <M-a> :w<Cr>:mksession! /Session.vim<Cr>:qa<Cr>
	noremap <M-r> :so /Session.vim<Cr>:set lines=11<Cr>:set guifont=Courier\ New:h8<Cr>
	noremap <M-d> :call delete("/Session.vim")<Cr>
	noremap <M-q> :confirm qa<Cr>
	noremap <C-z> :w<Cr>
	noremap <C-x> :w<Cr>
	" }}}
    endif " }}}
    set guifont=Courier\ New:h8

" Mac OS {{{2
elseif has ("gui_mac") " My Mac OS X Aqua Baby!
    set guifont=Monaco:h12
    set listchars+=tab:……
    " MacVIM bombs when you use the bottom scroll bar.
    set guioptions-=b
    " Mac don't have a right mouse button
    map <C-LeftMouse> <RightMouse>
    winpos 75 50
    " Since there is no command-line here let's allow a start page.
    command Home edit ~/
    if (argc() == 0) " only show a directory list if no files were passed in.
	cd ~/
	Explore .
    endif
" Other (Unix) {{{2
else " Gata be Unix now (My Favorite!)
    " This is a gvimrc so we are in a GUI and the only GUI in Unix is X!
    " However the default X font in darwin (Mac OS X) is poor. We will
    " Use a better one on OS X.
    " FIXME: However the ability to detect an X11 version running on OS X is
    " difficult (All has("mac") fails only has("unix") works) we have to do a
    " pretty dirty hack.
    if filereadable("/System/Library/CoreServices/System") " Mac OS X
	set guifont=Monaco\ 12
    else
	set guifont=-adobe-courier-medium-r-normal-*-*-120-*-*-m-*-iso8859-1
    endif
    set toolbar-=tooltips
endif

" Prepare Script Options {{{1
" Turn off the buffer menu
let no_buffers_menu=1

" }}}1

" vim600: set foldmethod=marker :
