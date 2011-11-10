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

" FIXME highlight start and end delimiters as xml
syn include @mxmlAS syntax/actionscript.vim
syn region mxmlScript		matchgroup=xmlTag start=+<fx:Script>+ matchgroup=xmlEndTag end=+</fx:Script>+ contains=@mxmlAS

syn region mxmlMetadata		matchgroup=xmlTag start=+<fx:Metadata>+ matchgroup=xmlEndTag end=+</fx:Metadata>+ contains=@mxmlAS,@xmlTagHook 

syn include @mxmlCSS syntax/css.vim
syn region mxmlStyle		matchgroup=xmlTag start="<fx:Style>" matchgroup=xmlEndTag end="</fx:Style>" contains=@mxmlCSS


let b:current_syntax = "mxml"
