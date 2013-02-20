se ts=4
se et
se sw=4
se ai
se cin
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
:nmap <C-e> :e#<CR> " return to last buffer
:nmap <C-n> :bnext<CR>
:nmap <C-p> :bprev<CR>

"set backup
"set backupdir=~/tmp/vim
set directory=~/tmp/vim
"set writebackup
