" Required for Vundle (package manager).
set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'othree/yajs.vim'
Plugin 'tpope/vim-sleuth'
Plugin 'Raimondi/delimitMate'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'godlygeek/tabular'
Plugin 'bling/vim-airline'

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

" Map the main command for the `ctrlp.vim` plugin to Ctrl-P.
let g:ctrlp_map = '<c-p>'

" Avoid searching library files.
let g:ctrlp_custom_ignore = 'bower_components\|node_modules\|DS_Store\|git\|
  \__pycache__'

" Open tabs by default.
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<c-t>'],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

map <c-\> :Tabularize /=<CR>

" Make cycling buffers with keys easier.
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

" Automatically center the search term.
nmap n nzz

" Enable mouse scrolling.
set mouse=a

" Strip whitespace on save.
autocmd BufWritePre * StripWhitespace

" Add incremental searching (press Enter to remove highlight).
set hlsearch incsearch
nnoremap <CR> :noh<CR><CR>

" Make split screens appear right and below.
set splitright splitbelow

" Enable the status line plugin even when a split is not created.
set laststatus=2

" Show open buffers.
let g:airline#extensions#tabline#enabled = 1

" Enable status line glyphs.
let g:airline_powerline_fonts = 1
