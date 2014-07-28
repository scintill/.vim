" make j and k move logical-line-wise (wrapped), not physical line. swap with g[jk] so I can have the default behavior too
nnoremap <unique> j gj
nnoremap <unique> k gk
nnoremap <unique> gj j
nnoremap <unique> gk k

" better search
set incsearch
set ignorecase
set smartcase
set hlsearch

set hidden " allow dirty buffers

let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_match_window = 'results:20'

let g:gitgutter_diff_args = '-w'
let g:gitgutter_diff_args_svn = '-w'
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 1

autocmd FileType * set formatoptions-=o " disable 'Automatically insert the current comment leader after hitting o in Normal mode.'

let g:syntastic_javascript_checkers = ['jshint']

" matchit puts <> into matchpairs, so explicitly here set to exclude that
let delimitMate_matchpairs = "(:),[:],{:}"

" http://vim.wikia.com/wiki/Improved_hex_editing
" ex command for toggling hex mode
command -bar Hexmode call ToggleHex()
" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction
