" VIM rc $Revision$

" Section: Global Options {{{1 
 
" Section: Common Options  {{{2
set nocompatible
set tabstop=8
set shiftwidth=4
set textwidth=0
set smartindent
set nowrap
set number

" Section: VIM 5.x Options {{{2
if version > 500 
    set wildmenu
    set smarttab
    set noexpandtab
    set wrapmargin=0
    set backspace=2
    set formatoptions+=ro2l
    set nohlsearch
    set listchars=eol:$,tab:T_,extends:+
    set showbreak=+
    set linebreak
    set cino={0,(0,u0,t0
    set nojoinspaces
    set showmatch
    set showcmd
    set mouse=a	" set mouse enabled in all modes
    set mousemodel=extend
    set laststatus=2	" Always have a status line
    set ruler	" have curser position always on status bar
    set magic	" allow searches to be more perl like
    set ignorecase
    " 'smartcase' turn off ignorecase in a typed search if an uppercase char exists.
    set smartcase
    set infercase
    set shortmess=aotO
    set shellslash
    set nrformats-=octal
    set viminfo='20,\"50
    set switchbuf=useopen
    " File type stuff.
    set fileformats+=mac
endif

" Section: VIM 6.x Options {{{2
if version > 600
    set softtabstop=4
    set foldcolumn=2
    set winminheight=0
    set modeline
    " Force all non GUI to have a dark background (Overriden in gvimrc)
    set background=dark
    " Make Jikes supported for QuickFix.
    "set efm+=%A%f:%l:%c:%*\\d:%*\\d:,
    "    \%C%*\\s%trror:%m,
    "    \%+C%*[^:]%trror:%m,
    "    \%C%*\\s%tarning:%m,
    "    \%C%m
endif 
 
" Section: Plugins {{{1 
if (version >= 600)
    filetype plugin indent on
endif

" Section: Plugin Variables {{{2
let java_allow_cpp_keywords = 1
let xml_allow_docbk_keywords = 1
let $CVS_RSH='ssh'

" Section: Extra Plugins {{{2
" by default run explorer.vim but only if I call for it.
" VIM 6.x includes it by default. 
if (version < 600 && filereadable($VIMRUNTIME . "/macros/explorer.vim"))
    nmap ,e :so $VIMRUNTIME/macros/explorer.vim<Cr>,e
endif

" Section: Mappings {{{1
 
" Section: RXVT {{{2
" terminfo doesn't map rxvt's <Home> and <End> correctly I guess
if &term == "rxvt"
    map <Esc>[1~ 0
    imap <Esc>[1~ <C-o>0
    map <Esc>[4~ $
    imap <Esc>[4~ <C-o>$
endif

" Section: Quick Options {{{2
noremap <Leader>w :silent! call SetWrapNavigation()<Cr>
noremap <Leader>l :set list!<Cr>
noremap <Leader>n :set nu!<Cr>
noremap <silent> <Leader>f :if &fdc==0<Cr>set fdc=2<Cr>else<Cr>set fdc=0<Cr>endif<Cr>
noremap <Leader>p :set paste!<Cr><Bar>:echo "Paste mode: " . strpart("OffOn", 3 * &paste, 3)<Cr>
noremap g/ :set hls!<Cr><Bar>:echo "highlight search: " . strpart("OffOn", 3 * &hlsearch, 3)<Cr>
 
" Section: Quick Commands (Window Nav.) {{{2
noremap <C-q> :close<Cr>
inoremap <C-z> <C-o><C-z>
nnoremap <C-s> :w<Cr>
inoremap <C-s> <C-o>:w<Cr>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
" A panic button! So no one accidentally sees words they arn't supposed to.
noremap <Leader>r ggg?G``
" For safe measures lets make a quick backup mapping.
noremap <Leader>b :let x=&backup<Bar>set backup<Bar>write<Bar>let &backup=x<Bar>unlet x<Cr>
" For convinent headers in text files
nnoremap <Leader>H yypVr-o<Esc>

" Section: Navigation Util {{{2
function SetWrapNavigation( )
    if &wrap
	set nowrap
	unmap j
	unmap k
	unmap <Down>
	unmap <Up>
    else
	set wrap
	nnoremap <buffer> j gj
	nnoremap <buffer> k gk
	vnoremap <buffer> j gj
	vnoremap <buffer> k gk
	nnoremap <buffer> <Down> gj
	nnoremap <buffer> <Up> gk
	vnoremap <buffer> <Down> gj
	vnoremap <buffer> <Up> gk
	inoremap <buffer> <Down> <C-o>gj
	inoremap <buffer> <Up> <C-o>gk
    endif
endfunction

" Section: Convenience Commands {{{1
command Cwd cd %:h
command Undiff set nodiff foldcolumn=0

" Section: Auto Commands {{{1 
" When starting to edit a file:
au FileType c,cpp,java,jsp,css,php3,perl,javascript,jsp,pascal,tcl set nosi ai cin et ts=4
au FileType inform set nocin si ai cinwords= efm+=%f(%l):\ %*[^:]:\ %m
au FileType mail set tw=72 et nocin nosi ai cinwords= comments=n:>,fb:-,fb:*,b:#
au FileType docbk set sw=2 cinwords= efm=jade:%f:%l:%c:%t:%m
au FileType java ab syspl System.out.println
au FileType java ab sysp System.out.print
au FileType java set makeprg=ant\ -find\ build.xml
" Support Ant compile error detection.
au FileType java set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#

" Section: Auto Correction {{{1
"My commonly misspelled words.
cab date strftime("%a %b %d %T %Z %Y")
cab sdate strftime("%m/%d/%y")
cab ldate strftime("%B %d, %Y")
ab syncronize  synchronize
ab syncronized synchronized
ab responce response
ab HttpServletResponce HttpServletResponse

" Section: Pager Functions for 'view' {{{1 
" Used for paging in a view command (like more)
if v:progname =~ "view"
    au BufRead * set nomodifiable
    set nu
    nmap q :q!<Cr>
    nmap Q :qa!<Cr>
    nmap <Space> <C-f>
    nmap - <C-b>
endif

" Section: Dictionary Support {{{1
if filereadable($VIM . "/words")
    set dictionary+=$VIM/words
endif
if filereadable("/usr/share/dict/words")
    set dictionary+=/usr/share/dict/words
endif

" Section: Misc. {{{1 
" Is there a tags file? Is so I'd like to use it's absolute path in case we
" chdir later
if filereadable("tags")
    exec "set tags+=" . getcwd() . "/tags"
endif
"}}}1
syntax on

" So multiple places can have a special config without affecting the core
" vimrc.
runtime local.vim

" vim600: set foldmethod=marker :
