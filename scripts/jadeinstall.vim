" Vim script file
" Language:	DocBook
" Maintainer:	Devin Weaver <vim@tritarget.com>
" Last Change:	Dec 22, 2000
" Location:	http://tritarget.com/pub/vim/scripts/jadeinstall.vim
" Version:	$Revision$

" This Script installs jade.vim. A menu driven script which builds output from
" DocBook documentation using OpenJade and tex. This is a one time run script
" you only need to run this script once. it will install the necessary files.
let jade_vim_version = "1.3"

if has("win32")
    let tex_progname_arg = "--undump" " MikTeX uses --undump=NAME
    let jade_shell_redir=">"
elseif has("unix")
    let tex_progname_arg = "-progname" " teTeX uses -progname=NAME
    let jade_shell_redir=">"
else
    let x = confirm ("This script uses either dos slashes or unix slashes.\nOther OS's are not supported yet.", "&Quit", 1, "Error")
    qa
endif

if confirm ("This script destroys any old copies of jade.vim, dbrelease.html, and custom.dsl.\nAre you sure you wish to continue?", "&Continue\n&Quit", 2, "Warning") != 1
	qa
endif

if confirm ("Do you wish to have XML support?", "&Yes\n&No", 1, "Question") == 1
    let xml_path = ""
    while ! filereadable (xml_path)
	let xml_path = input ("Where is your OpenJade install directory?\nIt should have 'pubtext/xml.dcl' in it.\nFor ex. /usr/local/sgml or C:\\OpenJade-1.3\n? ")
	if has("win32")
	    let xml_path = xml_path . "\\pubtext\\xml.dcl"
	elseif has("unix")
	    let xml_path = xml_path . "/pubtext/xml.dcl"
	endif
    endwhile
    let xml_path = '"' . xml_path . '"'
endif

edit $VIM/jade.vim
% delete
$ append
" jade.vim: A menu system for parsing and rendering DocBook documents using
"           OpenJade.
"   Author: Devin Weaver
"    Enail: ktohg@tritarget.com
"      Web: http://tritarget.com/vim
"  Version: 
.
execute "normal! GA" . jade_vim_version . "\<Esc>"
$ append

" Options:
"     jade_xml_dcl: The location to your pubtext/xml.dcl file from the OpenJade
"                   install. Setting this option to "" disables XML. Having it
"                   set will enable XML.

let jade_xml_dcl=""
.

