DOCUMENT SYNTAX
# before lines means modes 
// before lines means commands inside modes
! before lines means commands in command mode (ESC)
----------------------------------------------------
! To enter command mode, type ESC
# To select lines, type SHIFT+V
# To select text, type v
// To copy text to the clipboard, type "*yy
// To copy text, type v
// To paste text from the clipboard, type "*p
// To paste text, type p
! To quit, type :q
! To quit without saving type :q!
! To write and quit, type :wq
# To enter insert mode, type i
# To enter replace mode, type SHIFT+R
! To delete a line, type dd
----------------------------------------------------
INSTALL VIM PACKAGES
vim-plug and vim-pathogen are already included.
Simply run ":PlugInstall" inside vim.
----------------------------------------------------
CUSTOM KEYBINDINGS / REMAPS

I also remapped a few keys:

CTRL+C -> (needs gvim) copy selected text to global clipboard
CTRL+V -> paste text into vim
QQ -> quit without saving (same as ZQ)
WS -> save the file but don't quit (same as :w)
