function! EmberLoadAltFile(file)
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
  exec 'edit ' . altFile
endfunction

command! A call EmberLoadAltFile("%")