let @" = "amenu 35.300 &DocBk.&Validate       :w<Bar>execute '! onsgmls -s '. jade_xml_dcl .' \"%\"'<Cr>" | $ put
let @" = "amenu 35.310 &DocBk.Build\\ R&elease :w<Bar>call BuildRelease()<Cr>" | $ put
let @" = "amenu 35.315 &DocBk.-SEP1-          :" | $ put
let @" = "amenu 35.320 &DocBk.Build\\ &HTML    :w<Bar>call BuildHTML()<Cr>" | $ put
let @" = "amenu 35.330 &DocBk.&Single\\ HTML   :w<Bar>execute '! openjade -t sgml -d \"' . $VIM . '[d]custom.dsl\\#onehtml\" '. jade_xml_dcl .' \"%\" " . jade_shell_redir . " %:t:r.html'<Cr>" | $ put
let @" = "amenu 35.340 &DocBk.Build\\ &Text    :w<Bar>execute '! openjade -t sgml -d \"' . $VIM . '[d]custom.dsl\\#lynx\" '. jade_xml_dcl .' \"%\" " . jade_shell_redir . " %:t:r.html'<Bar>execute '! lynx -dump -force_html -nolist %:t:r.html " . jade_shell_redir . " %:t:r.txt'<Cr>call delete (expand (\"%:t:r\") . \".html\")<Cr>" | $ put
let @" = "amenu 35.350 &DocBk.Build\\ &RTF     :w<Bar>execute '! openjade -t rtf -d \"' . $VIM . '[d]custom.dsl\\#printrtf\" '. jade_xml_dcl .' \"%\"'<Cr>" | $ put
let @" = "amenu 35.355 &DocBk.-SEP2-          :" | $ put
let @" = "amenu 35.360 &DocBk.Build\\ &PDF     :w<Bar>execute '! openjade -t tex -d \"' . $VIM . '[d]custom.dsl\\#print\" '. jade_xml_dcl .' \"%\"'<Bar>execute '! pdftex " . tex_progname_arg . "=pdfjadetex %:t:r.tex'<Cr>" | $ put
let @" = "amenu 35.370 &DocBk.Build\\ &PS      :w<Bar>execute '! openjade -t tex -d \"' . $VIM . '[d]custom.dsl\\#print\" '. jade_xml_dcl .' \"%\"'<Bar>execute '! tex " . tex_progname_arg . "=jadetex %:t:r.tex'<Bar>execute '! dvips %:t:r.dvi'<Cr>" | $ put
let @" = "amenu 35.380 &DocBk.Build\\ &DVI     :w<Bar>execute '! openjade -t tex -d \"' . $VIM . '[d]custom.dsl\\#print\" '. jade_xml_dcl .' \"%\"'<Bar>execute '! tex " . tex_progname_arg . "=jadetex %:t:r.tex'<Cr>" | $ put
let @" = "amenu 35.390 &DocBk.Build\\ Te&X     :w<Bar>execute '! openjade -t tex -d \"' . $VIM . '[d]custom.dsl\\#print\" '. jade_xml_dcl .' \"%\"'<Cr>" | $ put

if exists ("xml_path")
$ append
amenu 35.395 &DocBk.-SEP3-          :
amenu 35.400 &DocBk.XML\ mode\ O&n  :let jade_xml_dcl='
.
execute "normal! GA" . xml_path . "'<Cr>\<Esc>"
$ append
amenu 35.410 &DocBk.XML\ mode\ O&ff :let jade_xml_dcl=''<Cr>

augroup jade
    au FileType xml emenu DocBk.XML\ mode\ On
    au FileType sgml emenu DocBk.XML\ mode\ Off
augroup END
.
else
$ append
" XML Mode was disabled during the install.
" Menues and Autocommands that used XML mode were removed.
.
endif

$ append

function BuildHTML( )
	if ! isdirectory (expand ("%:t:r"))
		execute '! mkdir %:t:r'
	endif
	cd %:t:r
	execute '! openjade -t sgml -d "' . $VIM . '[d]custom.dsl\#html" '. g:jade_xml_dcl .' "%"'
	cd -
endfunction

function BuildRelease( )
	call BuildHTML()
.
let @" = "\<Tab>execute '! openjade -t sgml -d \"' . $VIM . '[d]custom.dsl\\#lynx\" '. g:jade_xml_dcl .' \"%\" " . jade_shell_redir . " %:t:r.html'" | $ put
let @" = "\<Tab>execute '! lynx -dump -force_html -nolist %:t:r.html " . jade_shell_redir . " %:t:r.txt'" | $ put
let @" = "\<Tab>execute '! openjade -t sgml -d \"' . $VIM . '[d]custom.dsl\\#onehtml\" '. g:jade_xml_dcl .' \"%\" " . jade_shell_redir . " %:t:r.html'" | $ put
let @" = "\<Tab>execute '! openjade -t rtf -d \"' . $VIM . '[d]custom.dsl\\#printrtf\" '. g:jade_xml_dcl .' \"%\"'" | $ put
let @" = "\<Tab>execute '! openjade -t tex -d \"' . $VIM . '[d]custom.dsl\\#print\" '. g:jade_xml_dcl .' \"%\"'" | $ put
let @" = "\<Tab>execute '! pdftex " . tex_progname_arg . "=pdfjadetex %:t:r.tex'" | $ put
let @" = "\<Tab>execute '! tex " . tex_progname_arg . "=jadetex %:t:r.tex'" | $ put
let @" = "\<Tab>execute '! dvips %:t:r.dvi'" | $ put
$ append
	call delete (expand ("%:t:r") . ".aux")
	call delete (expand ("%:t:r") . ".log")
	call delete (expand ("%:t:r") . ".out")
	let bufnu = bufnr ("%")
	new index.html
	if ! filereadable ("index.html")
		read $VIM/dbrelease.html
		0 delete
		let title = input ("What is the title of the DocBook document? ")
		execute '%s/-FILEROOT-/' . expand ("#". bufnu .":t:r") . '/g'
		execute '%s/-FILE-/' . expand ("#". bufnu ."") . '/g'
		execute '%s/-TITLE-/' . title . '/g'
		write
	endif
	echo "Done."
endfunction
.
if has("win32")
    % s/\[d\]/\\/g
elseif has("unix")
    % s/\[d\]/\//g
endif
1 delete
write


edit $VIM/dbrelease.html
% delete
$ append
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
<head>
	<title>-TITLE-</title>
	<meta name="generator" content="Jade VIM script">
	<meta name="script reference" content="http://tritarget.com/vim/">
</head>
<body bgcolor="white">
<h2>-TITLE-</h2>
<hr size="1" noshade>
<p>You can read the book <a href="-FILEROOT-/index.html">online</a> at this site.</p>
<p>You can download <i>-TITLE-</i> in the following forms:</p>
<ul>
	<li><p>As a single <a href="-FILEROOT-.html">HTML file</a>.</p></li>
<!--
	<li><p>As a <a href="-FILEROOT-.zip">ZIP archive</a> of HTML pages. This is the same as the <a href="-FILEROOT-/index.html">online</a> version.</p></li>
-->
	<li><p>As an <a href="-FILEROOT-.pdf">Adobe PDF</a> for viewing with <a href="http://www.adobe.com/products/acrobat/readstep.html">Abobe Acrobat</a>.</p></li>
	<li><p>As a <a href="-FILEROOT-.rtf">RTF file</a> for viewing with Microsoft Word or other RTF viewer.</p></li>
	<li><p>As a <a href="-FILEROOT-.txt">Text file</a>.</p></li>
	<li><p>As a <a href="-FILEROOT-.ps">PostScript file</a>.</p></li>
	<li><p>As a <a href="-FILEROOT-.dvi">DVI file</a>.</p></li>
	<li><p>As <a href="-FILEROOT-.tex">TeX source</a>.</p></li>
	<li><p>The <a href="-FILE-">source document</a>. This is <i>just the text</i>. You cannot format this version.</p></li>
</ul>
</body>
</html>
.
1 delete
write


edit $VIM/custom.dsl
% delete
$ append
<!DOCTYPE style-sheet PUBLIC "-//James Clark//DTD DSSSL Style Sheet//EN" [
<!ENTITY html.dsl PUBLIC "-//Norman Walsh//DOCUMENT DocBook HTML Stylesheet//EN" CDATA dsssl>
<!ENTITY print.dsl PUBLIC "-//Norman Walsh//DOCUMENT DocBook Print Stylesheet//EN" CDATA dsssl>
]>
<style-sheet>


<style-specification id="print" use="docbookprint">
<style-specification-body> 

<!-- Fixes bug in postscript output using callouts
     (prints <10122> instead of (1)) -->
(define %callout-fancy-bug% #f)

</style-specification-body>
</style-specification>


<style-specification id="printrtf" use="docbookprint">
<style-specification-body> 

</style-specification-body>
</style-specification>


<style-specification id="lynx" use="docbookhtml">
<style-specification-body> 

    (define nochunks #t)
    (define %callout-graphics-path% "images/callouts/")
    (define %admon-graphics-path% "images/")
    (define %html-ext% ".html")
    (define %shade-verbatim% #t)
    (define %graphic-default-extension% "gif")
    (define %admon-graphics% #t)
    (define %gentext-nav-tblwidth% "100%")
    (define %html-manifest% #f)
    (define %use-id-as-filename% #f)

</style-specification-body>
</style-specification>


<style-specification id="html" use="docbookhtml">
<style-specification-body> 

    (define %html-ext% ".html")
    (define %callout-graphics-path% "../images/callouts/")
    (define %admon-graphics-path% "../images/")
    (define %shade-verbatim% #t)
    (define %use-id-as-filename% #t)
    (define %graphic-default-extension% "gif")
    (define %admon-graphics% #t)
    (define %gentext-nav-tblwidth% "100%")

</style-specification-body>
</style-specification>


<style-specification id="onehtml" use="html">
<style-specification-body>

    (define nochunks #t)
    (define %callout-graphics-path% "images/callouts/")
    (define %admon-graphics-path% "images/")
    (define %html-ext% ".html")
    (define %shade-verbatim% #t)
    (define %graphic-default-extension% "gif")
    (define %admon-graphics% #t)
    (define %gentext-nav-tblwidth% "100%")
    (define %use-id-as-filename% #t)

</style-specification-body>
</style-specification>


<style-specification id="howto" use="html">
<style-specification-body>

    (define %generate-article-toc% #t)

</style-specification-body>
</style-specification>


<external-specification id="docbookhtml" document="html.dsl">
<external-specification id="docbookprint" document="print.dsl">
</style-sheet>
.
1 delete
write


new
execute "normal! \<C-w>w"
close
$ append
"jade.vim" has been installed.
to use the openjade menues first you must source the menu file. place the following
in your vimrc:

source $VIM/jade.vim

This will add a DocBk menu exery time VIM starts.

jade.vim assumes you are using an openjade implmentation and that the
executables are in the PATH. You'll have to edit it to modify this behavior.
jade.vim also uses a custom dsssl found in the VIM directory ($VIM/custom.dsl)
It is used to make openjade render the SGML in the proper format for each
output type. You can edit it to add your own little touches to the rendering if
you feel fit.

.
if exists ("xml_path")
$ append
XML mode can be turned on and off via the two menus. It adds two autocomands
which turn on and off XML mode depending on the proper file type (sgml, xml).

.
endif
1 delete
set readonly
