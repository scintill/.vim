" simple settings
set nocompatible
set nomodeline " I don't use modelines and would prefer not to use others' for now
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
set cindent
set timeoutlen=350
set ttimeoutlen=75
set history=1000

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set directory=~/tmp/vim " get swap files out of working directories
set undofile " persistent undo history
set undodir=~/tmp/vim
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs - powerline

set shell=/bin/bash " system() wasn't working with my fish shell, or even /bin/sh (dash)

