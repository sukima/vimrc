" VIM rc $Revision$
set nocompatible
set wildmenu
set tabstop=8
set softtabstop=4
set smarttab
set shiftwidth=4
set noexpandtab
set textwidth=0
set wrapmargin=0
set backspace=2
set smartindent
set formatoptions+=ro2l
set nowrap
set noexpandtab
set nohlsearch
set listchars=eol:$,tab:мн,extends:+
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
if filereadable($VIM . "/words")
    set dictionary+=$VIM/words
endif
if filereadable("/usr/share/dict/words")
    set dictionary+=/usr/share/dict/words
endif
set nonumber
set nrformats-=octal
set viminfo='20,\"50
set switchbuf=useopen
set background=dark

" Used for paging in a view command (like more)
if v:progname =~ "view"
    au BufRead * set nomodifiable
    nmap q :qa!<Cr>
    nmap <Space> <C-f>
    nmap - <C-b>
endif

" File type stuff.
set fileformats+=mac

syntax on

" Make Jikes supported for QuickFix.
set efm+=%A%f:%l:%c:%*\\d:%*\\d:,
    \%C%*\\s%trror:%m,
    \%+C%*[^:]%trror:%m,
    \%C%*\\s%tarning:%m,
    \%C%m

" terminfo doesn't map rxvt's <Home> and <End> correctly I guess
if &term == "rxvt"
    map <Esc>[1~ 0
    imap <Esc>[1~ <C-o>0
    map <Esc>[4~ $
    imap <Esc>[4~ <C-o>$
endif

let java_allow_cpp_keywords = 1
let xml_allow_docbk_keywords = 1
let $CVS_RSH='ssh'

if (version >= 508)
    runtime scripts/vimspell.vim
endif

"let jade_xml_dcl="/usr/local/lib/sgml/pubtext/xml.dcl"
"let docbk_custom_dsl=$HOME ."/.vim/custom.dsl"
"if (version >= 508)
"    runtime scripts/docbk.vim
"endif

" by default run explorer.vim but only if I call for it.
if (version < 600 && filereadable($VIMRUNTIME . "/macros/explorer.vim"))
    nmap ,e :so $VIMRUNTIME/macros/explorer.vim<Cr>,e
endif

" File Type plugins
if (version >= 600)
    filetype plugin indent on
endif

" Sig Fortune Map: See http://www.moolenaar.net/fun.html for info on this.
"map <Leader>F mX:sp ~/.fortunes<CR>ggd/^--/<CR>Gp:wq<CR>'XGA<CR><Esc>p`X

noremap <Leader>w :set wrap!<Cr>
noremap <Leader>l :set list!<Cr>
noremap g/ :set hls!<Cr><Bar>:echo "highlight search: " . strpart("OffOn", 3 * &hlsearch, 3)<Cr>
inoremap <C-z> <C-o><C-z>
nnoremap <C-s> :w<Cr>
inoremap <C-s> <C-o>:w<Cr>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

command Cwd cd %:h

" Version 6.0 has it's own menus for these
"amenu 20.440 &Edit.Word\ &Wrap<Tab>:set\ wrap!		:set wrap!<Cr>
"amenu 20.450 &Edit.Line\ &Numbers<Tab>:set\ nu!		:set nu!<Cr>
"amenu 20.460 &Edit.Paste\ Mo&de<Tab>:set\ paste!	:set paste!<Cr><Bar>:echo "Paste Mode: " . strpart("OffOn", 3 * &paste, 3)<Cr>
"amenu 20.470 &Edit.L&ist\ Mode<Tab>:set\ list!		:set list!<Cr>

" When starting to edit a file:
au FileType c,cpp,java,jsp,css,php3,perl,javascript,jsp,pascal,tcl set nosi ai cin et ts=4
au FileType inform set nocin si ai cinwords= efm+=%f(%l):\ %*[^:]:\ %m
au FileType mail set tw=72 et nocin nosi ai cinwords= comments=n:>,fb:-,fb:*,b:#
au FileType docbk set sw=2 cinwords=
au FileType java ab syspl System.out.println
au FileType java ab sysp System.out.print

" Are we starting VIM in an Ant aware directory?
if filereadable("build.xml")
    exec "set makeprg=ant\\ -buildfile\\ " . getcwd() . "/build.xml"
    " Support Ant compile error detection.
    if (version < 600)
	set efm=%A%*\\s%[javac%\\]\ %f:%l:\ %m,%Z%*\\s%[javac%\\]\ symbol%*\\s:\ %m
    else
	set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
    endif
endif
" Is there a tags file? Is so I'd like to use it's absolute path in case we
" chdir later
if filereadable("tags")
    exec "set tags+=" . getcwd() . "/tags"
endif

"My commonly misspelled words.
cab date strftime("%a %b %d %T %Z %Y")
cab sdate strftime("%b %d, %Y")
ab syncronize  synchronize
ab syncronized synchronized
ab responce response
ab HttpServletResponce HttpServletResponse
