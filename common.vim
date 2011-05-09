" vimrc - Justin Rocha <xenith@xenith.org>
" With help from Josh Berry

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ****************
" Personal Options

set number                      " Show line numbers in the sidebar
set autoindent                  " Always set autoindenting on
set smartindent                 " Indent smartly (following C style)
set expandtab                   " Replace all TABs with spaces
set smarttab
set smartcase
set tabstop=4                   " TAB == 4 spaces
set softtabstop=4               " TAB == 4 spaces
set shiftwidth=4                " TAB == 4 spaces
set shiftround                  " TAB == 4 spaces
set textwidth=100               " Max 100 columns
set magic                       "Set magic on, for regular expressions
set foldmethod=indent           " Foldlevel follows indentation
set foldlevel=1000              " Big number so it doesn't autofold
"set foldcolumn=2                " Show the column on the left side to show folds
set autoread                    " Watch for outside changes
set autowrite                   " Automatically save on various commands
set nobackup                    " Never keep a backup file
set nowrap                      " Don't wrap lines
set linebreak                   " Wraps lines at convenient points
set ruler                       " Show the cursor position all the time
set history=500                 " Keep 500 lines of command line history
set showcmd                     " Show current uncompleted command
set showmatch                   " Show matching braces
set showmode                    " Tell us which mode we are in
set showfulltag                 " Show complete tag completions (function + arguments)
set showbreak=+                 " Used to mark wrapped lines
set incsearch                   " Jump to found items while searching
set hlsearch                    " Highlight search items, toggle with <F7>
set ignorecase                  " Ignore case when searching
set modelines=10                " I have no idea
set display=uhex                " Show unprintable charcters as hex
set background=dark             " So I don't get that ugly grey bar on the side
set backspace=indent,eol,start  " Allow backspacing over everything
set laststatus=2                " Always show a statusline
set term=xterm-color            " Makes mouse work in Eterm
set mouse=a                     " Makes mouse work in terminal
set ttymouse=xterm2             " Makes mouse work in terminal
set ttyfast                     " Fast terminal (local!), updates faster
set report=0                    " Report all changed lines
set ffs=unix,dos,mac            " Default file types
set wildmenu                    " Show a list of matches when using tab completion
set hidden
set list
set listchars=tab:▷⋅,trail:_,nbsp:⋅

" Remaps
set pastetoggle=<F4>           " Toggle paste mode
" Hit F2 to toggle line numbers and foldcolumn
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
nnoremap <silent> <F3> :TlistToggle<CR>

" Configuration options for minibufexpl.vim
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Options for the GUI
"set guioptions-=T               " No toolbar
"set guioptions-=m               " No menubar
set guioptions-=r               " No scrollbar
set guioptions-=R               " Really no scrollbar
set guioptions-=l               " No scrollbar
set guioptions-=L               " Really no scrollbar
set guioptions-=b               " No bottom scrollbar
set guioptions+=aA              " Selection options, so we can copy/paste

" unknown options
set wildmode=full
set grepprg=grep\ -nH\
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.*/

" Mark syntax errors with :signs
let g:syntastic_enable_signs=1

" TagList options
"let Tlist_Auto_Open = 1
let Tlist_Process_File_Always = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sz zg
map <leader>s? z=

" ****
" MAPS

" FuzzyFinder TextMate is disabled. It doesn't work with current versions of fuzzyfinder and its
" over 3 years old.
"map <leader>t :FuzzyFinderTextMate<CR>

" toggle search highlighting in both normal and insert modes
map <F7> :set hlsearch!<CR>
imap <F7> <ESC>:set hlsearch!<CR>a

" Forgot to release the SHIFT key
nmap :W :w
nmap :Q :q
nmap :WQ :wq
nmap :Wq :wq
nmap :wQ :wq

" Backspace works in normal mode
nmap <BS> hx

" Don't use Ex mode, use Q for formatting
map Q gq

" Quicker dictionary lookup and filecompletion
imap <C-G> <C-X><C-K>
imap <C-F> <C-X><C-F>

" Fix weird error that just occured :/
imap  <BS>

" Rot13
vmap rot g?

