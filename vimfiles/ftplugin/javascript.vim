if !exists('b:module_prefix')
  try
    for line in readfile(findfile('config/environment.js'), '', 20)
      if line =~ 'modulePrefix:'
        let b:module_prefix=substitute(substitute(line,"^.[^']*'",'',''),"'.*$",'','')
        break
      endif
    endfor
  catch
  endtry
endif

if !exists('b:module_prefix') && isdirectory('addon')
  try
    for line in readfile(findfile('package.json'), '', 10)
      if line =~ '"name":'
        let b:module_prefix=substitute(substitute(line,'^\s*"name":.[^"]*"','',''),'".*$','','')
        break
      endif
    endfor
  catch
  endtry
endif

if exists('b:module_prefix')
  set includeexpr=substitute(v:fname,'^'.b:module_prefix.'/','','')
endif

setlocal include=\\%(require(\\\|from\\s+\\)
setlocal path+=app,addon
setlocal suffixesadd=.js

" vim:et
