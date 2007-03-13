" these settings may also be put in ~/.vim/ftplugin/Wikipedia.vim
setlocal textwidth=0
setlocal linebreak
setlocal matchpairs+=<:>
setlocal encoding=utf8
if exists ("*SetWrapNavigation")
    setlocal nowrap " Force function to turn on wrapping
    call SetWrapNavigation()
else
    setlocal wrap
endif
