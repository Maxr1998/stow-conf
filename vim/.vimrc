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

"Plugin 'tomasr/molokai'                 " Original Molokai
Plugin 'flazz/vim-colorschemes'          " More color schemes
Plugin 'Maxr1998/PrinterTheme'           " Color scheme for printing
Plugin 'Yggdroot/indentLine'             " Mark leading spaces
Plugin 'PeterRincker/vim-argumentative'  " Argument magic
Plugin 'tpope/vim-fugitive'              " git integration
if has("python3")
    Plugin 'ycm-core/YouCompleteMe'      " Auto-complete
    Plugin 'Shougo/defx.nvim'            " File browser
endif
Plugin 'junegunn/goyo.vim'               " Writing mode
Plugin 'lervag/vimtex'                   " TeX support
Plugin 'godlygeek/tabular'               " Markdown support
Plugin 'dag/vim-fish'
Plugin 'wakatime/vim-wakatime'           " Time tracking
call vundle#end()
filetype plugin indent on

" Max's customisations
set number
set nofoldenable
set nofixendofline
set tabstop=4 " Make tabs appear 4 spaces wide
set expandtab " Convert tabs to spaces
set shiftwidth=4 " Indent width for spaces

" Shiftwidth customisations by language
autocmd FileType html setlocal shiftwidth=2
autocmd FileType json setlocal shiftwidth=2
autocmd FileType yaml setlocal shiftwidth=2
autocmd FileType tex  setlocal linebreak

" Disable quote concealing in JSON files
let g:vim_json_conceal = 0

" Utility macros
let @l = "/\\80i d79|l" " sanitize \\ indention

" PLUGIN CONFIGURATION
" Color scheme
colorscheme molokai_dark
set termguicolors

" indentLine
let g:indentLine_enabled = 0
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '.'

" Set vimtex flavor
let g:tex_flavor = 'latex'

" vim-markdown
let g:vim_markdown_conceal = 0

" Goyo
autocmd FileType tex Goyo 120x95%

function! s:goyo_leave()
    quit
endfunction

autocmd! User GoyoLeave nested call <SID>goyo_leave()

" GVIM CONFIG
if has("gui_running")
    set guifont=DankMono\ 13
endif
