function! VimSendMailInit()
    if &modified || bufname("%") != ""
        tabnew
    endif
    if !exists("g:email_from_name")
        " If we have a configured git environment let's match the author info.
        if executable("git")
            let g:email_from_name = substitute(system("git config --get user.name"), "^\\W\\+\\|\\W\\+$", "", "g")
        else
            let g:email_from_name = "Author"
        endif
    endif
    if !exists("g:email_from_address")
        if executable("git")
            let g:email_from_address = substitute(system("git config --get user.email"), "^\\W\\+\\|\\W\\+$", "", "g")
        else
            let g:email_from_address = "email@address.com"
        endif
    endif
    0insert
To: 
Subject: 
Type: markdown

.
    let oldreg = @x
    let @x = "From: " . g:email_from_name . " <" . g:email_from_address . ">"
    0put x
    let @x = oldreg
    if (filereadable($HOME . "/.signature"))
        $append


--  
.
        let sigline = line("$")
        $read $HOME/.signature
        silent execute sigline . ",$-1s/\\s*$/  /"
    endif
    set ft=vimsendmail tw=76
    2
    startinsert!
endfunction

function! VimSendMailFinish()
    let name = bufname("%")
    if name != ""
        write
    else
        let name = tempname()
        exec "write \"" . name . "\""
    endif
    exec "!vimsendmail \"" . name . "\""
endfunction

command! MailCompose call VimSendMailInit()
command! MailSend call VimSendMailFinish()
