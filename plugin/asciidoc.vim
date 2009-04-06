" Name:     asciidoc.vim
" Version:  0.1
" Author:   Devin Weaver <suki@tritarget.org>
" Summary:  Personal Vim plugin to easily prepare a text file for asciidoc
"           notation.
" Licence:  This program is free software; you can redistribute it and/or
"           modify it in any way you wish. If you find a modification
"           useful it is encouraged you offer this modification back to the
"           community and the original author.

let author_name = "Author"
let author_email = "email@address.com"

" If we have a configured git environment let's match the author info.
if executable("git")
    let author_name = substitute(system("git config --get user.name"), "^\\W\\+\\|\\W\\+$", "", "g")
    let author_email = substitute(system("git config --get user.email"), "^\\W\\+\\|\\W\\+$", "", "g")
endif

function! <SID>PrepareAsciidoc(bang,title)
    if empty(a:title)
        if empty(a:bang)
            let title = input("Title of document: ")
        else
            let title = "Title"
        endif
    else
        let title = a:title
    endif
    let x = append(0, ['= '.title, g:author_name . ' <' . g:author_email . '>', 'Draft, ' . strftime('%B %d, %Y')])
    let x = append(line('$'), '// vi'.'m:set ai et ts=8 sw=4 syntax=asciidoc:')
endfunction

command! -nargs=* -bang Asciidoc call s:PrepareAsciidoc("<bang>","<args>")
