" VIM rc
" Copyright (C) 2011, Devin Weaver
" This work is part of my vimrc project at http://github.com/sukima/vimrc
" It is licensed under a Creative Commons Attribution 3.0 Unported License.

" Section: Plugin Management {{{1
set nocompatible
filetype off
com! -nargs=? Bundle
set rtp+=~/.vim/bundle/vundle/
silent! call vundle#rc()
if !exists("*vundle#rc")
    set rtp+=~/.vim/bundle/pathogen
    silent! call pathogen#inject()
endif

" Section: Preferred bundles {{{1
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'edsono/vim-matchit'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-unimpaired'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'mattn/zencoding-vim'
Bundle 'ervandew/snipmate.vim'
" Bundle 'scrooloose/snipmate-snippets'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mintplant/vim-literate-coffeescript'
Bundle 'mattn/webapi-vim'
Bundle 'vim-scripts/Gist.vim'
Bundle 'vim-scripts/ZoomWin'
Bundle 'vim-scripts/vim-json-bundle'
Bundle 'vim-scripts/grep.vim'
Bundle 'vim-scripts/vim-easy-align'
Bundle 'vim-scripts/git-time-lapse'
Bundle 'csexton/jekyll.vim'
Bundle 'sukima/LSLvim'
Bundle 'sukima/asciidoc-vim'
Bundle 'sjl/gundo.vim'
Bundle 'ervandew/supertab'
Bundle 'majutsushi/tagbar'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'chrisbra/NrrwRgn'
Bundle 'sukima/vim-docbk'
Bundle 'kien/ctrlp.vim'
Bundle 'benmills/vimux'

" Section: Global Options {{{1

" Section: Common Options  {{{2
set tabstop=2
set shiftwidth=2
set textwidth=0
set nosmartindent
set nocindent
set autoindent
set nowrap
if &columns < 50
    set nonumber
else
    set number
endif
set nobackup
set modeline
set modelines=3
" Save swapfile to home tmp directory.
" You must have a `$HOME/tmp` directory for this to work.
set directory=~/tmp,.,/tmp,c:\tmp,c:\temp
" Allow per directory config files
" Consider set secure as well?
set exrc

" Section: VIM 5.x Options {{{2
if version >= 500
    set wildmenu
    set smarttab
    set expandtab " Spaces are better.
    set wrapmargin=0
    set backspace=2
    set formatoptions+=ro2lt
    set nohlsearch
    set noincsearch
    set sidescroll=5
    set listchars=eol:$,tab:\|-,trail:-,precedes:<,extends:>,nbsp:=
    set showbreak=+
    set linebreak
    set cino={0,(0,W4,u0,t0
    set nojoinspaces
    set mouse=a " set mouse enabled in all modes
    set mousemodel=extend
    if &lines < 20
    set laststatus=0 " Never have a status line
    set noshowmatch
    set noshowcmd
    else
    set laststatus=2 " Always have a status line
    set showmatch
    set showcmd
    endif
    set ruler " have curser position always on status bar
    set magic " allow searches to be more perl like
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
    "set background=dark
endif

" Section: VIM 6.x Options {{{2
if version >= 600
    set softtabstop=0
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
    "set background=dark
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
    " Display textwidth highlighting
    " (solarized sets ColorColumn only for GUI)
    set cc=+1
    " This option only available after version 7.3
    " I still want the best for encryption. (Otherwise what's the point?)
    set cryptmethod=blowfish
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

" Obj-C
let filetype_m='objc'

" Java
let java_allow_cpp_keywords = 1

" XML
let xml_allow_docbk_keywords = 1
"let xml_jump_string = "-j-"

" Explore
let explHideFiles='^\.,\.gz$,\.exe$,\.zip$'

" NERDCommenter
let g:NERDSpaceDelims=1
let g:NERDDefaultNesting=1
let g:NERDCustomDelimiters = {
  \ 'litcoffee': { 'left': '#', 'leftAlt': '<!--', 'rightAlt': '-->' }
\ }

" zencoding-vim
let g:user_zen_leader_key='<c-e>'
let g:user_zen_settings = {
\  'indentation' : '  '
\}

" Rails
" tmux buggers up vim's display avoid using it.
let g:rails_gnu_screen=0

" snipMate
" This overrides the deafult location which is to search the &rtp. Because
" snipmate-snippets overides the defaults in snipMate we force snippets to
" load only from these directory excluding the defaults.
let g:snippets_dir="$HOME/.vim/snippets,$HOME/.vim/bundle/snipmate-snippets"
let g:snips_author='Devin Weaver'

" Gundo
" Place in .vim/local.vim to disable (if no python)
"let g:gundo_disable = 1
"let g:gundo_preview_bottom = 1
nmap <Leader>u :GundoToggle<Cr>

" Fugitive
" Convenience mappings
nnoremap <C-s>a :Gwrite<Cr>
inoremap <C-s>a <C-o>:Gwrite<Cr>
nnoremap <C-s>c :Gcommit<Cr>

" Ctrl-p
" Allow ctrl-p to use git ls-files (better) with fallback
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ }
  \ }

