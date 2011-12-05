" Vim syntax file
" Language:     Inform7
" Maintainer:   Leslie Viljoen (leslieviljoen@gmail.com)
" Last Change:  18 April 2011
" URL:          http://www.lesismore.co.za
" Revision:     2.0

" Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endi

syn case ignore

syn keyword i7Conditional begin
syn keyword i7Conditional end if
syn keyword i7Conditional if
syn keyword i7Conditional otherwise
syn keyword i7Statement understand
syn keyword i7Rules Check
syn keyword i7Rules Carry out
syn keyword i7Rules report
syn keyword i7Rules before
syn keyword i7Rules after
syn keyword i7Rules rule
syn keyword i7Rules activity
syn keyword i7Rules instead
syn keyword i7Operator when
syn keyword i7Operator can be
syn keyword i7Operator while
syn keyword i7Operator for
syn keyword i7Statement now
syn keyword i7Statement continue
syn keyword i7Statement kind

syn keyword i7Keyword say
syn keyword i7Delimiter person
syn keyword i7Delimiter thing
syn keyword i7Delimiter container
syn keyword i7Delimiter supporter
syn keyword i7Delimiter room

syn keyword i7Point open
syn keyword i7Point closed
syn keyword i7Point locked
syn keyword i7Point unlocked 


syn region i7Comment start=/\[/ end=/\]/ 
syn region i7Heading start=/\n^\([vV]olume\|[bB]ook\|[pP]art\|[cC]hapter\|[sS]ection\)/ end=/\n\ze\n/
syn region i7i6 start=/(-/ end=/-)/
syn region i7Substitution start=/\[/ end=/\]/ contained 
syn region i7String start=+"+ skip=+\\\\+ end=+"+ contains=i7Substitution

syn region i7VolumeFold start = /\n^[vV]olume\s/ end=/\ze\n^[vV]olume/ fold transparent contains=ALL keepend
syn region i7BookFold start = /\n^[bB]ook\s/ end=/\ze\n^[bB]ook/ fold transparent contains=ALLBUT,i7VolumeFold keepend
syn region i7PartFold start = /\n^[pP]art\s/ end=/\ze\n^[pP]art/ fold transparent contains=ALLBUT,i7VolumeFold,i7BookFold  keepend
syn region i7ChapterFold start = /\n^[cC]hapter\s/ end=/\ze\n^[cC]hapter/ fold transparent contains=ALLBUT,i7VolumeFold,i7BookFold,i7PartFold keepend 
syn region i7SectionFold start = /\n^[sS]ection\s/ end=/\ze\n^[sS]ection/ fold transparent contains=ALLBUT,i7VolumeFold,i7BookFold,i7PartFold,i7ChapterFold keepend


syn match i7Punctuation /[,.;:]/

hi def link i7Conditional Conditional
hi def link i7Keyword Keyword
hi def link i7Rules Special
hi def link i7Point Underlined
hi def link i7Operator Operator
hi def link i7Delimiter Delimiter
hi def link i7Statement Statement
hi def link i7Punctuation Constant
hi def link i7Reserved Identifier
hi def link i7String Constant
hi def link i7i6 PreProc
hi def link i7Comment Comment

"isd:
"hi def link i7Heading Todo
"hi def link i7Substitution Label

"les:
hi def link i7Heading Statement
hi def link i7Substitution Type

syn sync fromstart

"This autocommand resyncs the folding whenever the user leaves insert
"mode. You can remove this if performance is slow but you may have to 
"manually resync now and then with :syn sync fromstart
au InsertLeave *.ni syn sync fromstart

set foldmethod=syntax
let b:current_syntax = "inform7"

" vim: ts=8
