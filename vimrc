" simple settings
set nocompatible
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set cindent
set timeoutlen=350

set directory=~/tmp/vim " get swap files out of working directories
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs - powerline

set shell=/bin/bash " system() wasn't working with my fish shell, or even /bin/sh (dash)

" colors and highlights
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+\%#\@<!$/ containedin=ALL " highlight trailing ws, except when editing
autocmd InsertLeave * redraw! " show when editing stops

let g:gitgutter_highlights=0
autocmd ColorScheme * highlight lineAdded    guifg=#009900 guibg=#121212
autocmd ColorScheme * highlight lineModified guifg=#bbbb00 guibg=#121212
autocmd ColorScheme * highlight lineRemoved  guifg=#ff2222 guibg=#121212
let g:gitgutter_signs=0
sign define GitGutterLineAdded           text=·  texthl=lineAdded    linehl=NONE
sign define GitGutterLineModified        text=·  texthl=lineModified linehl=NONE
sign define GitGutterLineRemoved         text=𝂂  texthl=lineRemoved  linehl=NONE
sign define GitGutterLineModifiedRemoved text=,  texthl=lineModified linehl=NONE

syntax on
colorscheme elflord
highlight SignColumn guifg=Cyan guibg=#121212

" make j and k move logical-line-wise (wrapped), not physical line
nmap j gj
nmap k gk

" better search
set incsearch
set ignorecase
set smartcase
set hlsearch
nmap <Leader>h :set hlsearch!<CR>

" buffer nav
nmap <C-e> :e#<CR>|" return to last buffer
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>
set hidden " allow dirty buffers

" ctrlp
let g:ctrlp_map = ';'
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'rw'

nmap <Leader>f :NERDTreeToggle<CR>

" fancy powerline
set guifont=Droid\ Sans\ Mono\ for\ Powerline
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'solarized256'

" git-gutter
nmap <Leader>c :ToggleGitGutter<CR>
nmap <Leader>cn :GitGutterNextHunk<CR>
nmap <Leader>cp :GitGutterPrevHunk<CR>

" misc utils
nmap <Leader>s :%s/\s\+$//<CR>|" delete trailing whitespace


" bootstrap vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" plugins
Bundle 'vim-scripts/CSApprox'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scintill/vim-gitgutter'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'

filetype plugin indent on
