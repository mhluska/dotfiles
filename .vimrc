" Required for Vundle (package manager).
set nocompatible 
filetype off    

" Set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'ctrlpvim/ctrlp.vim'

" Required for Vundle (package manager).
call vundle#end()            " required
filetype plugin indent on    " required

" Enable synax highlighting.
syntax enable

" Set a color scheme. Do it silently to avoid errors during setup.
silent! colorscheme molokai

" Enable line numbers.
set number

" Sets a hard text wrap at 80 characters with visual indicators.
set textwidth=79 colorcolumn=80,120
autocmd BufNewFile,BufRead * setlocal formatoptions+=t 

" Convert tabs to 4 spaces.
set expandtab tabstop=4 shiftwidth=4

" Map the main command for the `ctrlp.vim` plugin. 
let g:ctrlp_map = '<c-p>'
