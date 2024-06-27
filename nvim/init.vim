" Allow pasting from the OS clipboard using paste keystroke; p.
set clipboard+=unnamedplus

" Save undo-trees in file and set number of undo's saved
set undofile
set undodir=$HOME/.config/nvim/undo_hist
set undolevels=10000
set undoreload=10000

" Set line numbers
set number

" Copy indent from current line to next
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
