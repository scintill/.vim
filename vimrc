source ~/.vim/misc-settings.vim
source ~/.vim/look.vim
filetype plugin on " so autocmds can be set
source ~/.vim/behavior.vim
source ~/.vim/keys.vim

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
	Bundle 'tpope/vim-markdown'
	runtime macros/matchit.vim
	Bundle 'spf13/PIV'
else
	" add red statusline as root warning
	highlight StatusLine term=bold cterm=bold ctermbg=9 ctermfg=15 gui=bold guibg=#ff0000 guifg=#ffffff
endif

" vundle needed filetype off, so re-enable now
filetype plugin indent on
