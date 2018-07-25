" VIM rc
" Copyright (C) 2011, Devin Weaver
" This work is part of my vimrc project at http://github.com/sukima/vimrc
" It is licensed under a Creative Commons Attribution 3.0 Unported License.

" Section: Plugin Management {{{1
set nocompatible

if version >= 730 && version < 740
  " Prevent bad exit code on Mac OS X install
  " https://github.com/VundleVim/Vundle.vim/issues/167#issuecomment-55700048
  filetype on
endif

filetype off
scriptencoding utf-8
set encoding=utf-8
com! -nargs=? Plugin
set rtp+=~/.vim/bundle/Vundle.vim

" Section: Preferred plugins {{{1
if (!exists('g:vundle#bundles'))
silent! call vundle#begin()
" Plugin Utilities
Plugin 'mattn/webapi-vim'
Plugin 'kana/vim-textobj-user'
Plugin 'xolox/vim-misc' " required by vim-session

Plugin 'gmarik/Vundle.vim'
Plugin 'jamessan/vim-gnupg'
Plugin 'vimoutliner/vimoutliner'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sgur/vim-editorconfig'
Plugin 'skwp/greplace.vim'
Plugin 'sukima/vim-matchit'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-speeddating'
Plugin 'christoomey/vim-system-copy'
Plugin 'sampsyo/autolink.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'vim-scripts/Gist.vim'
Plugin 'vim-scripts/grep.vim'
Plugin 'vim-scripts/vim-easy-align'
Plugin 'vim-scripts/git-time-lapse'
Plugin 'garbas/vim-snipmate'
Plugin 'AndrewRadev/splitjoin.vim'

" Motions / Text Objects
Plugin 'mattn/vim-textobj-url'
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'christoomey/vim-sort-motion'

Plugin 'mbbill/undotree'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'xolox/vim-session'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'yaifa.vim'
Plugin 'szw/vim-dict'
Plugin 'rizzatti/dash.vim'
Plugin 'groenewege/vim-less'

" Filetypes
Plugin 'tpope/vim-rails'
Plugin 'yaymukund/vim-rabl'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-haml'
Plugin 'vim-scripts/vim-json-bundle'
Plugin 'sukima/LSLvim'
Plugin 'posva/vim-vue'
" Plugin 'sukima/asciidoc-vim'
Plugin 'sukima/vim-emberlayout'
Plugin 'sukima/vim-ember-imports'
Plugin 'csexton/jekyll.vim'
Plugin 'sukima/vim-docbk'
Plugin 'wavded/vim-stylus'
Plugin 'tfnico/vim-gradle'
Plugin 'kchmck/vim-coffee-script'
Plugin 'joukevandermaas/vim-ember-hbs'
Plugin 'pangloss/vim-javascript'
Plugin 'freitass/todo.txt-vim'
Plugin 'toyamarinyon/vim-swift'
Plugin 'sukima/vim-tiddlywiki'
Plugin 'ledger/vim-ledger'
Plugin 'aklt/plantuml-syntax'

" Utility Plugins
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

" Linting
if version >= 800
  Plugin 'w0rp/ale'
else
  Plugin 'scrooloose/syntastic'
endif

silent! call vundle#end()
endif

" Section: Global Options {{{1

" Section: Common Options  {{{2
set tabstop=2
set shiftwidth=2
set shiftround
set textwidth=0
set nosmartindent
set nocindent
set autoindent
set nocopyindent
set nowrap
if &columns < 50
  set nonumber
else
  set number
endif
set nobackup
set hidden
set modeline
set modelines=3
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
" Print Options
set printoptions=paper:letter,formfeed:y
" Default commentstring
set commentstring=#\ %s

