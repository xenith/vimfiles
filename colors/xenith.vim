syntax reset

let colors_name = 'xenith'

" Vim >= 7.0 specific colors
if version >= 700
    hi CursorLine   guibg=#2d2d2d
    hi CursorColumn guibg=#2d2d2d
    hi MatchParen   guifg=#f6f3e8 guibg=#857b6f gui=bold
    hi Pmenu        guifg=#f6f3e8 guibg=#444444
    hi PmenuSel     guifg=#000000 guibg=#cae682
endif

highlight normal ctermfg=grey guifg=white guibg=black

highlight search ctermbg=3 ctermfg=0 guifg=black guibg=yellow

highlight Special term=NONE cterm=NONE gui=NONE ctermfg=green guifg=#00FF00
highlight Folded cterm=bold ctermbg=blue ctermfg=white gui=bold guifg=white guibg=blue
highlight StatusLine term=bold,reverse cterm=bold gui=bold ctermfg=white ctermbg=blue guifg=#FFFFFF guibg=#FF0000
highlight StatusLineNC term=reverse cterm=NONE gui=NONE ctermfg=grey ctermbg=red guifg=#FFFFFF guibg=#FF0000
highlight VertSplit term=reverse cterm=NONE gui=NONE ctermfg=white ctermbg=red guifg=#FFFFFF guibg=#FF0000

highlight comment term=bold term=reverse cterm=bold gui=NONE ctermfg=white guibg=#404040 guifg=#C0C0C0
highlight statement term=bold cterm=bold gui=bold ctermfg=yellow guifg=#00FFFF
highlight preproc term=bold cterm=bold gui=bold ctermfg=cyan guifg=#8080FF
highlight constant term=NONE cterm=NONE gui=NONE ctermfg=red guifg=#FF00FF
highlight link number constant
highlight type term=bold cterm=bold gui=bold ctermfg=yellow guifg=#C0C000
highlight identifier term=NONE cterm=NONE gui=NONE ctermfg=cyan guifg=#FF00FF

hi link function preproc
highlight link zshShellVariables identifier
highlight link texZone constant
highlight link texMath constant
