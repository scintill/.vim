se ts=4
se et
se sw=4
se ai
se cin

set directory=~/tmp/vim " get swap files out of working directories
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs - powerline

set shell=/bin/bash " system() wasn't working with my fish shell, or even /bin/sh (dash)

" load plugins
call pathogen#infect()

colors elflord

" make j and k move logical-line-wise (wrapped), not physical line
"http://statico.github.com/vim.html
:nmap j gj
:nmap k gk

" better search
:set incsearch
:set ignorecase
:set smartcase
:set hlsearch
:nmap \h :set hlsearch!<CR>

" buffer nav
:nmap <C-e> :e#<CR>|" return to last buffer
:nmap <C-n> :bnext<CR>
:nmap <C-p> :bprev<CR>
:set hidden " allow dirty buffers

" ctrlp
let g:ctrlp_map = ';'
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'rw'

:nmap \f :NERDTreeToggle<CR>

" fancy powerline
set guifont=Droid\ Sans\ Mono\ for\ Powerline
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'solarized256'

" svndiff
let g:svndiff_one_sign_delete = 1
let g:svndiff_autoupdate = 1
hi DiffAdd      ctermfg=0 ctermbg=2 guibg='green'
hi DiffDelete   ctermfg=0 ctermbg=1 guibg='red'
hi DiffChange   ctermfg=0 ctermbg=3 guibg='yellow'
"autocmd BufWinEnter * call Svndiff("prev") " need to figure out how to make this work in help windows, etc., or when a file is otherwise not in VCS
:nmap <F5> :call Svndiff("prev")<CR>