" EasyAlign
vnoremap <silent> <Enter> :EasyAlign<cr>

" SuperTab
let g:SuperTabNoCompleteBefore = ['^', ',', ':', '\s']

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
au FileType ruby setl sw=2 sts=2 et

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

" Section: Terminal Mappings {{{2
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
    noremap <Leader>s :call SetSpellingNavigation()<Cr>
endif
" <Leader>w conflicts with some filetype mappings.
nnoremap <Leader>W :silent! call SetWrapNavigation()<Cr>
nnoremap <Leader>l :set list!<Cr>
nnoremap <Leader>n :set nu!<Cr>
nnoremap <Leader>e :set et!<Cr><Bar>:echo "Expand Tab: " . strpart("OffOn", 3 * &et, 3)<Cr>
nnoremap <silent> <Leader>f :if &fdc==0<Cr>set fdc=2<Cr>else<Cr>set fdc=0<Cr>endif<Cr>
nnoremap <Leader>p :set paste!<Cr><Bar>:echo "Paste mode: " . strpart("OffOn", 3 * &paste, 3)<Cr>
set pastetoggle=<ESC>1 " For added ease
nnoremap <Leader>/ :set hls!<Cr><Bar>:echo "Highlight Search: " . strpart("OffOn", 3 * &hlsearch, 3)<Cr>
nnoremap <Leader>2<Tab> :set sw=2 ts=2 noet<Cr><Bar>:echo "Indent set to two (tabs)"<Cr>
nnoremap <Leader>4<Tab> :set sw=4 ts=4 noet<Cr><Bar>:echo "Indent set to four (tabs)"<Cr>
nnoremap <Leader>2<Space> :set sw=2 ts=2 et<Cr><Bar>:echo "Indent set to two (spaces)"<Cr>
nnoremap <Leader>4<Space> :set sw=4 ts=4 et<Cr><Bar>:echo "Indent set to four (spaces)"<Cr>