" C type language specific maps
function! C_maps()
    map!    'if     if () {o}keei
    map!    'for    for () {o}keei
    map!    'while  while () {o}keei
    map!    'inc    #include <.h>hhi
    map!    'def    #define a
    map!    'main   int main(int argc, char **argv)o{o}ki
endfu


" ************
" AUTOCOMMANDS

if has("autocmd")
    " Enable file type detection.
    filetype plugin indent on

    " When vimrc is edited, reload it
    autocmd! bufwritepost vimrc source ~/.vim/vimrc
    autocmd! bufwritepost common.vim source ~/.vim/common.vim

    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent
    " indenting.
    au BufNewFile,Bufread *.edc     setf edc
    au BufNewFile,Bufread * exec 'match Todo /\%80v/'

    au FileType mail
        \   set expandtab
        \ | set textwidth=72

    au Filetype c
        \   set tabstop=4 softtabstop=4 shiftwidth=4
        \ | call C_maps()
        \ | set textwidth=100

    au FileType php
        \   set tabstop=3 softtabstop=3 shiftwidth=3
        \ | set keywordprg="help"
        \ | call C_maps()
        \ | set textwidth=100

    au FileType html,css
        \   set tabstop=3 softtabstop=3 shiftwidth=3
        \ | set noexpandtab

    au FileType xml,xslt
        \   set tabstop=2 softtabstop=2 shiftwidth=2
        \ | set noexpandtab

    au FileType rhtml,rhtm
        \   set syntax=eruby tabstop=2 softtabstop=2 shiftwidth=2
        \ | set noexpandtab

    autocmd FileType make     set noexpandtab tabstop=4

    " The following commands automatically add the shebang
    au BufNewFile *.sh
        \   s,^,#!/bin/bash,
        \ | w
        \ | r !chmod +x % > /dev/null

    " Restore position in file if previously edited (uses viminfo)
    au BufReadPost  *
        \   if line("'\"") > 0 && line("'\"") <= line("$")
        \ | exe "normal g'\""
        \ | endif
endif " has("autocmd")

" **********
" Language Specific Sections
"
" Python
au BufNewFile *.py
    \   s,^,#!/usr/bin/python,
    \ | w
    \ | r !chmod +x % > /dev/null

autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
autocmd FileType python set omnifunc=pythoncomplete#Complete
let python_highlight_all = 1
au FileType python
    \   set tabstop=4 softtabstop=4 shiftwidth=4
    \ | set nocindent
    \ | syn keyword pythonDecorator True None False self
    \ | inoremap <buffer> $r return
    \ | inoremap <buffer> $i import
    \ | inoremap <buffer> $p print
    \ | inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
    \ | map <buffer> <leader>1 /class
    \ | map <buffer> <leader>2 /def
    \ | map <buffer> <leader>C ?class
    \ | map <buffer> <leader>D ?def

" Ruby
au BufNewFile *.rb
    \   s,^,#!/usr/bin/ruby -KU,
    \ | w
    \ | r !chmod +x % > /dev/null

au FileType ruby
    \   set tabstop=2 softtabstop=2 shiftwidth=2
    \ | set textwidth=100

" Perl
au BufNewFile *.pl
    \   s,^,#!/usr/bin/perl,
    \ | w
    \ | r !chmod +x % > /dev/null

au FileType perl
    \   set tabstop=3 softtabstop=3 shiftwidth=3
    \ | set keywordprg=perldoc\ -f
    \ | call C_maps()
    \ | set textwidth=100

" Javascript
au FileType javascript
    \   call JavaScriptFold()
    \ | setl fen
    \ | setl nocindent
    \ | imap <c-t> AJS.log();<esc>hi
    \ | imap <c-a> alert();<esc>hi
    \ | inoremap <buffer> $r return
    \ | inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

