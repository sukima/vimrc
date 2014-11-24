" VIM rc
" Copyright (C) 2011, Devin Weaver
" This work is part of my vimrc project at http://github.com/sukima/vimrc
" It is licensed under a Creative Commons Attribution 3.0 Unported License.

" Section: Plugin Management {{{1
set nocompatible
filetype off
com! -nargs=? Plugin
set rtp+=~/.vim/bundle/Vundle.vim

" Section: Preferred plugins {{{1
silent! call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'vimoutliner/vimoutliner'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'edsono/vim-matchit'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'sampsyo/autolink.vim'
Plugin 'yaymukund/vim-rabl'
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'mattn/emmet-vim'
Plugin 'ervandew/snipmate.vim'
" Plugin 'scrooloose/snipmate-snippets'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mintplant/vim-literate-coffeescript'
Plugin 'mattn/webapi-vim'
Plugin 'vim-scripts/Gist.vim'
Plugin 'vim-scripts/ZoomWin'
Plugin 'vim-scripts/vim-json-bundle'
Plugin 'vim-scripts/grep.vim'
Plugin 'vim-scripts/vim-easy-align'
Plugin 'vim-scripts/git-time-lapse'
Plugin 'csexton/jekyll.vim'
Plugin 'sukima/LSLvim'
" Plugin 'sukima/asciidoc-vim'
Plugin 'sjl/gundo.vim'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'chrisbra/NrrwRgn'
Plugin 'sukima/vim-docbk'
Plugin 'kien/ctrlp.vim'
Plugin 'benmills/vimux'
Plugin 'airblade/vim-gitgutter'
" Required by vim-session
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'wavded/vim-stylus'
Plugin 'tfnico/vim-gradle'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'yaifa.vim'
Plugin 'szw/vim-dict'
Plugin 'rizzatti/dash.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'groenewege/vim-less'
silent! call vundle#end()

" Section: Global Options {{{1

" Section: Common Options  {{{2
set tabstop=2
set shiftwidth=2
set textwidth=0
set nosmartindent
set nocindent
set autoindent
set copyindent
set nowrap
if &columns < 50
  set nonumber
else
  set number
endif
set nobackup
set modeline
set modelines=3
set cpoptions+=$
" Save swapfile to home tmp directory.
" You must have a `$HOME/tmp` directory for this to work.
set directory=~/tmp,.,/tmp,c:\tmp,c:\temp
" Allow per directory config files
" Consider set secure as well?
set exrc
" Keep up-to-date with disk changes
set autoread
" Fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100

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
    set listchars=eol:$,tab:>~,trail:-,precedes:<,extends:>,nbsp:=
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
    set cursorline
endif

" Section: VIM 7.x Options {{{2
if version >= 700
    " Default to no spelling for now. Easily turn it on and off with mapping
    " below.
    set nospell
    " Spell works better in the GUI when you can right click on the word.
    set mousemodel=popup
endif

if version >= 703
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

" Section: Plugin | File Type | Syntax Options{{{1
" Plugin / Syntax Options {{{2
" listtrans.vim {{{3
nmap <Leader>l  :call ListTrans_toggle_format()<CR>
vmap <Leader>l  :call ListTrans_toggle_format('visual')<CR>

" dragvisuals.vim {{{3
vmap  <expr>  <C-h>    DVB_Drag('left')
vmap  <expr>  <C-l>    DVB_Drag('right')
vmap  <expr>  <C-j>    DVB_Drag('down')
vmap  <expr>  <C-k>    DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

" vimspell {{{3
if version >= 700
    " No need to load the old vimspell because VIM 7.x has built in spelling
    let loaded_vimspell = 1
else
    let spell_executable = "aspell"
    let spell_auto_type = ""
    let spell_insert_mode = 0
endif

" Highlight Matching Brackets {{{3
" let loaded_matchparen = 1

" PHP {{{3
"let php_sql_query = 1
let php_baselib = 1
let php_folding = 0

" Obj-C {{{3
let filetype_m='objc'

" Java {{{3
let java_allow_cpp_keywords = 1

" XML {{{3
let xml_allow_docbk_keywords = 1
"let xml_jump_string = "-j-"

" Explore {{{3
let explHideFiles='^\.,\.gz$,\.exe$,\.zip$'

" NERDCommenter {{{3
let g:NERDSpaceDelims=1
let g:NERDDefaultNesting=1
let g:NERDCustomDelimiters = {
  \ 'litcoffee': { 'left': '#', 'leftAlt': '<!--', 'rightAlt': '-->' }
\ }

" emmet-vim {{{3
let g:user_emmet_leader_key='<c-e>'
let g:user_emmet_settings = {
\  'indentation' : '  '
\}

