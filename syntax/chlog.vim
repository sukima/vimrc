" Vim syntax file
" Language:	generic ChangeLog file
" Maintainer:	Gediminas Paulauskas <menesis@delfi.lt>
" Last Change:	Nov 20, 2000

" remove any old syntax stuff hanging around
syn clear

syn case ignore

syn match	chlogHeader	"^\S.*$" contains=chlogNumber,chlogMonth,chlogDay,chlogMail
syn match	chlogText	"^\t.*$" contains=chlogBullet
syn match	chlogBullet	contained "^\t\*\s\(.\{-}:\)\=" contains=chlogFiles
syn match	chlogFiles	contained "[^\*]\{-}:"
syn match	chlogMail	contained "<[A-Za-z0-9\._-]\+@[A-Za-z0-9\._-]\+>"
syn keyword	chlogMonth	contained jan feb mar apr may jun jul aug sep oct nov dec
syn keyword	chlogDay	contained mon tue wed thu fri sat sun
syn match	chlogNumber	contained "[0-9]"

if !exists("did_chlog_syntax_inits")
  let did_changelog_syntax_inits = 1
  " The default methods for highlighting.  Can be overridden later
  hi link chlogText	Normal
  hi link chlogBullet	Statement
  hi link chlogFiles	Comment
  hi link chlogHeader	Type
  hi link chlogMail	Special
  hi link chlogNumber	Number
  hi link chlogMonth	Number
  hi link chlogDay	Number
endif

set tw=80

let b:current_syntax = "chlog"

" vim: ts=8
