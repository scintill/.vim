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

" airline config - powerline font
set guifont=Droid\ Sans\ Mono\ for\ Powerline
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols = {}
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_theme = 'powerline_solarized256'
let g:airline#extensions#default#layout = [['a', 'b', 'c', 'gap'], ['x', 'y', 'z', 'warning']]
let g:airline_section_gap = '' " the section is meant to be empty so we can give it the dark highlight powerline did
let g:airline#extensions#hunks#non_zero_only = 1

" Bold the file name, but not the path.
" This function derived from vim-powerline's GetFilepath()
function! AirlineFiledir()
	let dirsep = has('win32') && ! &shellslash ? '\' : '/'
	let filepath = expand('%:p')

	if empty(filepath)
		return ''
	endif

	let ret = fnamemodify(filepath, ':~:.:h')

	if ret == '.'
		let ret = ''
	else
		let ret = ret . dirsep
	endif

	return ret
endfunction
function! s:AirlineInit()
	if exists('g:loaded_airline') && g:loaded_airline
		call airline#parts#define_function('filedir', 'AirlineFiledir')
		call airline#parts#define_raw('filetail', '%t%m')
		call airline#parts#define_accent('filetail', 'bold')

		let g:airline_section_c = airline#section#create(['%<', 'filedir', 'filetail', g:airline_symbols.space, 'readonly'])
	endif
endfunction
autocmd VimEnter * call s:AirlineInit()

" PIV
let g:DisableAutoPHPFolding = 1
let g:phpcomplete_complete_for_unknown_classes = 0
let g:phpcomplete_parse_docblock_comments = 1
let g:phpcomplete_cache_taglists = 1