" Section: Quick Commands (Window Nav.) {{{2
noremap <C-q> :close<Cr>
inoremap <C-z> <C-o><C-z>
nnoremap <C-s> :w<Cr>
inoremap <C-s> <C-o>:w<Cr>
" To help with finger spasms
nnoremap <C-s><C-s> :w<Cr>
inoremap <C-s><C-s> <C-o>:w<Cr>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Section: Utility Mappings {{{2
" A panic button! {{{3
" So no one accidentally sees words they arn't supposed to.
noremap <Leader>r ggg?G``
" For safe measures lets make a quick backup mapping. {{{3
noremap <Leader>b :let x=&backup<Bar>set backup<Bar>write<Bar>let &backup=x<Bar>unlet x<Cr>
" Allow for multiple time stamped backups
" map ;s :up \| saveas! %:p:r-<C-R>=strftime("%y%m%d-%H:%M")<CR>-bak.<C-R>=expand("%:e")<CR> \| 3sleep \| e #<CR>
" For convinent headers in text files {{{3
" For underlined header style
nnoremap <Leader>H1 yyp^v$r=o<Esc>
nnoremap <Leader>H2 yyp^v$r-o<Esc>
nnoremap <Leader>H3 yyp^v$r~o<Esc>
" For octothorp header style
nnoremap <Leader>h1 :s/^.*$/# & #/<Cr>
nnoremap <Leader>h2 :s/^.*$/## & ##/<Cr>
nnoremap <Leader>h3 :s/^.*$/### & ###/<Cr>
nnoremap <Leader>h4 :s/^.*$/#### & ####/<Cr>
" For quick brackets for functions/if/then/etc deffinitions {{{3
" The first map used to work. But the new indent code (read: php indent)
" would render this improperly if there was no text after the opening { 
" "inoremap <Leader><Cr> <Cr>{<Cr>}<Up><Cr>
inoremap <Leader><Cr> <Cr>{<Cr>x<Cr>}<Up><End><Backspace>
inoremap <Leader>] <Space>{<Cr>x<Cr>}<Up><End><Backspace>
" Make a quick comment. {{{3
" ** Deprecated for nerdcommenter. **
" Uses 'commentstring' setting and the toggleComment() function defined below.
" if version >= 700
    " nnoremap <Leader>c :call AddLineComment()<Cr>
    " nnoremap <Leader>C :call RemoveLineComment()<Cr>
" endif
" Mark a new section with cut marks {{{3
nnoremap <Leader>S o----- 8< ----- 8< -----<Cr><Esc><Up>:call AddLineComment()<Cr><Down><Home>
" The use of shift and an arrow key is ANNOYING! Make it stop! {{{3
nnoremap <S-Up> <Esc>
nnoremap <S-Down> <Esc>
inoremap <S-Up> <C-O><Esc>
inoremap <S-Down> <C-O><Esc>
" Add a quick map top open NERDTree (Plugin must be installed.) {{{3
" http://www.vim.org/scripts/script.php?script_id=1658
noremap <Leader>zz :NERDTreeToggle<Cr>
noremap <Leader>zm :NERDTreeMirror<Cr>
" Bubble single lines {{{3
nmap <C-k> ddkP
nmap <C-j> ddp
" Bubble multiple lines {{{3
vmap <C-k> xkP`[V`]
vmap <C-j> xp`[V`]
" Add blank lines without insert {{{3
nmap <Leader>o o<Esc>
nmap <Leader>O O<Esc>
" Make text multiline {{{3
vnoremap <Leader>o <Esc>`>a<Cr><Esc>`<i<Cr><Esc>
" initiate a date stamped note {{{3
nmap <Leader>J ^"=strftime("%m/%d/%Y")<Cr>Pa:<Space><Esc>


" Section: Convenience Commands {{{1
command Cwd cd %:h
command Undiff set nodiff foldcolumn=0
command Ant set makeprg=ant\ -find\ build.xml | set efm=%A\ %#[.\\{-1,}]\ %f:%l:\ %m,%-Z\ %#[.\\{-1,}]\ %p^,%-C%.%#
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

" Section: Session Commands {{{1
let g:session_dir="~/tmp/sessions/"
command SaveSession wa | exec "mksession! " . v:this_session | echo "Session saved. (" . v:this_session . ")"
function MakeNewSession(name)
  if a:name != ""
    let session_name = a:name
  else
    let session_name=input("New session name: ")
  endif
  if session_name != ""
    exec "let v:this_session=\"" . simplify( g:session_dir . "/" . session_name . ".vim" ) . "\""
    exec "mksession! " . v:this_session
    echo session_name . " session saved. (" . v:this_session . ")"
  else
    echo "Aborted."
  endif
endfunction
function LoadSavedSession(name)
  if a:name != ""
    let session_name = a:name
  else
    let session_name=input("Session name: ")
  endif
  if session_name != ""
    exec "source " . simplify( g:session_dir . "/" . session_name . ".vim" )
  else
    echo "Aborted."
  endif
endfunction
command -nargs=? NewSession wa | call MakeNewSession(<q-args>)
command -nargs=? LoadSession wa | call LoadSavedSession(<q-args>)

" Section: GPG Commands {{{1
command GPGclearsign %!gpg --clearsign
command GPGencryptsign %!gpg -seat
command GPGencrypt %!gpg -eat
command GPGdecrypt %!gpg -d

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

