" vimrc - Justin Rocha <xenith@xenith.org>
" With help from Josh Berry

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ****************
" Personal Options

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

set foldmethod=indent           " Foldlevel follows indentation
set foldlevel=1000              " Big number so it doesn't autofold
"set foldcolumn=2                " Show that funny column on the left side

set autoread                    " Watch for outside changes
set autowrite                   " Automatically save on various commands
set nobackup                    " Never keep a backup file

set ruler                       " Show the cursor position all the time
set history=50                  " Keep 50 lines of command line history
set showcmd                     " Show current uncompleted command
set showmatch                   " Show matching braces
set showmode                    " Tell us which mode we are in
set showfulltag                 " Show complete tag completions (function + arguments)
set showbreak=+                 " Used to mark wrapped lines
set incsearch                   " Jump to found items while searching
set hlsearch                    " Highlight search items, toggle with <F7>
set modelines=10                " I have no idea
set display=uhex                " Show unprintable charcters as hex
set background=dark             " So I don't get that ugly grey bar on the side
set backspace=indent,eol,start  " Allow backspacing over everything
set laststatus=2                " Always show a statusline
set term=xterm-color            " Makes mouse work in Eterm
set ttyfast                     " Fast terminal (local!), updates faster
set report=0                    " Report all changed lines
set list
set listchars=tab:\\_,trail:_

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
set pastetoggle=<F12>
set grepprg=grep\ -nH\ 
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.*/

" ****
" MAPS

" Enable FuzzyFinder
map <leader>t :FuzzyFinderTextMate<CR>

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
	map!	'if	if () {o}keei
	map!	'for	for () {o}keei
	map!	'while	while () {o}keei
	map!	'inc	#include <.h>hhi
	map!	'def	#define a
	map!	'main	int main(int argc, char **argv)o{o}ki
endfu


" ************
" AUTOCOMMANDS

if has("autocmd")
    " Enable file type detection.
    filetype plugin indent on

    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent
    " indenting.
    au BufNewFile,Bufread *.edc     setf edc
    au BufNewFile,Bufread *.di      setf dryice
    au BufNewFile,Bufread * exec 'match Todo /\%80v/'

    au FileType mail
        \   set expandtab
        \ | set textwidth=72

    au Filetype c
        \   set tabstop=4 softtabstop=4 shiftwidth=4
        \ | call C_maps()
        \ | set textwidth=100

    au FileType perl
        \   set tabstop=3 softtabstop=3 shiftwidth=3
        \ | set keywordprg=perldoc\ -f
        \ | call C_maps()
        \ | set textwidth=100

    au FileType php
        \   set tabstop=3 softtabstop=3 shiftwidth=3
        \ | set keywordprg="help"
        \ | call C_maps()
        \ | set textwidth=100

    au FileType ruby
        \   set tabstop=2 softtabstop=2 shiftwidth=2
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

    autocmd FileType python
        \   set tabstop=4 softtabstop=4 shiftwidth=4

    " The following commands automatically add the shebang
    au BufNewFile *.pl
        \   s,^,#!/usr/bin/env perl -w,
        \ | w
        \ | r !chmod +x % > /dev/null

    au BufNewFile *.rb
        \   s,^,#!/usr/bin/env ruby -w -KU,
        \ | w
        \ | r !chmod +x % > /dev/null

    au BufNewFile *.sh
        \   s,^,#!/bin/sh,
        \ | w
        \ | r !chmod +x % > /dev/null

    au BufNewFile *.py
        \   s,^,#!/usr/bin/env python,
        \ | w
        \ | r !chmod +x % > /dev/null

    autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
    let python_highlight_all = 1

    " Restore position in file if previously edited (uses viminfo)
    au BufReadPost	*
        \   if line("'\"") > 0 && line("'\"") <= line("$")
        \ |	exe "normal g'\""
        \ | endif

    au BufRead,BufNewFile *.gpl
        \ set filetype=gpl
endif " has("autocmd")


" **********
" STATUSLINE
"
" Formats that nifty status bar at the bottom. Or puts the ruler if we don't
" have that capability.
if has("statusline")
    " Format the statusline
    set statusline=%-30.30(%F%m%r%)\ Type:\ %Y\ Buf:\ %n%=%l,%c%V\ %P
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
