" Vim syntax file
" Language:	Microsoft VBScript Web Content (ASP)
" Maintainer:	Devin Weaver <devin@tritarget.com>
" URL:		ftp://tritarget.com/vim/syntax
" Last change:	1999 Sep 02

" Remove any old syntax stuff hanging around
syn clear

if !exists("main_syntax")
  let main_syntax = 'asp'
endif

let main_syntax_save = main_syntax
" set to java because that's what html.vim looks for to determine wether to
" include vb or not.
let main_syntax = 'java'
so <sfile>:p:h/html.vim
let main_syntax = main_syntax_save
unlet main_syntax_save

syn cluster htmlPreProc add=aspVBScriptInsideHtmlTags

" Functions and methods that are in VB but will cause errors in an ASP page
" This is helpfull if your porting VB code to ASP
" I removed (Count, Item) because these are common variable names in VBScript
syn keyword aspVBError contained Val Str CVar CVDate DoEvents GoSub Return GoTo
syn keyword aspVBError contained Date Time Timer Stop LinkExecute
syn keyword aspVBError contained Add With Type LinkPoke
syn keyword aspVBError contained LinkRequest LinkSend Declare New Optional Sleep
syn keyword aspVBError contained ParamArray Static Erl TypeOf Like LSet RSet Mid StrConv
" It may seem that most of these can fit into a keyword clause but keyword takes
" priority over all so I can't get the multi-word matches
syn match aspVBError contained "\<Def[a-zA-Z0-9_]\+\>"
syn match aspVBError contained "^\s*Open"
syn match aspVBError contained "Debug\.[a-zA-Z0-9_]*"
syn match aspVBError contained "^\s*[a-zA-Z0-9_]\+:"
syn match aspVBError contained "[a-zA-Z0-9_]\+![a-zA-Z0-9_]\+"
syn match aspVBError contained "^\s*#.*$"
syn match aspVBError contained "\<As\s\+[a-zA-Z0-9_]*"
syn match aspVBError contained "\<End\>\|\<Exit\>"
syn match aspVBError contained "\<On\s\+Error\>\|\<On\>\|\<Error\>\|\<Resume\s\+Next\>\|\<Resume\>"
syn match aspVBError contained "\<Option\s\+\(Base\|Compare\|Private\s\+Module\)\>"
syn match aspVBError contained "\<Property\s\+\(Get\|Let\|Set\)\>"

" VBScript Reserved Words.
syn match aspVBStatement contained "\<On\s\+Error\s\+Resume\s\+Next\>\|\<Next\>"
syn match aspVBStatement contained "\<End\s\+\(If\|For\|Select\|Function\|Sub\)\>"
syn match aspVBStatement contained "\<Exit\s\+\(Do\|For\|Sub\|Function\)\>"
syn match aspVBStatement contained "\<Option\s\+Explicit\>"
syn match aspVBStatement contained "\<For\s\+Each\>\|\<For\>"
syn match aspVBStatement contained "\<Set\>"
syn keyword aspVBStatement contained Call Const Dim Do Loop Erase And
syn keyword aspVBStatement contained Function If Then Else ElseIf Or
syn keyword aspVBStatement contained Private Public Randomize ReDim 
syn keyword aspVBStatement contained Select Case Sub While Wend Not

" VBScript Functions
syn keyword aspVBFunction contained Abs Array Asc Atn CBool CByte CCur CDate CDbl
syn keyword aspVBFunction contained Chr CInt CLng Cos CreateObject CSng CStr Date
syn keyword aspVBFunction contained DateAdd DateDiff DatePart DateSerial DateValue
syn keyword aspVBFunction contained Day Exp Filter Fix FormatCurrency
syn keyword aspVBFunction contained FormatDateTime FormatNumber FormatPercent
syn keyword aspVBFunction contained GetObject Hex Hour InputBox InStr InStrRev Int
syn keyword aspVBFunction contained IsArray IsDate IsEmpty IsNull IsNumeric
syn keyword aspVBFunction contained IsObject Join LBound LCase Left Len LoadPicture
syn keyword aspVBFunction contained Log LTrim Mid Minute Month MonthName MsgBox Now
syn keyword aspVBFunction contained Oct Replace RGB Right Rnd Round RTrim
syn keyword aspVBFunction contained ScriptEngine ScriptEngineBuildVersion
syn keyword aspVBFunction contained ScriptEngineMajorVersion
syn keyword aspVBFunction contained ScriptEngineMinorVersion Second Sgn Sin Space
syn keyword aspVBFunction contained Split Sqr StrComp StrReverse String Tan Time
syn keyword aspVBFunction contained TimeSerial TimeValue Trim TypeName UBound UCase
syn keyword aspVBFunction contained VarType Weekday WeekdayName Year 

