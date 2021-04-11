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
" highlight the current line (cul = cursorline)
set cul
" use fast terminal
set ttyfast
" redraw only when it is needed
set lazyredraw
" enable syntax
syntax on
set laststatus=2
set encoding=UTF-8
" don't show the current mode (it is shown in the status bar)
set noshowmode
" show the top status bar
set showtabline=2
set ruler
" indentation
set smartindent
set autoindent
set cindent
set wrap
set linebreak
" show matching opening/closing brackets
set showmatch
" enable mouse
set mouse=a
set go=a
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright
" }}}

" OmniCompletion {{{
" enable OmniCompletion
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set tags=../tags,tags
set path+=.,../,include/,/usr/include/

" configure menu behavior
set completeopt=longest,menuone,preview
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? "\<C-n>" :
			\ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
			\ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Use CTRL+Space for omni-completion
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
			\ "\<lt>C-n>" :
			\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
			\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
			\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Popum menu Highlight Group
highlight Pmenu ctermbg=13 guibg=LightGray
highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
highlight PmenuSbar ctermbg=7 guibg=DarkGray
highlight PmenuThumb guibg=Black
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

" Split tabs
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
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

" Goyo {{{
" press <leader>f (\f) to toggle Goyo
map <leader>f :Goyo 70% \| set linebreak<CR>
" }}}

" Set spell check to <leader>o (\o; orthography)
map <leader>o :setlocal spell!<CR>

" Cscope {{{
" \fs: Find this C symbol
nnoremap <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" \fg: Find definition
nnoremap <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" \fd: Find functions called by this function
nnoremap <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" \fc: Find functions that call this function
nnoremap <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" \ft: Find this string
nnoremap <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" \fe: Find this egrep pattern
nnoremap <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" \ff: Find this file
nnoremap <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" \fi: Find files that #include this file
nnoremap <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>
" }}}

" }}}

" Plugins {{{
" vim plug: https://github.com/junegunn/vim-plug
" install packages by running :PlugInstall inside Vim
call plug#begin('~/.vim/plugged')
" -------------------- "
" Color schemes
" Dogrun
Plug 'wadackel/vim-dogrun'
" -------------------- "
" UI
" Vim dev-icons
Plug 'ryanoasis/vim-devicons'
" Vim status bar (lightline)
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/lightline_foobar.vim'
Plug 'delphinus/lightline-delphinus'
" Vim goyo
Plug 'junegunn/goyo.vim'
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
" Code
" C code completion
Plug 'valloric/youcompleteme'
" Cscope
Plug 'brookhong/cscope.vim'
" LaTeX integration
Plug 'vim-latex/vim-latex'
call plug#end()
" }}}

" Colors {{{

" set color scheme to dogrun
" this line will be modified if running in a TTY
colorscheme dogrun

" use terminal's colors
" this line will be modified if running in a TTY
set termguicolors

" }}}

" Plugin Options {{{
" set TeX flavor to LaTeX
let g:tex_flavor = "latex"

" lightline-delphinus options
let g:lightline_delphinus_use_powerline_glyphs = 1
let g:lightline_delphinus_colorscheme = "nord_improved"

" lightline_foobar options
let g:lightline_foobar_bold = 1

" enable vim dev-icons
let g:webdevicons_enable = 1

" Make cscope silent
let g:cscope_silent = 1

" lightline settings
let g:lightline = {
	\ 'colorscheme': 'neodark_alter',
	\ 'component': {
	\		'lineinfo': ' %3l:%-2v', 
	\ },
	\ 'component_function': {
	\	 'gitbranch': 'FugitiveHead',
	\	 'readonly': 'LightlineReadonly'
	\ },
	\ 'tab_component_function': {
	\	 'tabnum': 'LightlineWebDevIcons',
	\ },
	\ }

" Check filename (LightLine)
function! LightlineFilename()
	if &buftype ==# 'terminal'
		return expand('%:p')
	elseif expand('%:t') !=# ''
		return expand('%:t')
	else
		return '[No Name]'
	endif
endfunction

" Get WebDevIcon (LightLine)
function! LightlineWebDevIcons(n)
	let l:bufnr = tabpagebuflist(a:n)[tabpagewinnr(a:n) - 1]
	return WebDevIconsGetFileTypeSymbol(bufname(l:bufnr))
endfunction

" Show RO symbol if read-only
function! LightlineReadonly() 
 	return &readonly ? 'RO' : '' 
endfunction 

" Disable stuff before entering Goyo mode,
" including lightline
function! s:goyo_enter()
	call lightline#disable()
	set noshowmode
	set noshowcmd
	set scrolloff=999
	let b:quitting = 0
	let b:quitting_bang = 0
	autocmd QuitPre <buffer> let b:quitting = 1
	cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

" Close Vim if exiting Goyo mode
function! s:goyo_leave()
	if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
		if b:quitting_bang
			qa!
		else
			qa
		endif
	endif
endfunction

" YCM {{{
" Enable signature help
let g:ycm_auto_trigger = 1
" Modify error symbol
let g:ycm_error_symbol = 'E>'
" Modify warning symbol
let g:ycm_error_symbol = 'W>'
" Add preview to Vim's completeopt
let g:ycm_add_preview_to_completeopt = 1
" Set configuration
let g:ycm_global_ycm_extra_conf = "~/.vim/plugged/youcompleteme/.ycm_extra_conf.py"
" }}}

" Vimwiki options {{{
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown', '.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
" }}}

" }}}

" Spell-checking {{{

" enable spell-checking
set nospell

" set spell-checking language to en_US
set spelllang=en_us

" enable word completion
set complete+=kspell
set wildmode=longest,list,full

" }}}

" Auto-commands {{{
" Enable Goyo by default for mutt writing
autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>
autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo

" Close Vim if exiting Goyo mode
autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()
" }}}

" Others {{{
" Disable VimInfo & ShaDa
let viminfo="/dev/null"
let viminfofile="/dev/null"
let shada="/dev/null"
let shadafile="/dev/null"
" }}}

" DO NOT REMOVE THIS LINE
" vim:foldmethod=marker:foldlevel=0
