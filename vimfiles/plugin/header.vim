if exists("*FindHeaderFile")
    finish
endif

function! FindHeaderFile( )
    if (&ft == "cocoa")
        if (expand("%:e") == "h")
            let hfile="m"
            let isHeader=1
        else
            let hfile="h"
            let isHeader=0
        endif
    else
        let hfile="h"
        let isHeader=0
    endif

    execute "new %<." . hfile

    if (isHeader == 1)
        wincmd r
        wincmd w
    endif

    resize 12
    wincmd w
endfunc

nmap <Leader>hh :call FindHeaderFile()<Cr>