" VBScript Methods
syn keyword aspVBMethods contained Add AddFolders BuildPath Clear Close Copy
syn keyword aspVBMethods contained CopyFile CopyFolder CreateFolder CreateTextFile
syn keyword aspVBMethods contained Delete DeleteFile DeleteFolder DriveExists
syn keyword aspVBMethods contained Exists FileExists FolderExists
syn keyword aspVBMethods contained GetAbsolutePathName GetBaseName GetDrive
syn keyword aspVBMethods contained GetDriveName GetExtensionName GetFile
syn keyword aspVBMethods contained GetFileName GetFolder GetParentFolderName
syn keyword aspVBMethods contained GetSpecialFolder GetTempName Items Keys Move
syn keyword aspVBMethods contained MoveFile MoveFolder OpenAsTextStream
syn keyword aspVBMethods contained OpenTextFile Raise Read ReadAll ReadLine Remove
syn keyword aspVBMethods contained RemoveAll Skip SkipLine Write WriteBlankLines
syn keyword aspVBMethods contained WriteLine

" VBScript Number Contstants
" Integer number, or floating point number without a dot.
syn match  aspVBNumber	contained 	"\<\d\+\>"
" Floating point number, with dot
syn match  aspVBNumber	contained 	"\<\d\+\.\d*\>"
" Floating point number, starting with a dot
syn match  aspVBNumber	contained 	"\.\d\+\>"

" String and Character Contstants
" removed (skip=+\\\\\|\\"+) because VB doesn't have backslash escaping in
" strings (or does it?)
syn region  aspVBString	contained 	  start=+"+  end=+"+ keepend

" VBScript Comments
syn region  aspVBComment	contained start="^REM\s\|\sREM\s" end="$" contains=aspVBTodo keepend
syn region  aspVBComment   contained start="^'\|\s'"   end="$" contains=aspVBTodo keepend
" misc. Commenting Stuff
syn keyword aspVBTodo contained	TODO FIXME

" Cosmetic syntax errors commanly found in VB but not in VBScript
" VBScript doesn't use line numbers
syn region  aspVBError	contained start="^\d" end="\s" keepend
" VBScript also doesn't have type defining variables
syn match   aspVBError  contained "[a-zA-Z0-9_][\$&!#]"ms=s+1
" Since 'a%' is a VB variable with a type and in VBScript you can have 'a%>'
" I have to make a special case so 'a%>' won't show as an error.
syn match   aspVBError  contained "[a-zA-Z0-9_]%\($\|[^>]\)"ms=s+1

" Top Cluster
syn cluster aspVBScriptTop contains=aspVBStatement,aspVBFunction,aspVBMethods,aspVBNumber,aspVBString,aspVBComment,aspVBError

" Define VBScript delimeters
syn region  aspVBScriptInsideHtmlTags keepend matchgroup=Delimiter start=+<%+ skip=+".*%>.*"+ end=+%>+ contains=@aspVBScriptTop
syn region  aspVBScriptInsideHtmlTags keepend matchgroup=Delimiter start=+<script language="\=vbscript"\=.*>+ end=+</script>+ contains=@aspVBScriptTop

" Synchronization
syn sync match aspSyncGroup grouphere aspVBScriptInsideHtmlTags "<%"
" This is a kludge so the HTML will sync properly
syn sync match htmlHighlight groupthere htmlTag "%>"

if !exists("did_asp_syntax_inits")
  let did_asp_syntax_inits = 1
  " The default methods for highlighting.  Can be overridden later
  hi link aspVBScript		Special
  hi link aspVBLineNumber	Comment
  hi link aspVBNumber		Number
  hi link aspVBError		Error
  hi link aspVBStatement	Statement
  hi link aspVBString		String
  hi link aspVBComment		Comment
  hi link aspVBTodo		Todo
  hi link aspVBFunction		Identifier
  hi link aspVBMethods		PreProc
  hi link aspVBEvents		Special
  hi link aspVBTypeSpecifier	Type
endif

let b:current_syntax = "asp"

if main_syntax == 'asp'
  unlet main_syntax
endif

" vim: ts=8:sw=2:sts=0:noet
