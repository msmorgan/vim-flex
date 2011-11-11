" Vim syntax file
" Language:	ActionScript
" Maintainer:	Michael Morgan <michael.morgan@mind-over-data.com>
" URL:		https://github.com/msmorgan/vim-actionscript FIXME
" Last Change:	2011 Nov 09
" Based On:	JavaScript syntax by Claudio Feiner <claudio@feiner.com>

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
" tuning parameters:
" unlet actionScript_fold

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'actionscript'
endif

" Drop fold if it set but vim doesn't support it.
if version < 600 && exists("actionScript_fold")
  unlet actionScript_fold
endif


syn keyword actionScriptCommentTodo	TODO FIXME XXX TBD contained
syn match   actionScriptLineComment	"//.*" contains=@Spell,actionScriptCommentTodo
syn match   actionScriptCommentSkip	"^[ \t]*\*\($\|[ \t]\+\)"
syn region  actionScriptComment		start="/\*"  end="\*/" contains=@Spell,actionScriptCommentTodo
syn match   actionScriptSpecial		"\\\d\d\d\|\\."
syn region  actionScriptStringD		start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	contains=actionScriptSpecial,@htmlPreproc
syn region  actionScriptStringS		start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	contains=actionScriptSpecial,@htmlPreproc
syn match   actionScriptSpecialChar	"'\\.'"

syn include @XML syntax/xml.vim
syn match   actionScriptE4X		"<\([^ /!?<>"']\+\).*/>" contains=@XML
syn region  actionScriptE4X		start="<\z([^ /!?<>"']\+\).\{-}/\@<!\(>\)" keepend end="</\z1>" contains=@XML

syn match   actionScriptNumber		"\<\(\d\+\|0[xX][0-9a-fA-F]\+\)[lL]\=\>"
syn match   actionScriptNumber		"\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
syn match   actionScriptNumber		"\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
syn match   actionScriptNumber		"\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"
syn keyword actionScriptNumber		Infinity NaN
syn region  actionScriptRegExpString	start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gi]\{0,2\}\s*$+ end=+/[gi]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline

syn keyword actionScriptConditional	if else switch
syn keyword actionScriptRepeat		while for each do in label
"syn match   actionScriptRepeat		"for each"
syn keyword actionScriptBranch		break continue
syn keyword actionScriptOperator	new delete instanceof typeof
syn keyword actionScriptType		Array Boolean Class Date Function int Math Namespace Number Object QName String RegExp uint Vector void XML XMLList
syn keyword actionScriptStatement	return with
syn keyword actionScriptBoolean		true false
syn keyword actionScriptNull		null undefined
syn keyword actionScriptIdentifier	this var super
syn keyword actionScriptLabel		case
syn match   actionScriptLabel		"default\(\s\+xml\s\+namespace\)\@!"
syn keyword actionScriptException	try catch finally throw
"syn keyword actionScriptMessage	trace
syn keyword actionScriptBuiltin		decodeURI decodeURIComponent encodeURI encodeURIComponent escape isFinite isNaN isXMLName parseFloat parseInt trace unescape
syn keyword actionScriptClassDecl	class extends implements interface
syn keyword actionScriptExternal	package native namespace import include
syn match   actionScriptExternal	"\(use\|default\s\+xml\)\s\+namespace"
syn keyword actionScriptGlobal		_global _level _root
"syn keyword actionScriptMember
"syn keyword actionScriptDeprecated
syn keyword actionScriptMethodDecl	override get set
syn keyword actionScriptScopeDecl	internal public protected private abstract
syn keyword actionScriptStorageClass	const dynamic final static
syn keyword actionScriptReserved	boolean byte char debugger double enum export float goto let long short synchronized throws transient volatile 

if exists("actionScript_fold")
    syn match	actionScriptFunction	"\<function\>"
    syn region	actionScriptFunctionFold	start="\<function\>.*[^};]$" end="^\z1}.*$" transparent fold keepend

    syn sync match actionScriptSync	grouphere actionScriptFunctionFold "\<function\>"
    syn sync match actionScriptSync	grouphere NONE "^}"

    setlocal foldmethod=syntax
    setlocal foldtext=getline(v:foldstart)
else
    syn keyword actionScriptFunction	function
    syn match	actionScriptBraces	   "[{}\[\]]"
    syn match	actionScriptParens	   "[()]"
endif

syn sync fromstart
syn sync maxlines=100

if main_syntax == "actionscript"
  syn sync ccomment actionScriptComment
endif

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_actionscript_syn_inits")
  if version < 508
    let did_actionscript_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink actionScriptComment		Comment
  HiLink actionScriptLineComment	Comment
  HiLink actionScriptCommentTodo	Todo
  HiLink actionScriptSpecial		Special
  HiLink actionScriptStringS		String
  HiLink actionScriptStringD		String
  HiLink actionScriptChar		Character
  HiLink actionScriptSpecialChar	actionScriptSpecial
  HiLink actionScriptNumber		Number
  HiLink actionScriptConditional	Conditional
  HiLink actionScriptRepeat		Repeat
  HiLink actionScriptBranch		Conditional
  HiLink actionScriptOperator		Operator
  HiLink actionScriptType		Type
  HiLink actionScriptStatement		Statement
  HiLink actionScriptFunction		Function
  "HiLink actionScriptBraces		Function
  HiLink actionScriptError		Error
  HiLink actionScrParenError		actionScriptError
  HiLink actionScriptNull		Keyword
  HiLink actionScriptBoolean		Boolean
  HiLink actionScriptRegExpString	String

  HiLink actionScriptIdentifier		Identifier
  HiLink actionScriptExternal		Include
  HiLink actionScriptLabel		Label
  HiLink actionScriptException		Exception
  HiLink actionScriptBuiltin		Keyword
  HiLink actionScriptGlobal		Keyword
  "HiLink actionScriptMember		Keyword
  "HiLink actionScriptDeprecated	Exception
  HiLink actionScriptReserved		Keyword
  HiLink actionScriptDebug		Debug
  HiLink actionScriptConstant		Label
  HiLink actionScriptStorageClass	StorageClass
  HiLink actionScriptClassDecl		StorageClass
  HiLink actionScriptMethodDecl		StorageClass
  HiLink actionScriptScopeDecl		StorageClass

  delcommand HiLink
endif

let b:current_syntax = "actionscript"
if main_syntax == 'actionscript'
  unlet main_syntax
endif

" vim: ts=8
