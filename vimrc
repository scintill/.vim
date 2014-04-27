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

" colors, highlights, gutter columns
syntax on
autocmd Syntax * syntax match ExtraWhitespace /\s\+\%#\@<!$/ containedin=ALL " highlight trailing ws, except when editing
autocmd InsertLeave * redraw! " show when editing stops
augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO\|FIXME\|XXX', -1)
augroup END

let g:gitgutter_sign_added = '· '
let g:gitgutter_sign_modified = '· '
let g:gitgutter_sign_removed = '𝂂 '
let g:gitgutter_sign_modified_removed = ', '

set relativenumber
set numberwidth=3

colorscheme elflord-custom-CSAsnapshot

" make j and k move logical-line-wise (wrapped), not physical line. swap with g[jk] so I can have the default behavior too
noremap <unique> j gj
noremap <unique> k gk
noremap <unique> gj j
noremap <unique> gk k

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
let g:ctrlp_match_window = 'results:20'

nmap <unique> <Leader>f :NERDTreeToggle<CR>

" airline config - old powerline font
set guifont=Droid\ Sans\ Mono\ for\ Powerline
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols = {}
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
let g:airline_symbols.space = ' '
let g:airline_theme = 'powerline_solarized256'
let g:airline#extensions#default#layout = [['a', 'b', 'c', 'gap'], ['x', 'y', 'z', 'warning']]
let g:airline_section_gap = '' " the section is meant to be empty so we can give it the dark highlight powerline did
let g:airline#extensions#hunks#non_zero_only = 1

" git-gutter
nmap <unique> <Leader>ct :GitGutterToggle<CR>
nmap <unique> <Leader>cu :GitGutterAll<CR>
nmap <unique> ]h <Plug>GitGutterNextHunk
nmap <unique> [h <Plug>GitGutterPrevHunk
let g:gitgutter_diff_args = '-w'
let g:gitgutter_diff_args_svn = '-w'
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 1

" misc utils and shortcuts
nmap <unique> <silent> <Leader>s :%s/\s\+$//<CR>:nohlsearch<CR>|" delete trailing whitespace
nmap <unique> <silent> <Leader>h :syntax clear ExtraWhitespace<CR>
map <unique> <Leader><S-P> :set paste!<CR>
map <unique> <Leader>p :put +<CR>
map <unique> <Leader><Leader>p "+P
map <unique> <Leader>x "+y

nnoremap <silent> <unique> <Leader>w :confirm write<CR>
nmap <unique> <Tab> >>
nmap <unique> <S-Tab> <<
vmap <unique> <Tab> >
vmap <unique> <S-Tab> <
inoremap <unique> <C-D> <C-R>=strftime("%c")<CR>

" https://github.com/gpakosz/.vim/blob/vanilla/.vimrc#L115-L154
" cycles between relative, hybrid, absolute, none
function! RelativeNumberCycle()
  if (&number == 1 && &relativenumber == 1)
	silent set nonumber
	silent set relativenumber relativenumber?
  elseif (&number == 0 && &relativenumber == 1)
	silent set norelativenumber
	silent set number number?
  elseif (&number == 1 && &relativenumber == 0)
	silent set norelativenumber
	silent set nonumber number?
  else
	silent set number
	silent set relativenumber relativenumber?
  endif
endfunc
function! NumberToggle()
	if (&number || &relativenumber)
		silent set nonumber
		silent set norelativenumber
	else
		silent set nonumber
		silent set relativenumber
	endif
endfunc
nmap <silent> <unique> <Leader>n :call NumberToggle()<CR>
nmap <silent> <unique> <Leader>m :call RelativeNumberCycle()<CR>

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
	"Bundle 'vim-scripts/CSApprox'
	Bundle 'kien/ctrlp.vim'
	Bundle 'scrooloose/nerdtree'
	Bundle 'scintill/vim-gitgutter'
	Bundle 'scrooloose/syntastic'
	Bundle 'tpope/vim-fugitive'
	Bundle 'scintill/vim-airline'
	Bundle 'rking/ag.vim'
	Bundle 'tpope/vim-surround'
	Bundle 'scrooloose/nerdcommenter'
	Bundle 'tpope/vim-repeat'
	Bundle 'vim-scripts/IndexedSearch'
	Bundle 'tpope/vim-eunuch'
	Bundle 'elzr/vim-json'
	"Bundle 'tpope/vim-characterize'
	runtime macros/matchit.vim
	Bundle 'spf13/PIV'
else
	" add red statusline as root warning
	highlight StatusLine term=bold cterm=bold ctermbg=9 ctermfg=15 gui=bold guibg=#ff0000 guifg=#ffffff
endif

" vundle needed filetype off, so now enable and apply some customizations
filetype plugin indent on
autocmd FileType * set formatoptions-=o " disable 'Automatically insert the current comment leader after hitting o in Normal mode.'