" Section: VIM 5.x Options {{{2
if version >= 500
    set wildmode=longest,list,full
    set wildmenu
    set smarttab
    set expandtab " Spaces are better.
    set wrapmargin=0
    set backspace=2
    set formatoptions+=nro2lt
    set nolist
    set listchars=eol:$,tab:>~,trail:·,precedes:<,extends:>,nbsp:=
    set noshowmatch
    set nohlsearch
    set incsearch
    set sidescroll=5
    set showbreak=\
    set linebreak
    set cino=l1,:1s,u0,t0
    set nojoinspaces
    set mouse=a " set mouse enabled in all modes
    set mousemodel=extend
    set ruler " have cursor position always on status bar
    set magic " allow searches to be more perl like
    set ignorecase
    " 'smartcase' turn off ignorecase in a typed search if an uppercase char exists.
    set smartcase
    set infercase
    set gdefault
    set shortmess=aotTOI
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
    set foldcolumn=0
    set winminheight=0
    set splitbelow
    set splitright
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
if v:version >= 700
  " Default to no spelling for now. Easily turn it on and off with mapping
  " below.
  set nospell
  set thesaurus+=$HOME/.vim/thesaurus.txt
  set complete+=s,kspell
  " Spell works better in the GUI when you can right click on the word.
  set mousemodel=popup
  set cursorline
  if &columns < 50
    set nonumber
    set norelativenumber
  else
    set number
    set relativenumber
  endif
endif

if v:version >= 703
  " Display textwidth highlighting
  " (solarized sets ColorColumn only for GUI)
  set colorcolumn=80
  " This option only available after version 7.3
  " I still want the best for encryption. (Otherwise what's the point?)
  set cryptmethod=blowfish
  set diffopt=filler,context:4,vertical
  set formatoptions+=j
endif

if v:version > 704 || (v:version == 704 && has('patch401'))
  set cryptmethod=blowfish2
endif

" Section: VIM 8.x Options {{{2
if v:version >= 800
  set breakindent
  set breakindentopt=min:4,shift:2,sbr
  if &columns < 50
    set signcolumn=auto
  else
    set signcolumn=yes
  endif
endif

" Section: mapleader {{{2
" let mapleader = "\\"
let mapleader = "\<Space>"

" Section: Dictionary Support {{{2
if filereadable($VIM . "/words")
    set dictionary+=$VIM/words
endif
if filereadable("/usr/share/dict/words")
    set dictionary+=/usr/share/dict/words
endif
if filereadable($HOME . "/.vim/mthesaur.txt")
  set thesaurus+=$HOME/.vim/mthesaur.txt
endif

" Section: Plugin | File Type | Syntax Options{{{1
" Plugin / Syntax Options {{{2
" listtrans.vim {{{3
nmap <Leader>l  :call ListTrans_toggle_format()<CR>
vmap <Leader>l  :call ListTrans_toggle_format('visual')<CR>

" dragvisuals.vim {{{3
vnoremap  <expr>  <C-h>    DVB_Drag('left')
vnoremap  <expr>  <C-l>    DVB_Drag('right')
vnoremap  <expr>  <C-j>    DVB_Drag('down')
vnoremap  <expr>  <C-k>    DVB_Drag('up')
vnoremap  <expr>  D        DVB_Duplicate()

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

" emmet-vim {{{3
let g:user_emmet_leader_key='<c-e>'
let g:user_emmet_settings = {
\  'indentation' : '  '
\}

" Rails {{{3
" tmux buggers up vim's display avoid using it.
let g:rails_gnu_screen=0

" Undotree {{{3
nnoremap <Leader>u :UndotreeToggle<Cr>

" Fugitive {{{3
" Convenience mappings
nnoremap <C-s>a :Gwrite<Cr>
inoremap <C-s>a <C-o>:Gwrite<Cr>
nnoremap <C-s>c :Gcommit -v<Cr>
nnoremap <C-s>cc :Gcommit -v --amend<Cr>

" CTRLP {{{3
" Allow ctrl-p to use git ls-files (better) with fallback
let g:ctrlp_open_new_file = 't'
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files -co --exclude-standard'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ }
  \ }
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_working_path_mode = 'ra'

" EasyAlign {{{3
vnoremap <silent> <Enter> :EasyAlign<cr>

" SuperTab {{{3
let g:SuperTabNoCompleteBefore = ['^', ',', ':', '\s']
let g:SuperTabMappingTabLiteral = '<C-l>'

" vim-airline {{{3
let g:airline_theme = 'solarized'
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#branch#format = 1
let g:airline#extensions#tabline#enabled = 0

" vim-session {{{3
let g:session_autosave = 'no'
let g:session_autoload = 'no'

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
" Zoom the tmux runner page
map <Leader>vz :VimuxZoomRunner<CR>
function! SetVimuxOrientation(orientation)
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
map <Leader>v' :call SetVimuxOrientation("v")<Cr>
map <Leader>v" :call SetVimuxOrientation("h")<Cr>
silent! call SetVimuxOrientation("h")

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

" vim-javascript {{{3
let g:javascript_plugin_jsdoc = 1
let g:javascript_conceal_function = "ƒ"
let g:javascript_conceal_null = "ø"
let g:javascript_conceal_this = "@"
let g:javascript_conceal_return = "⇚"
let g:javascript_conceal_undefined = "¿"
let g:javascript_conceal_NaN = "ℕ"
let g:javascript_conceal_prototype = "¶"
let g:javascript_conceal_static = "•"
let g:javascript_conceal_super = "Ω"
let g:javascript_conceal_arrow_function = "⇒"
set conceallevel=1
highlight link jsObjectKey Label

" SplitJoin {{{3
let g:splitjoin_normalize_whitespace = 1

" git-time-lapse {{{3
map <leader>gt :call TimeLapse() <cr>

" yaifa {{{3
map <leader>i :YAIFAMagic <cr>

" Linting {{{3
if version >= 800
  " Ale
  let g:ale_linters = {
        \ 'handlebars': ['ember-template-lint'],
        \ 'javascript': ['eslint'],
        \ 'ruby': ['rubocop'],
        \}

  let g:ale_open_list = 0
  let g:ale_echo_msg_format = '%severity% [%linter%] %s'
  let g:ale_change_sign_column_color = 1
  let g:ale_sign_column_always = 1
else
  " Syntastic
  let g:syntastic_mode_map = {
      \ 'mode': 'passive',
      \ 'active_filetypes': ['ruby', 'javascript', 'coffee', 'css'],
      \ 'passive_filetypes': ['html', 'xml']
      \ }
  function! HasConfig(file, dir)
      return findfile(a:file, escape(a:dir, ' ') . ';') !=# ''
  endfunction
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
endif

" Dash {{{3
nmap <silent> <leader>d <Plug>DashSearch
let g:dash_map = {
  \ 'coffee': ['nodejs', 'javascript', 'coffee'],
  \ 'javascript': ['nodejs', 'javascript']
  \ }

" mustache-handlebars {{{3
" I don't want the plugin features, just the syntax highlighting
let g:loaded_mustache_handlebars = 1

" vim-multiple-cursors {{{3
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual

" Gist {{{3
let g:gist_update_on_write = 2

" Ledger {{{3
let g:ledger_fold_blanks = 1
let g:ledger_align_at = 50

" NERDTree {{{3
let NERDTreeShowLineNumbers=1

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
augroup Git
  au Filetype gitcommit setlocal spell textwidth=72 cc=72
augroup END

" Useful for my Quick Notes feature in my tmuxrc
augroup QuickNotes
  au BufRead           NOTES setf markdown
  au BufWrite,VimLeave NOTES.otl mkview
  au BufRead           NOTES.otl silent loadview
augroup END

" }}}
" Turn on filetype checks and syntax highlighting
filetype plugin indent on
syntax on

" Section: Mappings {{{1

