if executable('muttqt') > 0
  fun! CompleteEmails(findstart, base)
    if a:findstart
      let line = getline('.')
      "locate the start of the word
      let start = col('.') - 1
      while start > 0 && line[start - 1] =~ '[^:,]'
        let start -= 1
      endwhile
      return start + 1
    else
      " find the addresses ustig the external tool
      " the tools must give properly formated email addresses
      let res = []
      let query = split(system('muttqt -q ' . shellescape(a:base)), '\n')
      for m in query[1:]
        let entry = split(m, '\t')
        let email = entry[0]
        let name = entry[1]
        let service = entry[2]
        if !empty(name)
          let email = '"' . name . '" <' . email . '>'
        endif
        call add(res, {'word': email, 'menu': service})
      endfor
      return res
    endif
  endfun

  fun! UserComplete(findstart, base)
    " Fetch current line
    let line = getline(line('.'))
    " Is it a special line?
    if line =~ '^\(To\|Cc\|Bcc\|From\|Reply-To\):'
      return CompleteEmails(a:findstart, a:base)
    endif
  endfun

  set completefunc=UserComplete
endif
