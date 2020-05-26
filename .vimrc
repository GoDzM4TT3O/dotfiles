" VIM OPTIONS
set laststatus=2
set encoding=utf-8
" enable 256bit colors
set t_Co=256
" enable syntax
syntax on
" set colorscheme to nord
colorscheme nord
" show numbers at the left side of the terminal
set number
" highlight search results
set hlsearch
set termguicolors
filetype plugin indent on
" <--------------------------->

" CLIPBOARD - NOTE: needs gvim for clipboard capabilities
" Using CTRL+C, copy the text to global clipboard and active selection
vnoremap <C-c> "*y :let @+=@*<CR>
" Using CTRL+V, paste the text from global clipboard
map <C-v> "+P
" <--------------------------->

" PLUGINS
" vim pathogen: https://github.com/tpope/vim-pathogen
" Install vim-airline and vim-airline-themes:
" git clone https://github.com/vim-airline/vim-airline
" mv vim-airline ~/.vim/bundle/vim-airline
" git clone https://github.com/vim-airline/vim-airline-themes
" mv vim-airline ~/.vim/bundle/vim-airline-themes
" Install vim-css-color:
" git clone https://github.com/ap/vim-css-color
" mv vim-css-color/{after,autoload,syntax}/* ~/.vim
execute pathogen#infect()
" vim plug: https://github.com/vim-plug
" install packages by running :PlugInstall inside Vim
call plug#begin('~/.vim/plugged')
Plug 'chrisbra/Colorizer'
" nord-vim color scheme
Plug 'arcticicestudio/nord-vim'
" vim status bar
" After running ":PlugInstall" run ":AirlineTheme deus"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Install Colorizer
" wget https://raw.github.com/chrisbra/color_highlight/master/Colorizer.vmb
" vim Colorizer.vmb
" :so %
" reopen vim
" <--------------------------->

" PLUGIN OPTIONS
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:colorizer_auto_filetype='css,html,js,php,conf,config,ini'
" <--------------------------->