" Section: Terminal Mappings {{{2
" terminfo doesn't map rxvt's <Home> and <End> correctly I guess
if &term == "rxvt"
  map <Esc>[1~ 0
  imap <Esc>[1~ <C-o>0
  map <Esc>[4~ $
  imap <Esc>[4~ <C-o>$
endif

" Section: Quick Options {{{2
if version >= 703
  nnoremap gr :set relativenumber!<Cr>
  nnoremap gR :call ToggleRelativeNumbers()<Cr>
endif
nnoremap <Leader>2<Tab> :set sw=2 ts=2 noet<Cr><Bar>:echo "Indent set to two (tabs)"<Cr>
nnoremap <Leader>4<Tab> :set sw=4 ts=4 noet<Cr><Bar>:echo "Indent set to four (tabs)"<Cr>
nnoremap <Leader>2<Space> :set sw=2 ts=2 et<Cr><Bar>:echo "Indent set to two (spaces)"<Cr>
nnoremap <Leader>4<Space> :set sw=4 ts=4 et<Cr><Bar>:echo "Indent set to four (spaces)"<Cr>
nnoremap <silent> n   n:call HLNext(0.15)<cr>
nnoremap <silent> N   N:call HLNext(0.15)<cr>

" Section: Quick Commands (Window Nav.) {{{2
inoremap <C-z> <C-o><C-z>
nnoremap <C-s> :w<Cr>
inoremap <C-s> <C-o>:w<Cr>
" To help with finger spasms
nnoremap <C-s><C-s> :w<Cr>
inoremap <C-s><C-s> <C-o>:w<Cr>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
command! W write
command! Wa wall
command! WA wall

" Section: Tagbar {{{2
nnoremap <Leader>t :TagbarToggle<Cr>

" Section: Utility Mappings {{{2
" Convinent Esc alternatives {{{3
inoremap jk <esc>
inoremap jj <esc>
cnoremap jk <esc>
cnoremap jj <esc>
vnoremap v <esc>
" Soft-wrap paragraph {{{3
" I don't like the default EX mode I keep hitting it accidentally. Use gQ
" instead (That's VIM's version which is better then the default EX mode.)
noremap Q vipJ
" A panic button! {{{3
" So no one accidentally sees words they arn't supposed to.
noremap <Leader>r ggg?G``
" For safe measures lets make a quick backup mapping. {{{3
noremap <Leader>b :let x=&backup<Bar>set backup<Bar>write<Bar>let &backup=x<Bar>unlet x<Cr>
" Allow for multiple time stamped backups
" map ;s :up \| saveas! %:p:r-<C-R>=strftime("%y%m%d-%H:%M")<CR>-bak.<C-R>=expand("%:e")<CR> \| 3sleep \| e #<CR>
" For convinent headers in text files {{{3
" For underlined header style
nnoremap <Leader>H1 :t.<Cr>:s/./=/<Cr>
nnoremap <Leader>H2 :t.<Cr>:s/./-/<Cr>
nnoremap <Leader>H3 :t.<Cr>:s/./~/<Cr>
" For octothorp header style
nnoremap <Leader>h1 :s/^.*$/# & #/<Cr>
nnoremap <Leader>h2 :s/^.*$/## & ##/<Cr>
nnoremap <Leader>h3 :s/^.*$/### & ###/<Cr>
nnoremap <Leader>h4 :s/^.*$/#### & ####/<Cr>

" For convinient markdown table header {{{3
nnoremap <Leader>T :t.<Cr>:s/[^\|]/-/<Cr>

" Quick brackets for functions/if/then/etc deffinitions {{{3
nnoremap <Leader>) $F(a<Cr><Cr><Up><Esc>"_S
nnoremap <Leader>] $F[a<Cr><Cr><Up><Esc>"_S
nnoremap <Leader>} $F{a<Cr><Cr><Up><Esc>"_S
nmap <Leader>[ <Leader>}
" Mark a new section with cut marks {{{3
nnoremap <Leader>S o------------------------ >8 ------------------------<Esc>
" The use of shift and an arrow key is ANNOYING! Make it stop! {{{3
nnoremap <S-Up> <Esc>
nnoremap <S-Down> <Esc>
inoremap <S-Up> <C-O><Esc>
inoremap <S-Down> <C-O><Esc>
" Open NERDTree (Plugin must be installed.) {{{3
" http://www.vim.org/scripts/script.php?script_id=1658
noremap <Leader>zz :NERDTreeToggle<Cr>
noremap <Leader>zm :NERDTreeMirror<Cr>
" Bubble multiple lines {{{3
" vnoremap <C-k> xkP`[V`]
" vnoremap <C-j> xp`[V`]
" Make text multiline {{{3
vnoremap <Leader>o <Esc>`>a<Cr><Esc>`<i<Cr><Esc>
" initiate a date stamped note {{{3
nmap <Leader>J ^"=strftime("%m/%d/%Y")<Cr>Pa:<Space><Esc>

" Remove trailing space {{{3
nmap <Leader>s :%s/\s\+$//<Cr>

" Quick insert current directory of file {{{3
cnoremap %% <C-r>=expand('%:h').'/'<cr>

" Markdown links {{{3
vnoremap <Leader>M "my`<i[<Esc>`>la][]<Esc>mm}o[<C-r>m]:<Space><Esc>mua
nmap <Leader>M viw<Leader>M

" Syntax highlighting info {{{3
" Show syntax highlighting groups for word under cursor
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nmap gS :call SynStack()<CR>

" Fast exit from insert {{{3
" This is reaction to that anoying state you get when typing 'vim' but the
" shell is in normal mode.
inoremap <c-g><c-g> <esc>:qa!<cr>

" No-Ops {{{3
" Some keys are more annoying then useful
nnoremap <F1> <nop>
nnoremap K <nop>

" Section: Commands {{{1
" Convenience Commands {{{2
command! Cwd cd %:h
command! MkCwd call mkdir(expand('%:h'), 'p')
command! Undiff set nodiff foldcolumn=0
command! Ant set makeprg=ant\ -find\ build.xml | set efm=%A\ %#[.\\{-1,}]\ %f:%l:\ %m,%-Z\ %#[.\\{-1,}]\ %p^,%-C%.%#
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
command! SudoWrite exec 'w !sudo dd of=' . shellescape(expand('%'))
command! Ctags exec 'silent !ctags -R .' | redraw!

" GPG Commands {{{2
command! GPGclearsign %!gpg --clearsign
command! GPGencryptsign %!gpg -seat
command! GPGencrypt %!gpg -eat
command! GPGdecrypt %!gpg -d
command! GPGencryptSymetric %!gpg -ceat

" Formating for writing prose {{{2
function! ProseFormattingOn()
  nnoremap <buffer> j gj
  nnoremap <buffer> k gk
  setlocal spell
  setlocal tw=80
  setlocal fo+=1
  echo "Prose formatting mode ON"
  let b:prose_mode_enabled=1
endfunction

function! ProseFormattingOff()
  nunmap <buffer> j
  nunmap <buffer> k
  setlocal nospell
  setlocal tw=0
  setlocal fo-=1
  echo "Prose formatting mode OFF"
  let b:prose_mode_enabled=0
endfunction

function! ProseFormattingToggle()
  if exists('b:prose_mode_enabled') && b:prose_mode_enabled
    call ProseFormattingOff()
  else
    call ProseFormattingOn()
  endif
endfunction

command! ProseOn  call ProseFormattingOn()
command! ProseOff call ProseFormattingOff()
command! Prose    call ProseFormattingToggle()


" Pager Function for 'view' {{{2
" Used for paging in a view command (like more)
function! ViewSetup( )
    if &spell
        call SetSpellingNavigation()
    endif
    if g:viewState == 0
        setlocal modifiable
        "filetype detect
        silent! nunmap <buffer> q
        silent! nunmap <buffer> f
        silent! nunmap <buffer> b
        echo "View Mode: Off"
        let g:viewState = 1
    else
        setlocal nomodifiable
        silent! nnoremap q :q!<Cr>
        silent! nnoremap f <C-f>
        silent! nnoremap b <C-b>
        if g:viewState != 2
            echo "View Mode: On ( f Page-Down, b Page-Up, q Quit )"
        endif
        let g:viewState = 0
    endif
endfunction


" Rename file with buffer name update {{{2
function! RenameFile(new_name)
  let old_name = expand('%')
  if a:new_name != '' && a:new_name != old_name
    exec ':saveas ' . a:new_name
    exec ':silent !rm ' . old_name
    redraw!
  else
    echohl WarningMsg | echo "Nothing to rename" | echohl None
  endif
endfunction
command! -nargs=1 -complete=file MV call RenameFile("<args>")

" Custom 'tabline' {{{2
let g:ember_pod_types = {
      \"component": "C",
      \"template": "T",
      \"controller": "CN",
      \"route": "R",
      \"service": "S",
      \"model": "M"
      \}

if exists("+showtabline")
  function! TabNameFor(file)
    let isTest = v:false
    let name = fnamemodify(a:file, ':p:t')
    if name == ''
      return '[No Name]'
    endif
    let type = fnamemodify(a:file, ':p:t:r')
    if type =~ "-test$"
      let isTest = v:true
      let type = substitute(type, "-test$", "", "")
    endif
    if !has_key(g:ember_pod_types, type)
      return name
    endif
    let name = fnamemodify(a:file, ':p:h:t')
    let typeCode = g:ember_pod_types[type]
    if isTest
      let typeCode .= '-T'
    endif
    return typeCode . ':' . name
  endfunction

  function! MyTabLine()
    let s = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
      let buflist = tabpagebuflist(i)
      let winnr = tabpagewinnr(i)
      let s .= '%' . i . 'T'
      let s .= (i == t ? '%1*' : '%2*')
      let s .= '[' . i . ']'
      let s .= '%*'
      let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
      let s .= TabNameFor(bufname(buflist[winnr - 1]))
      let i = i + 1
    endwhile
    let s .= '%T%#TabLineFill#%='
    let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
    return s
  endfunction
  set showtabline=1
  set tabline=%!MyTabLine()
endif

" Blink Highlight Next Search {{{2
function! HLNext (blinktime)
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  let target_pat = '\c\%#\%('.@/.'\)'
  let ring = matchadd('Search', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

" Toggle relative numbers (globally) {{{2
function! ToggleRelativeNumbers()
  let current_buffer = bufnr('%')
  if &relativenumber
    bufdo set norelativenumber
  else
    bufdo set relativenumber
  endif
  exec 'buf ' . current_buffer
endfunction

" Section: Misc. {{{1
" Is there a tags file? If so I'd like to use it's absolute path in case we
" chdir later
if filereadable("tags")
    exec "set tags+=" . getcwd() . "/tags"
endif

" Allow easy creation of tags. Assuming ctags installed.
command! Ctags !ctags -R --exclude=.svn --exclude=.git --exclude=log*

" Are we using VIM as a pager?
if v:progname =~ "view"
    au BufRead * set ro
    setlocal nomodified
    let g:viewState = 2
    call ViewSetup()
else
    let g:viewState = 1
    nnoremap <Leader>vv :call ViewSetup()<Cr>
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
  return '(' . unicode . branch . ')'
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

" Dynamic Ale errors {{{2
function! ALEStatus() abort
  if !exists('*ale#statusline#Count')
    return ''
  endif

  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? 'OK' : printf(
  \   '%dW %dE',
  \   all_non_errors,
  \   all_errors
  \)
endfunction

" Dynamic vertical spacing {{{2
function! RedrawStatusLine()
  if &lines < 20
    set laststatus=0
    set noshowcmd
  else
    set laststatus=2
    set showcmd
  endif
endfunction

augroup vimrc
  au VimResized * call RedrawStatusLine()
augroup END

call RedrawStatusLine()

" Status Function: {{{2
function! Status(winnr)
  let stat = ''
  let active = winnr() == a:winnr
  let buffer = winbufnr(a:winnr)
  let size = winwidth(a:winnr)

  let modified = getbufvar(buffer, '&modified')
  let readonly = getbufvar(buffer, '&ro')
  let fname = bufname(buffer)

  function! Color(active, num, content)
    if a:active
      return '%' . a:num . '*' . a:content . '%*'
    else
      return a:content
    endif
  endfunction

  let stat .= Color(active, 2, '%3n:')         "buffer number

  " file
  let stat .= ' %<'

  if fname == '__Gundo__'
    let stat .= 'Gundo'
  elseif fname == '__Gundo_Preview__'
    let stat .= 'Gundo Preview'
  else
    let stat .= '%f'
  endif

  if size > 100
    let stat .= ' (%{strlen(&fenc)?&fenc:"none"},' "file encoding
    let stat .= '%{&ff})'    "file format
    let stat .= '%y'         "filetype
  endif

  if size > 20
    let stat .= '%h'         "help file flag
    let stat .= '%w'         "Preview window flag
  endif

  if size > 20 && version >= 730
    let stat .= '%q'       "Quickfix list flag
  endif

  let stat .= Color(active, 2, '%m')
  let stat .= Color(active, 2, '%r')

  let stat .= '%='         "left/right separator

  if active && &paste
    let stat .= Color(active, 2, '[P]') . ' '
  endif

  if size > 100
    let stat .= '%{DynamicFugitiveStatus()}' "git branch
  endif

  let stat .= ' %P '        "percent through file

  if size > 100
    if has('mac')
      let stat .= '␊ '       "unicode FTW!
    endif
    let stat .= '%l:'        "cursor line/total lines
    let stat .= '%c'         "cursor column

    if exists('*ALEStatus')
      let stat .= '%#warningmsg#%{ALEStatus()}%*'
    else
      let stat .= '%#warningmsg#%{DynamicSyntasticStatus()}%*'
    endif
  else
    let stat .= '%c'         "cursor column
  endif

  return stat
endfunction
" }}}

" Status AutoCMD: {{{2
function! SetStatus()
  for nr in range(1, winnr('$'))
    call setwinvar(nr, '&statusline', '%!Status('.nr.')')
  endfor
endfunction

augroup status
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter,BufUnload * call SetStatus()
augroup END

" Section: Theming {{{1
" Solarized theme {{{2
" set t_Co=16
" let g:solarized_termcolors=16
let g:solarized_termtrans = 1
let g:solarized_hitrail = 0
silent! call togglebg#map("<F5>")

command! Solarized16  let g:solarized_termcolors=16 | colorscheme solarized
command! Solarized256 let g:solarized_termcolors=256 | colorscheme solarized

" Color scheme {{{2
set background=dark
" fail late, reverse preferential order
silent! colorscheme darkblue
silent! colorscheme zenburn
silent! colorscheme solarized

" Syntax / Highlight {{{2
hi! User1 ctermfg=33  guifg=#268bd2  ctermbg=15 guibg=#fdf6e3 gui=bold
hi! User2 ctermfg=125 guifg=#d33682  ctermbg=7  guibg=#eee8d5 gui=bold
hi! User3 ctermfg=64  guifg=#719e07  ctermbg=7  guibg=#eee8d5 gui=bold
hi! User4 ctermfg=37  guifg=#2aa198  ctermbg=7  guibg=#eee8d5 gui=bold
hi! link SignColumn LineNr
hi! link ALESignColumnWithErrors DiffDelete
hi! link ALESignColumnWithoutErrors LineNr

match ErrorMsg '\%120v.\+'
match ErrorMsg '\s\+$'
" }}}1

" Load abbreviations
runtime abbrev.vim
runtime digraphs.vim

" So multiple places can have a special config without affecting the core
" vimrc.
runtime local.vim

" vim600:set fdm=marker sw=2 ts=2 et:
