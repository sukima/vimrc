" Vim syntax file
" Language:	generic ChangeLog file
" Maintainer:	Devin Weaver <devin@tritarget.com>
" Former Maintainer: Gediminas Paulauskas <menesis@delfi.lt>
" Last Change:	May 03, 2001

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

syn match	chlogHeader	"^\S.*$" contains=chlogNumber,chlogMonth,chlogDay,chlogMail
syn match	chlogText	"^\t.*$" contains=chlogBullet
syn match	chlogBullet	contained "^\t\*\s\(.\{-}:\)\=" contains=chlogFiles
syn match	chlogFiles	contained "[^\*]\{-}:"
syn match	chlogMail	contained "<[A-Za-z0-9\._-]\+@[A-Za-z0-9\._-]\+>"
syn keyword	chlogMonth	contained jan feb mar apr may jun jul aug sep oct nov dec
syn keyword	chlogDay	contained mon tue wed thu fri sat sun
syn match	chlogNumber	contained "[0-9]"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_chlog_syn_inits")
  if version < 508
    let did_chlog_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink chlogText	Normal
  HiLink chlogBullet	Statement
  HiLink chlogFiles	Comment
  HiLink chlogHeader	Type
  HiLink chlogMail	Special
  HiLink chlogNumber	Number
  HiLink chlogMonth	Number
  HiLink chlogDay	Number

  delcommand HiLink
endif

set tw=80

let b:current_syntax = "chlog"

" vim: ts=8