" Rails {{{3
" tmux buggers up vim's display avoid using it.
let g:rails_gnu_screen=0

" snipMate {{{3
" This overrides the deafult location which is to search the &rtp. Because
" snipmate-snippets overides the defaults in snipMate we force snippets to
" load only from these directory excluding the defaults.
let g:snippets_dir="$HOME/.vim/snippets,$HOME/.vim/bundle/snipmate-snippets"
let g:snips_author='Devin Weaver'

" Gundo {{{3
" Place in .vim/local.vim to disable (if no python)
"let g:gundo_disable = 1
"let g:gundo_preview_bottom = 1
nmap <Leader>u :GundoToggle<Cr>

" Fugitive {{{3
" Convenience mappings
nnoremap <C-s>a :Gwrite<Cr>
inoremap <C-s>a <C-o>:Gwrite<Cr>
nnoremap <C-s>c :Gcommit -v<Cr>

" CTRLP {{{3
" Allow ctrl-p to use git ls-files (better) with fallback
let g:ctrlp_open_new_file = 't'
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ }
  \ }

" EasyAlign {{{3
vnoremap <silent> <Enter> :EasyAlign<cr>

" SuperTab {{{3
let g:SuperTabNoCompleteBefore = ['^', ',', ':', '\s']

" vim-airline {{{3
let g:airline#extensions#hunks#non_zero_only = 1
if has('mac')
  " let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  " let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_linecolumn_prefix = '␊ '
  " let g:airline_linecolumn_prefix = '␤ '
  " let g:airline_linecolumn_prefix = '¶ '
  let g:airline#extensions#branch#symbol = '⎇ '
  let g:airline#extensions#paste#symbol = 'ρ'
  " let g:airline#extensions#paste#symbol = 'Þ'
  " let g:airline#extensions#paste#symbol = '∥'
  let g:airline#extensions#whitespace#symbol = 'Ξ'
endif

" vim-session {{{3
let g:session_autosave = 'no'

" vimux {{{3
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>
" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>
function SetVimuxOrientation(orientation)
    if a:orientation == "h"
        let g:VimuxOrientation = "h"
        let g:VimuxHeight = "40"
        echo "Vimux orientation set to horizontal split ( | )"
    else
        let g:VimuxOrientation = "v"
        let g:VimuxHeight = "20"
        echo "Vimux orientation set to vertical split ( - )"
    endif
endfunction
map <Leader>v" :call SetVimuxOrientation("v")<Cr>
map <Leader>v% :call SetVimuxOrientation("h")<Cr>
silent! call SetVimuxOrientation("v")

" CoffeeTags {{{3
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '--include-vars',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

" SplitJoin {{{3
let g:splitjoin_normalize_whitespace = 1

" git-time-lapse {{{3
map <leader>gt :call TimeLapse() <cr>

" yaifa {{{3
map <leader>i :YAIFAMagic <cr>

" Syntastic {{{3
let g:syntastic_mode_map = {
    \ 'mode': 'passive',
    \ 'active_filetypes': ['ruby', 'javascript', 'coffee', 'css'],
    \ 'passive_filetypes': ['html', 'xml']
    \ }

" Dash {{{3
nmap <silent> <leader>d <Plug>DashSearch

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
    au BufRead,BufNewFile *.json set filetype=json
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
    nnoremap [oz :call SetSpellingNavigation(1)<Cr>
    nnoremap ]oz :call SetSpellingNavigation(0)<Cr>
    nnoremap coz :call ToggleSpellingNavigation()<Cr>
endif
if version >= 703
  nnoremap gr :set relativenumber!<Cr>
endif
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
command! W write

" Section: Utility Mappings {{{2
" Convinent Esc alternatives {{{3
inoremap jk <esc>
cnoremap jk <c-c>
vnoremap v <esc>
" Remove default EX mode with Q {{{3
" I don't like the default EX mode I keep hitting it accidentally
" Use gQ instead (That's VIM's version which is better the the default EX
" mode.)
noremap Q <nop>
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
inoremap <Leader>) <Esc>F(a<Cr><Cr><Up><Esc>S
inoremap <Leader>] <Esc>F[a<Cr><Cr><Up><Esc>S
inoremap <Leader>} <Esc>F{a<Cr><Cr><Up><Esc>S
imap <Leader><Leader> <Leader>}
" Mark a new section with cut marks {{{3
nnoremap <Leader>S o------------------------ >8 ------------------------<Esc>
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

" Remove trailing space {{{3
nmap <Leader>s :%s/\s\+$//<Cr>

" Quick insert current directory of file {{{3
cnoremap %% <C-r>=expand('%:h').'/'<cr>

