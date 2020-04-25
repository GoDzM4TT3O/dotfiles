set laststatus=2
set encoding=utf-8
set t_Co=256
syntax on
colorscheme nord
set number
set hlsearch
set termguicolors
" vim plug: https://github.com/vim-plug
" install packages by running :PlugInstall inside Vim
call plug#begin('~/.vim/plugged')
" nord-vim color scheme
Plug 'arcticicestudio/nord-vim'
" vim status bar
" After running ":PlugInstall" run ":AirlineTheme deus"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
" vim pathogen: https://github.com/tpope/vim-pathogen
" Install vim-airline and vim-airline-themes:
" git clone https://github.com/vim-airline/vim-airline
" mv vim-airline ~/.vim/bundle/vim-airline
" git clone https://github.com/vim-airline/vim-airline-themes
" mv vim-airline ~/.vim/bundle/vim-airline-themes
execute pathogen#infect()
filetype plugin indent on
