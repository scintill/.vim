let g:ctrlp_map = ';'
let g:NERDCreateDefaultMappings = 0
let g:NERDMenuMode = 0

" defer these, so <unique> will throw an error if a plugin binds them
autocmd VimEnter * call s:MapsInit()
function! s:MapsInit()
	" http://stackoverflow.com/q/9054780 http://stackoverflow.com/a/16750393
	" Space toggles search highlighting (or just turns off in older vims)
	" The next search will automatically re-enable highlighting.
	if exists('v:hlsearch')
		nnoremap <unique> <silent> <space> :let v:hlsearch = 1 - v:hlsearch<CR>
	else
		nmap <unique> <space> :nohlsearch<CR>
	endif

	" buffer nav
	nmap <unique> <C-e> <C-^>|" return to last buffer
	nmap <unique> <C-n> :bnext<CR>
	nmap <unique> <C-p> :bprev<CR>

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

	nmap <unique> <Leader>f :NERDTreeToggle<CR>

	nmap <unique> <Leader>ct :GitGutterToggle<CR>
	nmap <unique> <Leader>cu :GitGutterAll<CR>

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
	xmap <Tab> >
	xmap <unique> <S-Tab> <
	" xmap <Tab> was bound by snipmate, so rebind:
	xmap <unique> <Leader><Tab> <Plug>snipMateVisual
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

	map <unique> <Leader>cc <Plug>NERDCommenterToggle
	map <unique> <Leader>co <Plug>NERDCommenterComment
	map <unique> <Leader>ci <Plug>NERDCommenterUncomment
endfunction
