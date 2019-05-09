" Max's custom .vimrc
" Load defaults
set nocompatible
set encoding=utf-8

unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

set shell=/bin/bash

filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'herrbischoff/cobalt2.vim'        " Cobalt 2
Plugin 'flazz/vim-colorschemes'          " More color schemes
Plugin 'Maxr1998/PrinterTheme'           " Color scheme for printing
Plugin 'tpope/vim-fugitive'
Plugin 'Yggdroot/indentLine'             " Leading spaces
Plugin 'wakatime/vim-wakatime'           " Time tracking
Plugin 'godlygeek/tabular'               " Markdown support
"Plugin 'plasticboy/vim-markdown'
call vundle#end()
filetype plugin indent on

" Max's Customisations
set number
set nofoldenable
set nofixendofline
set tabstop=4 " Make tabs appear 4 spaces wide

set expandtab " Convert tabs to spaces
set shiftwidth=4 " Indent width for spaces (but same as tabstop)

autocmd FileType html setlocal shiftwidth=2
autocmd FileType json setlocal shiftwidth=2
autocmd FileType yaml setlocal shiftwidth=2

autocmd FileType asm setlocal noexpandtab

" Utility macros
let @l = "/\\80i d79|l"

" PLUGIN CONFIGURATION
" Color scheme
colorscheme molokai_dark
set termguicolors

" indentLine
let g:indentLine_enabled = 0
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '.'

" vim-markdown
let g:vim_markdown_conceal = 0

" GVIM CONFIG
if has("gui_running")
    set guifont=DankMono\ 13
endif
