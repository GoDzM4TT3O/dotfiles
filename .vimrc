" To open a fold, press "zo"
" To close a fold, press "zc"
" To toggle a fold, press "za"
" To open all folds, press "zR"
" To close all folds, press "zM"


" Colors {{{
" enable 256bit colors
set t_Co=256
set termguicolors
" set colorscheme to nord
colorscheme nord
" }}}

" Visual Options {{{
" show numbers at the left side of the terminal
set number
" show menu autocompletion options
set wildmenu
" highlight the current line
" cul is aka cursorline
set cul
" use fast terminal
set ttyfast
" redraw only when it is needed
set lazyredraw
filetype plugin indent on
" enable syntax
syntax on
set laststatus=2
set encoding=utf-8
" }}}

" Search {{{
" highlight search results
set hlsearch
" case insensitive search
set ignorecase
" smart case matching
set smartcase
" search as characters are entered
set incsearch
" }}}

" Folds {{{
" enable folding
set foldenable
" open most folds by defaults
set foldlevelstart=10
" }}}

" Clipboard {{{
" NOTE: needs gvim for clipboard capabilities
" Using CTRL+C, copy the text to global clipboard and active selection
vnoremap <C-c> "*y :let @+=@*<CR>
" Using CTRL+V, paste the text from global clipboard
map <C-v> "+P
" }}}

" Plugins {{{
" vim plug: https://github.com/junegunn/vim-plug
" install packages by running :PlugInstall inside Vim
call plug#begin('~/.vim/plugged')
" nord-vim color scheme
Plug 'arcticicestudio/nord-vim'
" vim status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" markdown table helper
Plug 'dhruvasagar/vim-table-mode'
" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
" }}}

" Plugin Options {{{
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
" }}}

" DO NOT REMOVE THIS LINE
" vim:foldmethod=marker:foldlevel=0
