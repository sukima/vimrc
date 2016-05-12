" Vim syntax file
" Language:     Slack
" Maintainer:   Devin Weaver <suki@tritarget.org>

if exists("b:current_syntax")
  finish
endif

syn case ignore

syn cluster slackEntities contains=slackUrl,slackLink,slackInlineCode,slackEmoji,slackChannel,slackMention
syn cluster slackInline contains=@slackEntities,slackBold,slackItalic

syn match slackBold "\*[^\*]\+\*" oneline contains=@slackEntities
syn match slackItalic "_[^_]\+_" oneline contains=@slackEntities
syn match slackEmoji ":[[:alnum:]]\+:" oneline
syn match slackInlineCode "`[^`]\+`" oneline
syn match slackLink "<[^>]*|[^>]*>" oneline contains=slackUrl
syn match slackUrl "\<https\?://[[:alnum:]-_.+%?=&#/:]\+" oneline
syn match slackUrl "\<[[:alnum:]-_.+]\+@[[:alnum:]-_.+]\+" oneline
syn match slackChannel "#[[:alnum:]-_]\+" oneline
syn match slackMention "@[[:alnum:]-_.]\+" oneline

syn match slackQuote "^>.*$" oneline contains=@slackInline
syn region slackCodeBlock start="```" end="```" contains=slackCodeDelimiter
syn match slackCodeDelimiter "```" contained

hi def slackBold   term=bold cterm=bold gui=bold
hi def slackItalic term=italic cterm=italic gui=italic

hi def link slackEmoji         Type
hi def link slackChannel       Type
hi def link slackMention       Type
hi def link slackInlineCode    Statement
hi def link slackLink          Statement
hi def link slackUrl           Function
hi def link slackQuote         Comment
hi def link slackCodeDelimiter Delimiter

let b:current_syntax = "slack"

" vim:set sw=2:
