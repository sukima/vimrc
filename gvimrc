" GVIM rc $Revision$
set mousehide
set guioptions=agmlrbtT

" Remove the Buffer menu <M-b> accelerator.
let no_buffers_menu = 1

" Add in gvimrc because this program requires X (Not used)
"nmenu 20.422 &Edit.Spell\ Check		:w<Bar>!gaspell %<Cr>:e<Cr>

" start gui with a standard size. (in case the calling term is not 80x25)
if has ("gui_win32")
    set guifont=Courier\ New:h8
elseif has ("gui_mac")
    set guifont=Monaco:h12
    winpos 75 50
else
    set guifont=-adobe-courier-medium-r-normal-*-*-120-*-*-m-*-iso8859-1
endif
set lines=40
set columns=80

" Fixes coloring bug when gvim opened from a dark term.
syntax clear
set background=light
highlight Normal guibg=#ffffe6 " Change the bgcolor.
syntax on
