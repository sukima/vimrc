inoremap <silent><expr> <c-x><c-x> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gdd <Plug>(coc-definition)
nmap <silent> gdy <Plug>(coc-type-definition)
nmap <silent> gdi <Plug>(coc-implementation)
nmap <silent> gdr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

call coc#add_extension('coc-json')
call coc#add_extension('coc-tsserver')
call coc#add_extension('coc-snippets')
call coc#add_extension('coc-html')
call coc#add_extension('coc-css')
call coc#add_extension('coc-emmet')
call coc#add_extension('coc-ember')
