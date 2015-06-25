" Section: Auto Correction {{{1
" Misspellings provided by ~/.vim/after/plugin/abolish.vim

" Convince date completion commands
cab _fulldate strftime("%a %b %d %T %Z %Y")
cab _date strftime("%Y-%m-%d %H:%M")
cab sdate strftime("%m/%d/%y")
cab ldate strftime("%B %d, %Y")
cab fdate strftime("%m%d%Y")

" Miscellaneous abbreviations not suitable for Abolish.
ab funciton function
ab fucntion function
ab functoin function
ab HttpServletResponce HttpServletResponse
ab CancelationError CancellationError
ab CanclationError CancellationError

" Personal goofy emoji
iab &shrug; ¯\_(ツ)_/¯
iab &mshrug; ¯\\\_(ツ)\_/¯
iab &bear; ʕ •ᴥ•ʔ
iab &rage; ლ(ಠ益ಠლ)
iab &flip; (╯°□°）╯︵ ┻━┻
