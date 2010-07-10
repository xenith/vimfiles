syntax reset

"if has("gui_kde")
"    set guifont=Fixed\ [Misc]/10/-1/5/50/0/0/0/1/0
"elseif has("gui_gtk")
"    set guifont=-misc-fixed-medium-r-normal-*-*-100-*-*-c-*-iso10646-1
"endif 

"highlight normal font='fixed' guifg=white guibg=black
"highlight normal font='lfp-nexus/8/-1/5/80/0/0/0/1/0' guifg=white guibg=black
highlight normal font='Fixed Semi-Condensed 10' ctermfg=black guifg=black guibg=#aeb2c3
"highlight normal font='Nexus 8' guifg=white guibg=black
"highlight normal font='Bitstream Vera Sans Mono 7' guifg=white guibg=black

highlight search ctermfg=black ctermbg=yellow guifg=black guibg=yellow

highlight Special term=NONE cterm=NONE gui=NONE ctermfg=darkgreen guifg=#008000
highlight Folded cterm=bold ctermbg=blue ctermfg=white gui=bold guifg=white guibg=blue
highlight StatusLine term=bold,reverse cterm=bold gui=bold ctermfg=white ctermbg=darkred guifg=#FFFFFF guibg=#800000
highlight StatusLineNC term=reverse cterm=bold gui=NONE ctermfg=grey ctermbg=darkred guifg=#FFFFFF guibg=#800000
highlight VertSplit term=reverse cterm=NONE gui=NONE ctermfg=white ctermbg=darkred guifg=#FFFFFF guibg=#800000

highlight comment term=bold term=reverse cterm=bold gui=NONE ctermbg=grey ctermfg=black guibg=#C0C0C0 guifg=#000000
highlight statement term=bold cterm=bold gui=bold ctermfg=darkcyan guifg=#008080
highlight preproc term=bold cterm=bold gui=bold ctermfg=blue guifg=#0000FF
highlight constant term=NONE cterm=NONE gui=NONE ctermfg=darkmagenta guifg=#800080
highlight link number constant
highlight type term=bold cterm=bold gui=bold ctermfg=brown guifg=#808000
highlight identifier term=NONE cterm=NONE gui=NONE ctermfg=darkmagenta guifg=#800080

hi link SpecialKey Special
hi link Directory Special
hi link function preproc
highlight link zshShellVariables identifier
highlight link texZone constant
highlight link texMath constant
