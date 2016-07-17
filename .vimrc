" Required for Vundle (package manager).
set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-fugitive'
Plugin 'flazz/vim-colorschemes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'othree/yajs.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'godlygeek/tabular'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tomtom/tcomment_vim'
Plugin 'edkolev/tmuxline.vim'

" Required for Vundle (package manager).
call vundle#end()            " required
filetype plugin indent on    " required

" Enable synax highlighting.
syntax enable

" Set a color scheme. Do it silently to avoid errors during setup.
set background=dark
silent! colorscheme solarized

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
  \__pycache__\|build'

map <c-\> :Tabularize /=<CR>

" Make cycling buffers with keys easier.
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

" Automatically center the search term.
nmap n nzz

" Add shortcut for opening this file.
nmap <leader>ev :vsplit $MYVIMRC<cr>

" Enable mouse scrolling.
set mouse=a

" Make mouse scrolling smoother.
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" Strip whitespace on save.
autocmd BufWritePre * StripWhitespace

" Add incremental searching (press Enter to remove highlight).
set hlsearch incsearch
nnoremap <CR> :noh<CR><CR>

" Make split screens appear right and below.
set splitright splitbelow

" Enable the status line plugin even when a split is not created.
set laststatus=2

" Make backspace work when removing indentation. See:
" http://vi.stackexchange.com/a/2163
set backspace=indent,eol,start

" Show open buffers.
let g:airline#extensions#tabline#enabled = 1

" Enable status line glyphs.
let g:airline_powerline_fonts = 1

" Auto-reload this file when it changes.
augroup myvimrc
	autocmd!
	autocmd BufWritePost .vimrc,_vimrc,vimrc windo source $MYVIMRC
augroup END

" Auto-reload the `ctrlp.vim` cache on focus or file write.
augroup CtrlPExtension
    autocmd!
    autocmd BufWritePost * CtrlPClearCache
augroup END
