function SortWords(str)
  return join(sort(split(a:str)), ' ')
endfunction

silent! call toop#mapFunction('SortWords', '<leader>gs')
