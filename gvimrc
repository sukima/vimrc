" GVIM rc $Revision$
set mousehide
set guioptions=agmlrbtT

" Remove the Buffer menu <M-b> accelerator.
let no_buffers_menu = 1

" Add in gvimrc because this program requires X (Not used)
"nmenu 20.422 &Edit.Spell\ Check		:w<Bar>!gaspell %<Cr>:e<Cr>

set lines=40
if &diff
    set columns=140
else
    set columns=80
endif

" Fixes coloring bug when gvim opened from a dark term.
syntax clear
set background=light
highlight Normal guibg=#ffffe6 " Change the bgcolor.
syntax on

" start gui with a standard size. (in case the calling term is not 80x25)
if has ("gui_win32")
    set guifont=Courier\ New:h8
elseif has ("gui_mac")
    set guifont=Monaco:h12
    set listchars+=tab:ии
    " MacVIM bombs when you use the bottom scroll bar.
    set guioptions-=b
    winpos 75 50
    " Since there is no command-line here let's allow a start page.
    cd ~/
    command Home edit ~/
    edit ~/
else
    set guifont=-adobe-courier-medium-r-normal-*-*-120-*-*-m-*-iso8859-1
    set toolbar-=tooltips
endif