" Section: Convenience Commands {{{1
command Cwd cd %:h
command Undiff set nodiff foldcolumn=0
command Ant set makeprg=ant\ -find\ build.xml | set efm=%A\ %#[.\\{-1,}]\ %f:%l:\ %m,%-Z\ %#[.\\{-1,}]\ %p^,%-C%.%#
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

" Section: GPG Commands {{{1
command GPGclearsign %!gpg --clearsign
command GPGencryptsign %!gpg -seat
command GPGencrypt %!gpg -eat
command GPGdecrypt %!gpg -d
command GPGencryptSymetric %!gpg -ceat

" Section: Functions {{{1
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
function ToggleSpellingNavigation( )
    if !exists("g:spell_navigation_enabled") || g:spell_navigation_enabled == 0
        call SetSpellingNavigation(1)
    else
        call SetSpellingNavigation(0)
    endif
endfunction

function SetSpellingNavigation( enabled )
    " ViewSetup() has conflicting mappings. Can't use spell while nomodifiable
    " anyway.
    if g:viewState == 0
        echohl Error
        echo "Cannot use spelling. File nomodifiable."
        echohl None
    else
        if a:enabled == 0
            setlocal nospell
            silent! nunmap <buffer> <CR>
            silent! nunmap <buffer> +
            silent! nunmap <buffer> <Space>
            silent! nunmap <buffer> =
            silent! nunmap <buffer> <S-Space>
            silent! nunmap <buffer> -
            let g:spell_navigation_enabled = 0
            echo "Spell mappings: Off"
        else
            setlocal spell
            silent! nnoremap <buffer> <CR> z=
            silent! nnoremap <buffer> + z=
            silent! nnoremap <buffer> <Space> ]s
            silent! nnoremap <buffer> = ]s
            silent! nnoremap <buffer> <S-Space> [s
            silent! nnoremap <buffer> - [s
            let g:spell_navigation_enabled = 1
            echo "Spell mappings: On ([Space/=] Next, [Enter/+] Suggest, [S-Space/-] Prev)"
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

" Section: SetupEditServer {{{2
" Convinience method to be called from the edit-server script to seup any
" settings used while editing text from a website.
function SetupEditServer()
  set tw=0
  set wrap
  silent! call SetSpellingNavigation(1)
endfunction

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
    nnoremap <Leader>vv :call ViewSetup()<Cr>
endif

" by default run explorer.vim but only if I call for it.
" VIM 6.x includes it by default.
if (version < 600 && filereadable($VIMRUNTIME . "/macros/explorer.vim"))
    nmap ,e :so $VIMRUNTIME/macros/explorer.vim<Cr>,e
endif

" Statusline {{{1
" Dynamic git branch {{{2
function! DynamicFugitiveStatus()
  if !exists('*fugitive#head')
    return ''
  endif
  let branch = fugitive#head(8)
  if branch == ''
    return ''
  endif
  if has('mac')
    let unicode='⎇ ' "Branching FTW
  else
    let unicode=''
  endif
  return '(' . unicode . branch . ') '
endfunction

" Dynamic Syntastic errors {{{2
function! DynamicSyntasticStatus()
  if !exists('*SyntasticStatuslineFlag')
    return ''
  endif
  let status = SyntasticStatuslineFlag()
  if status == ''
    return ''
  endif
  if has('mac')
    let unicode='😡 ' "Branching FTW
  else
    let unicode=''
  endif
  return ' ' . unicode . status
endfunction
" }}}2

set statusline=%f          "relative filename
set statusline+=(%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff})    "file format
set statusline+=%y         "filetype
set statusline+=%h         "help file flag
set statusline+=%w         "Preview window flag
if version >= 730
  set statusline+=%q         "Quickfix list flag
endif
set statusline+=%m         "modified flag
set statusline+=%r         "read only flag
set statusline+=%=         "left/right separator
set statusline+=%{DynamicFugitiveStatus()} "git branch
set statusline+=%P         "percent through file
if has('mac')
  set statusline+=\ ␊\     "unicode FTW!
endif
set statusline+=%l:        "cursor line/total lines
set statusline+=%c         "cursor column
set statusline+=%#warningmsg#%{DynamicSyntasticStatus()}%*
" }}}1

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
let g:solarized_hitrail = 1
silent! colorscheme solarized
silent! call togglebg#map("<F5>")

command Solarized16  let g:solarized_termcolors=16 | colorscheme solarized
command Solarized256 let g:solarized_termcolors=256 | colorscheme solarized

" Load abbreviations
runtime abbrev.vim
runtime digraphs.vim

" So multiple places can have a special config without affecting the core
" vimrc.
runtime local.vim

" vim600:set fdm=marker sw=2 ts=2 et:
