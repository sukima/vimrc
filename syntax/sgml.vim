" Vim syntax file
" Language:	SGML-DTD (supported by sgmltools-2.x and DocBook)
"		For more information, visit
"		http://nis-www.lanl.gov/~rosalia/mydocs/docbook-intro.html
"		ftp://sourceware.cygnus.com/pub/docbook-tools
" Maintainer:	Devin Weaver <ktohg@tritarget.com>
"		Author and previous maintainer:
"               Sung-Hyun Nam <namsh@kldp.org>
" Filenames:	*.sgml
" URL:		ftp://tritarget.com/pub/vim/syntax/sgml.vim
" Last Change:	Nov 07, 2000
" $Id$

" Remove any old syntax stuff hanging around
syn clear
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

if !exists("did_sgml_syntax_inits")
  let did_sgml_syntax_inits = 1
  " The default methods for highlighting.  Can be overridden later
  hi link sgmlTag	Special
  hi link sgmlEndTag	Special
  hi link sgmlEntity	Type
  hi link sgmlDocEnt    Type
  hi link sgmlComment	Comment
  hi link sgmlSpecial	Special
  hi link sgmlDocType   PreProc
  hi link sgmlStr	String
  hi link sgmlAssign	String
  hi link sgmlTagError	Error
  hi link sgmlErrInTag	Error
endif

let b:current_syntax = "sgml"

" vim:set tw=78 ts=8 sts=2 sw=2 noet com=nb\:":
