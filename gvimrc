" GVIM rc $Revision$

" Section: Options {{{1
set mousehide
set guioptions=agmlrbtT
set listchars+=tab:¨≠

" Section: Appearance {{{1
set lines=40
if &diff
    set columns=140
else
    " 80 pluss the 9 for the numbers in 'set nu' plus 2 for foldcolumn
    set columns=91
endif

" Section: Syntax Highlighting {{{1 
" Fixes coloring bug when gvim opened from a dark term.
syntax clear
set background=light
highlight Normal guibg=#ffffe6 " Change the bgcolor.
syntax on

" Section: OS Specifics {{{1
" start gui with a standard size. (in case the calling term is not 80x25)
if has ("gui_win32")
    set guifont=Courier\ New:h8
elseif has ("gui_mac")
    set guifont=Monaco:h12
    set listchars+=tab:……
    " MacVIM bombs when you use the bottom scroll bar.
    set guioptions-=b
    winpos 75 50
    " Since there is no command-line here let's allow a start page.
    command Home edit ~/
    if (argc() == 0)
	cd ~/
	edit .
    endif
else
    set guifont=-adobe-courier-medium-r-normal-*-*-120-*-*-m-*-iso8859-1
    set toolbar-=tooltips
endif

" Section: Functionality {{{1
" Remove the Buffer menu <M-b> accelerator.
let no_buffers_menu = 1

"}}}1

" vim600: set foldmethod=marker :
