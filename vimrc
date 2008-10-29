" VIM rc $Revision$

" Section: Global Options {{{1 
 
" Section: Common Options  {{{2
set nocompatible
set tabstop=8
set shiftwidth=4
set textwidth=0
set smartindent
set nowrap
if &columns < 50
    set nonumber
else
    set number
endif
set nobackup

" Section: VIM 5.x Options {{{2
if version >= 500 
    set wildmenu
    set smarttab
    set expandtab " Spaces are better
    set wrapmargin=0
    set backspace=2
    set formatoptions+=ro2l
    set nohlsearch
    set noincsearch
    set listchars=eol:$,tab:T-,trail:_,precedes:+,extends:+
    set showbreak=+
    set linebreak
    set cino={0,(0,u0,t0
    set nojoinspaces
    set mouse=a	" set mouse enabled in all modes
    set mousemodel=extend
    if &lines < 20
	set laststatus=0	" Never have a status line
	set noshowmatch
	set noshowcmd
    else
	set laststatus=2	" Always have a status line
	set showmatch
	set showcmd
    endif
    set ruler	" have curser position always on status bar
    set magic	" allow searches to be more perl like
    set ignorecase
    " 'smartcase' turn off ignorecase in a typed search if an uppercase char exists.
    set smartcase
    set infercase
    set shortmess=aotTO
    set shellslash
    set nrformats-=octal
    set viminfo='20,\"50
    set switchbuf=useopen
    " File type stuff.
    set fileformats+=mac
    " Force all non GUI to have a dark background (Overriden in gvimrc)
    set background=dark
endif

" Section: VIM 6.x Options {{{2
if version >= 600
    set softtabstop=4
    if &columns < 40
	set foldcolumn=0
    else
	set foldcolumn=2
    endif
    set winminheight=0
    set modeline
    set virtualedit=block
    " Allows suffixes to be added to a `gf' file search
    set suffixesadd=.java
    " Force all non GUI to have a dark background (Overriden in gvimrc)
    set background=dark
    " Make Jikes supported for QuickFix.
    "set efm+=%A%f:%l:%c:%*\\d:%*\\d:,
    "    \%C%*\\s%trror:%m,
    "    \%+C%*[^:]%trror:%m,
    "    \%C%*\\s%tarning:%m,
    "    \%C%m
endif 

" Section: VIM 7.x Options {{{2
if version >= 700
    " Default to no spelling for now. Easily turn it on and off with mapping
    " below.
    set nospell
    " Spell works better in the GUI when you can right click on the word.
    set mousemodel=popup
endif
 
" Section: Dictionary Support {{{2
if filereadable($VIM . "/words")
    set dictionary+=$VIM/words
endif
if filereadable("/usr/share/dict/words")
    set dictionary+=/usr/share/dict/words
endif

" Section: File Type & Syntax Options{{{1
" Plugin / Syntax Options {{{2
" vimspell
if version >= 700
    " No need to load the old vimspell because VIM 7.x has built in spelling
    let loaded_vimspell = 1
else
    let spell_executable = "aspell"
    let spell_auto_type = ""
    let spell_insert_mode = 0
endif

" Highlight Matching Brackets
let loaded_matchparen = 1

" PHP
"let php_sql_query = 1
let php_baselib = 1
let php_folding = 0

" Java
let java_allow_cpp_keywords = 1

" XML
let xml_allow_docbk_keywords = 1
let xml_jump_string = "`"

" Explore
let g:explHideFiles='^\.,\.gz$,\.exe$,\.zip$'

" File Type Detect {{{2
augroup filetypedetect
    " phplib template files
    au! BufNewFile,BufRead *.thtml,*.ihtml           setf html
    " FireFox Mozex Text Area support
    au! BufNewFile,BufRead mozex.textarea.*          setf mail
    " Custom ChangeLog Syntax
    "au! BufNewFile,BufRead ChangeLog*		     setf chlog
    au BufNewFile,BufRead *
	\ if getline(1) =~ '^\(.\+\)(\d).*\1(\d)$' |
	\   setf man |
	\ endif
augroup END

" File Type Auto Settings {{{2
augroup filetypesetup
    autocmd!
    "au FileType c,cpp,java,css,php3,perl,javascript,jsp,pascal,tcl set nosi ai cin et
    au FileType inform set nocin si ai cinwords= efm+=%f(%l):\ %*[^:]:\ %m
    au FileType mail set tw=72 et nocin nosi ai cinwords= comments=n:>,fb:-,fb:*,b:#
    au FileType docbk set sw=2 cinwords= efm=jade:%f:%l:%c:%t:%m
    au FileType java ab syspl System.out.println
    au FileType java ab sysp System.out.print
    au FileType java set makeprg=ant\ -find\ build.xml
    " Support Ant compile error detection.
    au FileType java set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
    au FileType mail        call SetWrapNavigation()
    au FileType mail        set tw=68
augroup END

" }}}
" Turn on filetype checks and syntax highlighting 
filetype plugin indent on
syntax on

" Section: Mappings {{{1
 
" Section: mapleader {{{2
" Check if this is the Pocket PC version
if exists("$CELIBVERSION")
    let mapleader = ","
else
    let mapleader = "\\"
endif

" Section: RXVT {{{2
" terminfo doesn't map rxvt's <Home> and <End> correctly I guess
if &term == "rxvt"
    map <Esc>[1~ 0
    imap <Esc>[1~ <C-o>0
    map <Esc>[4~ $
    imap <Esc>[4~ <C-o>$
endif

" Section: Quick Options {{{2
if version >= 700
    " add a mapping for convenience since vimspell will not be loaded in
    " version 7.x
    noremap <Leader>s :set spell!<Cr><Bar>:echo "Spell checking: " . strpart("OffOn", 3 * &spell, 3)<Cr>
endif
noremap <Leader>w :silent! call SetWrapNavigation()<Cr>
noremap <Leader>l :set list!<Cr>
noremap <Leader>n :set nu!<Cr>
noremap <Leader>t :set et!<Cr>
noremap <silent> <Leader>f :if &fdc==0<Cr>set fdc=2<Cr>else<Cr>set fdc=0<Cr>endif<Cr>
noremap <Leader>p :set paste!<Cr><Bar>:echo "Paste mode: " . strpart("OffOn", 3 * &paste, 3)<Cr>
noremap <Leader>h :set hls!<Cr><Bar>:echo "highlight search: " . strpart("OffOn", 3 * &hlsearch, 3)<Cr>
 
" Section: Quick Commands (Window Nav.) {{{2
noremap <C-q> :close<Cr>
inoremap <C-z> <C-o><C-z>
nnoremap <C-s> :w<Cr>
inoremap <C-s> <C-o>:w<Cr>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Section: Utility Mappings {{{2
" A panic button! So no one accidentally sees words they arn't supposed to.
noremap <Leader>r ggg?G``
" For safe measures lets make a quick backup mapping.
noremap <Leader>b :let x=&backup<Bar>set backup<Bar>write<Bar>let &backup=x<Bar>unlet x<Cr>
" For convinent headers in text files
nnoremap <Leader>H yyp^v$r-o<Esc>
" For quick brackets for functions/if/then/etc deffinitions
" The first map used to work. But the new indent code (read: php indent)
" would render this improperly if there was no text after the opening { 
"inoremap <Leader><Cr> <Cr>{<Cr>}<Up><Cr>
inoremap <Leader><Cr> <Cr>{<Cr>x<Cr>}<Up><End><Backspace>
" Make a quick comment. Uses 'commentstring' setting
" and the toggleComment() function defined below.
if version >= 700
    nnoremap <Leader>c :call AddLineComment()<Cr>
    nnoremap <Leader>C :call RemoveLineComment()<Cr>
endif
" Mark a new section with cut marks
nnoremap <Leader>S o----- 8< ----- 8< -----<Cr><Esc><Up>:call AddLineComment()<Cr><Down><Home>
" The use of shift and an arrow key is ANNOYING! Make it stop!
nnoremap <S-Up> <Esc>
nnoremap <S-Down> <Esc>
inoremap <S-Up> <C-O><Esc>
inoremap <S-Down> <C-O><Esc>
" Add a quick map top open NERDTree (Plugin must be installed.)
" http://www.vim.org/scripts/script.php?script_id=1658
noremap <Leader>z :NERDTree<Cr>

" Section: Convenience Commands {{{1
command Cwd cd %:h
command Undiff set nodiff foldcolumn=0
command Ant set makeprg=ant\ -find\ build.xml | set efm=%A\ %#[.\\{-1,}]\ %f:%l:\ %m,%-Z\ %#[.\\{-1,}]\ %p^,%-C%.%#

" Section: Functions {{{1 
" Section: Toggle Comment Functions {{{2
if version >= 700
function LoadCommentString( )
    let comment = matchlist (&commentstring, '\(.*\)%s\(.*\)')
    if (comment == [])
	echohl WarningMsg
	echo "Malformed 'commentstring' or setting not set"
	echohl None
    endif
    let scomment = get (comment, 1, '# ') " default to shell comment
    let ecomment = get (comment, 2, '')
    return [scomment, ecomment]
endfunction
function AddLineComment( )
    let c = LoadCommentString()
    exe 'normal I' . c[0] . ' '
    exe 'normal A ' . c[1]
    exe 'normal ^'
endfunction
function RemoveLineComment( )
    let c = LoadCommentString() 
    let c[0] = substitute(c[0], '/', '\\/', 'g')
    let c[1] = substitute(c[1], '/', '\\/', 'g')
    exe 'substitute /\V' . c[0] . '\s\*\(\.\{-\}\)\s\*' . c[1] . '/\1/'
endfunction
endif

" Section: Wrap Navigation Function {{{2
function SetWrapNavigation( )
    if &wrap
	set nowrap
	unmap j
	unmap k
	unmap <Down>
	unmap <Up>
	"unmap 0
	"unmap ^
	"unmap $
    else
	set wrap
	nnoremap <buffer> k gk
	nnoremap <buffer> j gj
	nnoremap <buffer> <Up> gk
	nnoremap <buffer> <Down> gj
	"nnoremap <buffer> 0 g0
	"nnoremap <buffer> ^ g^
	"nnoremap <buffer> $ g$
	inoremap <buffer> <Up> <C-O>gk
	inoremap <buffer> <Down> <C-O>gj
	vnoremap <buffer> k gk
	vnoremap <buffer> j gj
	vnoremap <buffer> <Up> gk
	vnoremap <buffer> <Down> gj
	"vnoremap <buffer> 0 g0
	"vnoremap <buffer> ^ g^
	"vnoremap <buffer> $ g$
    endif
endfunction

" Section: Pager Function for 'view' {{{2 
" Used for paging in a view command (like more)
function ViewSetup( )
    if g:viewState == 0
	set modifiable
	"filetype detect
	nunmap q
	nunmap Q
	nunmap <Space>
	nunmap -
	echo "View Mode: Off"
	let g:viewState = 1
    else
	set nomodifiable
	nnoremap q :q!<Cr>
	nnoremap Q :qa!<Cr>
	nnoremap <Space> <C-f>
	nnoremap - <C-b>
	if g:viewState != 2
	    echo "View Mode: On"
	endif
	let g:viewState = 0
    endif
endfunction

" Section: Auto Correction {{{1
" My commonly misspelled words.
ab syncronize  synchronize
ab syncronized synchronized
ab responce response
ab HttpServletResponce HttpServletResponse
 
" My convince date completion commands
cab date strftime("%a %b %d %T %Z %Y")
cab sdate strftime("%m/%d/%y")
cab ldate strftime("%B %d, %Y")
cab fdate strftime("%m%d%Y")

" Section: Misc. {{{1 
" Is there a tags file? Is so I'd like to use it's absolute path in case we
" chdir later
if filereadable("tags")
    exec "set tags+=" . getcwd() . "/tags"
endif

" Are we using VIM as a pager?
if v:progname =~ "view"
    au BufRead * set ro
    set nomodified
    let viewState = 2
    call ViewSetup()
else
    let viewState = 1
    nnoremap <Leader>v :call ViewSetup()<Cr>
endif

" by default run explorer.vim but only if I call for it.
" VIM 6.x includes it by default. 
if (version < 600 && filereadable($VIMRUNTIME . "/macros/explorer.vim"))
    nmap ,e :so $VIMRUNTIME/macros/explorer.vim<Cr>,e
endif

"}}}1

" So multiple places can have a special config without affecting the core
" vimrc.
runtime local.vim

" vim600: set foldmethod=marker :
