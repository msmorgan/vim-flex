" Vim syntax file
" Language:	MXML (2009)
" Maintainer:	Michael Morgan <morgan.michael@me.com>
" URL:		https://github.com/msmorgan/vim-flex FIXME
" Last Change:	November 10, 2011
" Filenames:	*.mxml

" CHANGE LOG:
" Quit when a syntax file was already loaded

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'mxml'
endif

if version < 600
  so syntax/xml.vim
else
  runtime! syntax/xml.vim
  unlet b:current_syntax
endif

syn include @actionScript syntax/actionscript.vim
syn include @css syntax/css.vim

syn region mxmlScript
	\ start=+<fx:Script[^!?/<>]*>+
	\ keepend
	\ end=+</fx:Script>+me=s-1
	\ contains=@actionScript,mxmlSpecialTag,mxmlActionScriptCdata

syn region mxmlMetadata
	\ start=+<fx:Metadata[^>]*>+
	\ keepend
	\ end=+</fx:Metadata>+me=s-1
	\ contains=@actionScript,mxmlSpecialTag,mxmlActionScriptCdata

syn region mxmlStyle
	\ start=+<fx:Style[^>]*>+
	\ keepend
	\ end=+</fx:Style>+me=s-1
	\ contains=@css,mxmlSpecialTag,mxmlCssCdata

syn region mxmlSpecialTag
	\ start=+<fx:\(Script\|Metadata\|Style\)+
	\ end=+>+
	\ contained
	\ contains=xmlTagName,xmlAttrib,xmlEqual,xmlString
hi def link mxmlSpecialTag xmlTag


" FIXME this works because of a hack
syn region mxmlActionScriptCdata
	\ start=+<!\[CDATA\[+
	\ matchgroup=xmlCdataEnd
	\ end=+]]>+
	\ contains=@actionScript,xmlCdataStart,@xmlCdataHook
	\ keepend
	\ extend

syn region mxmlCssCdata
	\ start=+<!\[CDATA\[+
	\ matchgroup=xmlCdataEnd
	\ end=+]]>+
	\ contains=@css,xmlCdataStart
	\ keepend
	\ extend


let b:current_syntax = "mxml"
