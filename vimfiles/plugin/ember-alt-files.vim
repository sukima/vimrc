function! EmberLoadAltFile(file, editCommand)
  let path = fnamemodify(bufname(a:file), ':p:h')
  let name = fnamemodify(bufname(a:file), ':p:t')
  if name == 'template.hbs'
    let altFile = path . '/component.js'
    if !filereadable(altFile)
      let altFile = path . '/controller.js'
    endif
  elseif name == 'controller.js' || name == 'component.js'
    let altFile = path . '/template.hbs'
  endif
  if !filereadable(altFile)
    echohl Error
    echo 'Alternate file not found'
    echohl NONE
    return
  endif
  exec a:editCommand . ' ' . fnameescape(altFile)
endfunction

command! A call EmberLoadAltFile('%', 'edit')
command! AS call EmberLoadAltFile('%', 'split')
command! AT call EmberLoadAltFile('%', 'tabe')
command! AV call EmberLoadAltFile('%', 'vsplit')
