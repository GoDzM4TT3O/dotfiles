" To open a fold, press "zo"
" To close a fold, press "zc"
" To toggle a fold, press "za"
" To open all folds, press "zR"
" To close all folds, press "zM"
" ----------------------------- "

" Visual Options {{{
" show numbers at the left side of the terminal
set number
" show menu auto-completion options
set wildmenu
" highlight the current line
" cul = cursorline
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
" show the top status bar
set showtabline=2
set ruler
set cursorline
" indentation
set smartindent
set autoindent
set cindent
set wrap
set linebreak
" show matching opening/closing brackets
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

" Remaps {{{
"
" NOTE: <CR> means line break/enter
"
" Clipboard {{{
" NOTE: needs gVim or neoVim for clipboard capabilities
" Using CTRL+C, copy the text to global clipboard and active selection
vnoremap <C-c> "*y :let @+=@*<CR>
" Using CTRL+V, paste the text from global clipboard
map <C-v> "+P
" }}}

" Navigation buttons {{{
" use gj and gk to go up and down a line visually
noremap j gj
noremap k gk
" }}}

" Tabs {{{
" Remap CTRL+T to open a new tab
noremap <C-t> :tabnew<CR>
" Remap CTRL+N to go to the next tab
noremap <C-n> :tabn<CR>
" Remap CTRL+P to go to the previous tab
noremap <C-p> :tabp<CR>
" Remap CTRL+X to close the current tab
noremap <C-x> :tabclose<CR>
" }}}

" Tab completion {{{
imap <Tab> <C-n>
" }}}

" }}}

" Plugins {{{
" vim plug: https://github.com/junegunn/vim-plug
" install packages by running :PlugInstall inside Vim
call plug#begin('~/.vim/plugged')
" -------------------- "
" Color schemes
" nord
Plug 'arcticicestudio/nord-vim'
" dogrun
Plug 'wadackel/vim-dogrun'
" -------------------- "
" UI
" vim dev-icons
Plug 'ryanoasis/vim-devicons'
" vim status bar (lightline)
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/lightline_foobar.vim'
Plug 'delphinus/lightline-delphinus'
" -------------------- "
" VimWiki (must be used on .wiki files)
" press "\wd" to delete current wiki file
" press "\wr" to rename current wiki file
" press "\ws" to select and open wiki index file
" press "\wt" to open index.wiki file in ~/vimwiki in a new tab
" press "\ww" to open index.wiki file in ~/vimwiki
" press "Enter" to 
Plug 'vimwiki/vimwiki'
" -------------------- "
" C code completion
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif
Plug 'Shougo/deoplete-clangx'
call plug#end()
" }}}

" Plugin Options {{{

" automatically load neodark_alter theme on vim startup (VimEnter)
autocmd VimEnter * let g:lightline.colorscheme = "neodark_alter"
autocmd VimEnter * call lightline#init()
autocmd VimEnter * call lightline#colorscheme()
autocmd VimEnter * call lightline#update()

" lightline-delphinus options
let g:lightline_delphinus_use_powerline_glyphs = 1
let g:lightline_delphinus_colorscheme = "nord_improved"

" lightline_foobar options
let g:lightline_foobar_bold = 1

" enable vim dev-icons
let g:webdevicons_enable = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" }}}

" Colors {{{

" set color scheme to dogrun
" this line will be modified if running in a TTY
colorscheme dogrun

" use terminal's colors
" this line will be modified if running in a TTY
set termguicolors

" }}}

" Spell-checking {{{

" set spell-checking language to en_US
" set spell spelllang=en_us

" enable word completion
set complete+=kspell

" }}}

" DO NOT REMOVE THIS LINE
" vim:foldmethod=marker:foldlevel=0
