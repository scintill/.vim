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
highlight CursorLineNr guifg=#404040 guibg=#000000
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
nmap <unique> <space> :nohlsearch<CR>

" buffer nav
nmap <unique> <C-e> <C-^>|" return to last buffer
nmap <unique> <C-n> :bnext<CR>
nmap <unique> <C-p> :bprev<CR>
set hidden " allow dirty buffers
" window nav
noremap <unique> <C-h> <C-w>h
noremap <unique> <C-j> <C-w>j
noremap <unique> <C-k> <C-w>k
noremap <unique> <C-l> <C-w>l
noremap <unique> <C-c> <C-w>c
" train to stop using these
map <silent> <unique> <C-w>h :echo "Nope!"<CR>
map <silent> <unique> <C-w>j :echo "Nope!"<CR>
map <silent> <unique> <C-w>k :echo "Nope!"<CR>
map <silent> <unique> <C-w>l :echo "Nope!"<CR>
map <silent> <unique> <C-w>c :echo "Nope!"<CR>

" ctrlp
let g:ctrlp_map = ';'
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'rw'

nmap <unique> <Leader>f :NERDTreeToggle<CR>

" fancy powerline
set guifont=Droid\ Sans\ Mono\ for\ Powerline
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'solarized256'

" git-gutter
nmap <unique> <Leader>ct :GitGutterToggle<CR>
nmap <unique> <Leader>cu :GitGutterAll<CR>
nmap <unique> ]h <Plug>GitGutterNextHunk
nmap <unique> [h <Plug>GitGutterPrevHunk
let g:gitgutter_diff_args = '-w'
let g:gitgutter_diff_args_svn = '-w'
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" misc utils and shortcuts
nmap <unique> <Leader>s :%s/\s\+$//<CR>|" delete trailing whitespace
nmap <unique> <Leader>p :set paste!<CR>
nnoremap <silent> <unique> <Leader>w :confirm write<CR>
nmap <unique> <Tab> >>
nmap <unique> <S-Tab> <<
inoremap <unique> <C-D> <C-R>=strftime("%c")<CR>
nmap <unique> <Leader>n :set relativenumber!<CR>
" nerd-commenter mappings
let g:NERDCreateDefaultMappings = 0
let g:NERDMenuMode = 0
map <unique> <Leader>cc <Plug>NERDCommenterToggle
map <unique> <Leader>co <Plug>NERDCommenterComment
map <unique> <Leader>ci <Plug>NERDCommenterUncomment

" PIV
let g:DisableAutoPHPFolding = 1
let g:phpcomplete_complete_for_unknown_classes = 0
let g:phpcomplete_parse_docblock_comments = 1
let g:phpcomplete_cache_taglists = 1

" for better safety, don't run plugins as root - I will try to stop running
" vim as root anyway. everything above should be safe for root
if system("whoami") != "root\n"
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
	Bundle 'tpope/vim-surround'
	Bundle 'scrooloose/nerdcommenter'
	Bundle 'tpope/vim-repeat'
	Bundle 'vim-scripts/IndexedSearch'
	Bundle 'tpope/vim-eunuch'
	"Bundle 'tpope/vim-characterize'
	runtime macros/matchit.vim
	Bundle 'spf13/PIV'
else
	" use snapshot elflord, plus red statusline as root warning
	colorscheme elflord-256-snapshot
	highlight StatusLine term=bold cterm=bold ctermbg=9 ctermfg=15 gui=bold guibg=#ff0000 guifg=#ffffff
endif

" vundle needed filetype off, so now enable and apply some customizations
filetype plugin indent on
autocmd FileType * set formatoptions-=o " disable 'Automatically insert the current comment leader after hitting o in Normal mode.'
