" Only load this indent file when no other was loaded.
if exists("b:did_indent")
    finish
endif
let b:did_indent = 1
setlocal cindent

setlocal indentexpr=
finish

" Set the function to do the work.
setlocal indentexpr=GetCocoaIndent()

" To make a colon (:) suggest an indentation other than a goto/swich label,
setlocal indentkeys-=:
setlocal indentkeys+=<:>

" Only define the function once.
if exists("*GetCocoaIndent")
    finish
endif


function GetCocoaIndent()
    let theIndent = cindent(v:lnum)

    " Don't know what to do here.

    return theIndent
endfunction
