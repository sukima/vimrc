" Build a new .vim directory from CVS Repository
" ==============================================
"
" The vimrc repository I have only holds the basic files. It doesn't include
" the extras like the symlinks for the ftplugins or the documentation install.
"
" This script will build that extra stuff that isn't part of the repository.
" Almost like an install script.
"
" This script *Assumes* it is already in $HOME/.vim/scripts and the $HOME/.vim
" tree is that of the cvs checkout of the vimrc repository.

" NOTE: run this file from inside vim or use the -S option. (The -s option
" will not work!)

" Always edit a blank buffer
enew
only

" Setup .vimrc and .gvimrc
" ------------------------

" Find assumed $HOME fropm *reletive* path (In case $HOME isn't the installed
" location
let foo = expand ("<s:file>:p:h:h:h")
call append (line("$"), "Changing directory to ". foo)
exec "cd". foo

" symlink .vimrc and .gvimrc
call append (line("$"), "Linking .vim/vimrc to .vimrc")
$ mark a " Used to indent output
let foo = system ("ln -s .vim/vimrc .vimrc")
call append (line("$"), foo)
'a+1,$> " Used to indent output
call append (line("$"), "Linking .vim/gvimrc to .gvimrc")
$ mark a " Used to indent output
let foo = system ("ln -s .vim/gvimrc .gvimrc")
call append (line("$"), foo)
'a+1,$> " Used to indent output

call append (line("$"), "Changing directory to .vim/ftplugin")

" Add xml-plugin documentation
call append (line("$"), "Installing xml-plugin documentation")
cd <sfile>:p:h:h
cd ftplugin
call append (line("$"), "Sourcing xml.vim")
source xml.vim

" Build html.vim from documentation
if !filereadable("html.vim")
    call append (line("$"), "Building html.vim from example in :help xml-plugin-html")
    let bufnum = bufnr("%")
    new ../doc/xml-plugin.txt
    /FileType: \+HTML
    ?^>
    +1 mark a
    /^<
    -1 mark b
    'a,'b yank
    close
    new html.vim
    0 put
    $ delete
    % s/^  //
    update
    close
    exec "buf ". bufnum
    call append (line("$"), "html.vim build complete")
else
    call append (line("$"), "Skipping html.vim build (file exists)")
endif

" symlink for file types
" ANT => XML
call append (line("$"), "Linking ant.vim to xml.vim")
$ mark a " Used to indent output
let foo = system ("ln -s xml.vim ant.vim")
call append (line("$"), foo)
'a+1,$> " Used to indent output

" PHP => HTML
call append (line("$"), "Linking php.vim to html.vim")
$ mark a " Used to indent output
let foo = system ("ln -s html.vim php.vim")
call append (line("$"), foo)
'a+1,$> " Used to indent output

" SGML => XML
call append (line("$"), "Linking sgml.vim to xml.vim")
$ mark a " Used to indent output
let foo = system ("ln -s xml.vim sgml.vim")
call append (line("$"), foo)
'a+1,$> " Used to indent output

" XHTML => XML
call append (line("$"), "Linking xhtml.vim to xml.vim")
$ mark a " Used to indent output
let foo = system ("ln -s xml.vim xhtml.vim")
call append (line("$"), foo)
'a+1,$> " Used to indent output

1 delete " Clear out blank line at top of output
set nomodified
