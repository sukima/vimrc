augroup cocoa
    au!
    au BufRead,BufNewFile *.h,*.m   set filetype=cocoa
    au BufEnter *.h let b:fswitchdst = 'mm,m'
    au BufEnter *.h let b:fswitchlocs = 'rel:Classes'
    au BufEnter *.m let b:fswitchdst = 'h'
    au BufEnter *.m let b:fswitchlocs = 'rel:Classes'
augroup END
