" Vim syntax file
" Language:	gpl
" Maintainer:	Tim Chaplin
" Last Change:	2006 Feb 6

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" gpl extentions
syn keyword gplConditional	if else 
syn keyword gplRepeat		for
syn keyword gplKeyword		print space on
syn keyword gplType		int double string logical circle rectangle triangle textbox pixmap
syn keyword gplResVariable	window_x window_y window_width window_height window_title window_red window_green window_blue animation_speed
syn keyword gplFunction		initialization animation leftarrow rightarrow uparrow downarrow f1 akey skey dkey fkey hkeyjkey kkey lkey
syn keyword gplDefine		forward
syn keyword gplBoolean		true false

syn region gplComment start="//" end="$" keepend contains=Comment

" Default highlighting
if version >= 508 || !exists("did_gpl_syntax_inits")
  if version < 508
    let did_gpl_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink gplComment		Comment
  HiLink gplConditional		Conditional
  HiLink gplRepeat		Repeat
  HiLink gplKeyword		Keyword
  HiLink gplType		Type
  HiLink gplFunction		Function
  HiLink gplResVariable		Constant
  HiLink gplDefine		Define
  HiLink gplBoolean		Boolean
  delcommand HiLink
endif

let b:current_syntax = "gpl"

" vim: ts=8
