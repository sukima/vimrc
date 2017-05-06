" Name:     commit-link.vim
" Version:  1.0
" Author:   Devin Weaver <suki@tritarget.org>
" Summary:  Link to a commit using Git's contributing guide line format.
" Licence:  This program is free software; you can redistribute it and/or
"           modify it in any way you wish. If you find a modification
"           useful it is encouraged you offer this modification back to the
"           community and the original author. (MIT)

function! GitLink(commitref)
  if empty(a:commitref)
    let commitref = a:commitref
  else
    let commitref = shellescape(a:commitref)
  endif
  try
    silent let commitlink = system("git show -s " .
      \ "--no-show-signature " .
      \ "--date=short " .
      \ "--pretty='format:%h (\"%s\", %ad)' " .
      \ commitref)
  endtry
  return commitlink
endfunction

function! LinkToCommitAtCursor()
  let commitref = expand("<cWORD>")
  let commitlink = GitLink(commitref)
  if empty(commitref)
    exec "normal a" . commitlink
  else
    exec "normal ciW" . commitlink
  endif
endfunction

nmap <Leader>C :call LinkToCommitAtCursor()<Cr>
imap <C-x>c <C-o>:call LinkToCommitAtCursor()<Cr>
