" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Ron Aaron <ron@ronware.org>
" Last Change:	2003 May 02

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "elflord_better"
hi Normal	    term=NONE       ctermfg=White       guifg=Cyan			guibg=black
hi Comment	    term=bold       ctermfg=DarkCyan	guifg=#80a0ff
hi Constant	    term=underline  ctermfg=Magenta		guifg=Magenta
hi Special      term=bold       ctermfg=LightCyan   guifg=LightCyan
hi Identifier   cterm=NONE term=underline  ctermfg=Cyan        guifg=#40ffff
hi Statement    term=bold       ctermfg=Yellow      guifg=#aa4444   gui=bold
hi PreProc	    cterm=bold      ctermfg=LightBlue	guifg=#ff80ff
hi Type	        term=underline  ctermfg=LightGreen	guifg=#60ff60   gui=bold
hi Function	    term=bold       ctermfg=Blue        guifg=Blue
hi Operator	    term=NONE		ctermfg=Red         guifg=Red
hi Ignore       term=NONE       ctermfg=Brown       guifg=bg
hi Error	    term=reverse    ctermfg=White       ctermbg=Red     guifg=White guibg=Red
hi Todo	        term=standout   ctermfg=Black       ctermbg=Yellow  guifg=Blue  guibg=Yellow
hi ControlBlk   term=bold       ctermfg=LightBlue   guifg=LightBlue

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi link String          Constant
hi link Character       Constant
hi link Number          Constant
hi link Boolean         Constant
hi link Float           Number
hi link Conditional     ControlBlk
hi link Repeat          ControlBlk
hi link Label           Statement
hi link Keyword         Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar	    Special
hi link Delimiter       Special
hi link SpecialComment  Special
hi link Debug           Special
