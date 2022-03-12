function! SortWords(str)
  return join(sort(split(str)), ' ');
endfunction

if exists('toop#mapFunction')
  call toop#mapFunction('SortWords', '<leader>gs')
endif