" **********
" STATUSLINE
"
" Formats that nifty status bar at the bottom. Or puts the ruler if we don't
" have that capability.
if has("statusline")
    " Format the statusline
    " set statusline=%-30.30(%F%m%r%)\ Type:\ %Y\ Buf:\ %n%=%l,%c%V\ %P

    " Show the help file flag
    set statusline+=%h
    " Show the filename with path, with read-only and modified flags
    set statusline=%-30.30(%F%m%r%)
    " Display a warning if the file isn't in unix format (LF)
    set statusline+=%#warningmsg#
    set statusline+=%{&ff!='unix'?'['.&ff.']':''}
    set statusline+=%*
    " Display a warning if the file isn't UTF8
    set statusline+=%#warningmsg#
    set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
    set statusline+=%*
    " Show the file type
    set statusline+=Type:\ %Y\ |
    " Show the buffer number
    set statusline+=Buf:\ %n
    " Display a warning for mixed indentation
    set statusline+=%#error#
    set statusline+=%{StatuslineTabWarning()}
    set statusline+=%*
    " Display a warning for trailing whitespace
    set statusline+=%#warningmsg#
    set statusline+=%{StatuslineTrailingSpaceWarning()}
    set statusline+=%*
    "display a warning if &paste is set
    set statusline+=%#error#
    set statusline+=%{&paste?'[paste]':''}
    set statusline+=%*
    " Show the line number, column number, percentage through file
    set statusline+=%=%l/%L,%c%V\ %P

    "recalculate the trailing whitespace warning when idle, and after saving
    autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

    "return '[\s]' if trailing white space is detected
    "return '' otherwise
    function! StatuslineTrailingSpaceWarning()
        if !exists("b:statusline_trailing_space_warning")

            if !&modifiable
                let b:statusline_trailing_space_warning = ''
                return b:statusline_trailing_space_warning
            endif

            if search('\s\+$', 'nw') != 0
                let b:statusline_trailing_space_warning = '[\s]'
            else
                let b:statusline_trailing_space_warning = ''
            endif
        endif
        return b:statusline_trailing_space_warning
    endfunction

    "return the syntax highlight group under the cursor ''
    function! StatuslineCurrentHighlight()
        let name = synIDattr(synID(line('.'),col('.'),1),'name')
        if name == ''
            return ''
        else
            return '[' . name . ']'
        endif
    endfunction

    "recalculate the tab warning flag when idle and after writing
    autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

    "return '[&et]' if &et is set wrong
    "return '[mixed-indenting]' if spaces and tabs are used to indent
    "return an empty string if everything is fine
    function! StatuslineTabWarning()
        if !exists("b:statusline_tab_warning")
            let b:statusline_tab_warning = ''

            if !&modifiable
                return b:statusline_tab_warning
            endif

            let tabs = search('^\t', 'nw') != 0

            "find spaces that arent used as alignment in the first indent column
            let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

            if tabs && spaces
                let b:statusline_tab_warning =  '[mixed-indenting]'
            elseif (spaces && !&et) || (tabs && &et)
                let b:statusline_tab_warning = '[&et]'
            endif
        endif
        return b:statusline_tab_warning
    endfunction
else
    set ruler
endif


" *********
" TERMINALS

if $COLORTERM == "Eterm"
    " Blah blah
endif


" ******
" SYNTAX

if has("syntax")
    " ************************************
    " LANGUAGE SPECIFIC HIGHLIGHT SETTINGS

    " * C *
    " Highlighting strings inside comments
    let c_comment_strings=1
    " Bad spaces. Bad.
    "let c_space_errors=1

    " * PHP *
    " syntax highlighting of sql queries (might be annoying)
    let php3_sql_query=1
    let phtml_sql_query=1
    let php3_minlines = 600
    let php_sql_query=1
    let php_minlines = 600
    let php_htmlInStrings = 1
    let php_baselib = 1

    " * Python *
    let python_highlight_all = 1

    " * SHELL *
    let bash_is_sh=1

    " ***********
    " START'ER UP

    syntax on

    set hlsearch
    set incsearch
endif


if has("viminfo")
    " remember informations from previous Vim sessions
    " '20 -> marks for last 20 files are saved
    " no `f<value>' -> all marks are saved
    " "50 -> max lines for each register
    " no `:' -> 'history' items of cmd-line are saved
    " no `/' -> 'history' items of search-pattern-history are saved
    " `h' -> disable effect of 'hlsearch'
    " no `@' -> 'history' items of input-line history are saved
    " `%' -> buffer list is saved and restored if Vim is called w/o args

    set viminfo='50,\"200,h,%
endif
