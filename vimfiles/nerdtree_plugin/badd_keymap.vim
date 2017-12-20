" ============================================================================
" File:        badd_keymap.vim
" Description: plugin for NERD Tree that adds a file to the buffer list
" Maintainer:  Devin Weaver <suki at tritarget dot com>
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
"
" ============================================================================
if exists("g:loaded_nerdtree_badd_keymap")
  finish
endif
let g:loaded_nerdtree_badd_keymap = 1

call NERDTreeAddKeyMap({
      \ 'key': 'a',
      \ 'quickhelpText': 'add to buffer list',
      \ 'callback': 'NERDTreeBAddFile',
      \ 'scope': 'FileNode' })

function! NERDTreeBAddFile(filenode)
  exec ':badd ' . a:filenode.path.str({'format': 'Edit'})
  let filename = a:filenode.path.getLastPathComponent(0)
  let buffernumber = bufnr(a:filenode.path.str())
  echo 'Buffer ' . buffernumber . ' loaded: ' . filename
endfunction
