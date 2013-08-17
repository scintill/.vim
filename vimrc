" simple settings
set nocompatible
set tabstop=4
set noexpandtab
set shiftwidth=4
set autoindent
set cindent
set timeoutlen=350
set formatoptions-=o " disable 'Automatically insert the current comment leader after hitting o in Normal mode.'

set directory=~/tmp/vim " get swap files out of working directories
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs - powerline

set shell=/bin/bash " system() wasn't working with my fish shell, or even /bin/sh (dash)

" colors, highlights, gutter columns
syntax on
autocmd Syntax * syn match ExtraWhitespace /\s\+\%#\@<!$/ containedin=ALL " highlight trailing ws, except when editing
autocmd InsertLeave * redraw! " show when editing stops

let g:gitgutter_sign_added = '· '
let g:gitgutter_sign_modified = '· '
let g:gitgutter_sign_removed = '𝂂 '
let g:gitgutter_sign_modified_removed = ', '

set relativenumber
set numberwidth=3

colorscheme elflord
highlight SignColumn guifg=Cyan guibg=#121212
highlight LineNr guifg=#404040 guibg=#000000
highlight! link CursorLineNr LineNr
highlight ExtraWhitespace guibg=red
highlight GitGutterAdd    guifg=#009900 guibg=#121212
highlight GitGutterChange guifg=#bbbb00 guibg=#121212
highlight GitGutterDelete guifg=#ff2222 guibg=#121212
highlight! link GitGutterChangeDelete GitGutterDelete

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
nmap <C-e> <C-^>|" return to last buffer
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>
set hidden " allow dirty buffers
" window nav
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" train to stop using these
map <silent> <C-w>h :echo "Nope!"<CR>
map <silent> <C-w>j :echo "Nope!"<CR>
map <silent> <C-w>k :echo "Nope!"<CR>
map <silent> <C-w>l :echo "Nope!"<CR>

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
let g:gitgutter_diff_args_git = '-w'
let g:gitgutter_diff_args_svn = '-w'

" misc utils
nmap <Leader>s :%s/\s\+$//<CR>|" delete trailing whitespace
nmap <Leader>p :set paste!<CR>

" autocompletion
" "Hacking Vim by Kim Shulz" via http://blogs.gnome.org/lharris/2008/07/20/code-completion-with-vim-7/
 function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction
inoremap <Tab> <C-R>=SuperCleverTab()<cr>

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
Bundle 'rking/ag.vim'

filetype plugin indent on
