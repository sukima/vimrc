" GVIM rc
" Copyright (C) 2011, Devin Weaver
" This work is part of my vimrc project at http://github.com/sukima/vimrc
" It is licensed under a Creative Commons Attribution 3.0 Unported License.

" Section: Options {{{1
set mousehide
set guioptions=agmrbtT
" The 'e' option is for nice graphical tabs. Otherwise it uses text tabs.
set guioptions+=e
set nohlsearch

" Section: Syntax Highlighting {{{1 
" Fixes coloring bug when gvim opened from a dark term.
set background=light
highlight Normal guibg=#ffffe6 " Change the bgcolor.
syntax enable
silent! colorscheme solarized

" Section: OS Specifics ** Deprecated ** {{{1
" ** Depricated in favor of placing directives in local.vim **

" Prepare Script Options {{{1
" Turn off the buffer menu
let no_buffers_menu=1

" GUI Specific maps {{{1
"Incorporated into vimrc no longer used.
"nnoremap <Leader>z :set columns=122<Bar>NERDTree<Cr>

" }}}1

" vim600: set foldmethod=marker :
