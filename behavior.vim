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

set hidden " allow dirty buffers

let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_match_window = 'results:20'

let g:gitgutter_diff_args = '-w'
let g:gitgutter_diff_args_svn = '-w'
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 1

autocmd FileType * set formatoptions-=o " disable 'Automatically insert the current comment leader after hitting o in Normal mode.'
