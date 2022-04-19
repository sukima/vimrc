function SortWords(str)
  return join(sort(split(a:str)), ' ')
endfunction

call toop#mapFunction('SortWords', '<leader>gs')
