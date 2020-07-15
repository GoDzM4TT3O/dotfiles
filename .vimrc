" To open a fold, press "zo"
" To close a fold, press "zc"
" To toggle a fold, press "za"
" To open all folds, press "zR"
" To close all folds, press "zM"


" Colors {{{
" enable 256bit colors
set t_Co=256
" set termguicolors
" set colorscheme to nord
" colorscheme nord
" set colorscheme to monokai
colorscheme monokai
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
set encoding=UTF-8
" don't show the current mode
" (it is shown in the status bar)
set noshowmode
set lcs=extends:❯,precedes:❮,tab:>-
set ruler
set cursorline
set smartindent
set autoindent
set wrap
set linebreak
set showmatch
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
" markdown table helper
Plug 'dhruvasagar/vim-table-mode'
" vim dev-icons
Plug 'ryanoasis/vim-devicons'
" vim status bar (lightline)
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/lightline_foobar.vim'
" vim status bar (vim-airline)
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
call plug#end()
" }}}

" Plugin Options {{{
" vim-airline options
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
" lightline options
let g:lightline = {
      \ 'colorscheme': 'neodark_alter',
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ }
      \ }
let g:lightline_foobar_bold = 1

function! MyFiletype()
	  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
	return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" enable vim dev-icons
let g:webdevicons_enable = 1
" }}}

" DO NOT REMOVE THIS LINE
" vim:foldmethod=marker:foldlevel=0