" Section: Toggle Spelling Navigation {{{2
function SetSpellingNavigation( )
    " ViewSetup() has conflicting mappings. Can't use spell while nomodifiable
    " anyway.
    if g:viewState == 0
        echohl Error
        echo "Cannot use spelling. File nomodifiable."
        echohl None
    else
        if &spell
            set nospell
            nunmap <CR>
            nunmap +
            nunmap <Space>
            nunmap =
            nunmap <S-Space>
            nunmap -
            echo "Spell checking: Off"
        else
            " There are random bugs that crash vim when spell checking. Force
            " the file to be saved before continuing.
            if bufname("%") == ""
                echohl Error
                echo "Due to possible crashing during spell checking buffer must be saved first."
                echohl Normal
            else
                silent write
                set spell
                nnoremap <CR> z=
                nnoremap + z=
                nnoremap <Space> ]s
                nnoremap = ]s
                nnoremap <S-Space> [s
                nnoremap - [s
                echo "Spell checking: On ([Space/=] Next, [Enter/+] Suggest, [S-Space/-] Prev)"
            endif
        endif
    endif
endfunction

" Section: Pager Function for 'view' {{{2 
" Used for paging in a view command (like more)
function ViewSetup( )
    if &spell
        call SetSpellingNavigation()
    endif
    if g:viewState == 0
	set modifiable
	"filetype detect
	nunmap q
	nunmap Q
	nunmap <Space>
	nunmap <S-Space>
	echo "View Mode: Off"
	let g:viewState = 1
    else
	set nomodifiable
	nnoremap q :q!<Cr>
	nnoremap Q :qa!<Cr>
	nnoremap <Space> <C-f>
	nnoremap <S-Space> <C-b>
	if g:viewState != 2
	    echo "View Mode: On ([Space] Page Down, [S-Space] Page Up, [q] Quit)"
	endif
	let g:viewState = 0
    endif
endfunction

" Section: Custom statusline info {{{2
" used to display custom data or plugin output
function SetStatusLine()
    set statusline=%<%f\ %h%m%r

    " Fugative
    if exists("*fugitive#statusline")
        set statusline+=%{fugitive#statusline()}
    endif

    " Syntastic
    if exists("*SyntasticStatuslineFlag")
        set statusline+=\ %#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*
    endif

    set statusline+=%=%-14.(%l,%c%V%)\ %P
endfunction

" Custom status line
autocmd VimEnter * call SetStatusLine()

" Section: Custom 'tabline' {{{2
if exists("+showtabline")
  function MyTabLine()
    let s = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
      let buflist = tabpagebuflist(i)
      let winnr = tabpagewinnr(i)
      let s .= '%' . i . 'T'
      let s .= (i == t ? '%1*' : '%2*')
      let s .= ' '
      let s .= '[' . i . ']'
      let s .= '%*'
      let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
      let file = bufname(buflist[winnr - 1])
      let file = fnamemodify(file, ':p:t')
      if file == ''
        let file = '[No Name]'
      endif
      let s .= file
      let i = i + 1
    endwhile
    let s .= '%T%#TabLineFill#%='
    let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
    return s
  endfunction
  set showtabline=1
  set tabline=%!MyTabLine()
endif

" Section: Misc. {{{1 
" Is there a tags file? If so I'd like to use it's absolute path in case we
" chdir later
if filereadable("tags")
    exec "set tags+=" . getcwd() . "/tags"
endif

" Allow easy creation of tags. Assuming ctags installed.
command Ctags !ctags -R --exclude=.svn --exclude=.git --exclude=log*

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
" Color scheme
if has('gui_running')
    set background=light
else
    set background=dark
endif

" Setup solarized theme
" set t_Co=16
" let g:solarized_termcolors=16
let g:solarized_termtrans = 1
silent! colorscheme solarized
silent! call togglebg#map("<F5>")

" Load abbreviations
runtime abbrev.vim

" So multiple places can have a special config without affecting the core
" vimrc.
runtime local.vim

" vim600:set fdm=marker sw=4 ts=4 et:
