" Vim syntax file
" Language:	SGML-DTD (supported by sgmltools-2.x and DocBook)
"		For more information, visit
"		http://nis-www.lanl.gov/~rosalia/mydocs/docbook-intro.html
"		ftp://sourceware.cygnus.com/pub/docbook-tools
" Maintainer:	Devin Weaver <devin@tritarget.com>
"		Author and previous maintainer:
"               Sung-Hyun Nam <namsh@kldp.org>
" Filenames:	*.sgml
" URL:		ftp://tritarget.com/pub/vim/syntax/sgml.vim
" Last Change:	May 04, 2001

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

" tags
syn match   sgmlTagError ">"
syn match   sgmlErrInTag contained "<"
syn region  sgmlEndTag	start=+</[a-zA-Z]+ end=+>+ contains=@DocBk
syn match   sgmlEndTag	"</>"
syn region  sgmlTag	start=+<[a-zA-Z]+ end=+>+
			\ contains=@DocBk,sgmlAssign
syn region  sgmlStr	contained start=+L\="+ end=+"+
syn region  sgmlAssign  contained start=+=+hs=e+1 end=+[ \t\>]+me=s-1
			\ contains=sgmlStr
syn region  sgmlSpecial oneline start="&" end=";"
syn region  sgmlComment start=+<!--+ end=+-->+
syn region  sgmlDocEntI contained start=+\[+ end=+]+ contains=@sgmlDTD
syn region  sgmlDocType start=+<!doctype\s+ end=+>+
			\ contains=sgmlDocEntI,sgmlStr

syn include @DocBk <sfile>:p:h/docbk.vim
syn include @sgmlDTD <sfile>:p:h/dtd.vim

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_sgml_syn_inits")
  if version < 508
    let did_sgml_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink sgmlTag	Special
  HiLink sgmlEndTag	Special
  HiLink sgmlEntity	Type
  HiLink sgmlDocEnt    Type
  HiLink sgmlComment	Comment
  HiLink sgmlSpecial	Special
  HiLink sgmlDocType   PreProc
  HiLink sgmlStr	String
  HiLink sgmlAssign	String
  HiLink sgmlTagError	Error
  HiLink sgmlErrInTag	Error

  delcommand HiLink
endif

let b:current_syntax = "sgml"

" vim:set tw=78 ts=8 sts=2 sw=2 noet com=nb\:":
