" ---------------Custom---------------
" File Types & Syntax Highlighting
filetype on
filetype plugin on
filetype indent on
syntax enable
set nocompatible
set number
set ts=4
set expandtab
set autoindent
set shiftwidth=4
set nobackup
set ruler
set bg=dark
set mouse=a
set cursorline
set backspace=2
" Search Settings
set incsearch
set ignorecase
highlight LineNr cterm=bold ctermfg=brown ctermbg=NONE
highlight CursorLineNr cterm=bold ctermfg=Yellow ctermbg=NONE
au FileType html,css set shiftwidth=2

:inoremap ( ()<LEFT>
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<LEFT>
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<LEFT>
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " <c-r>=Quote('"')<CR>
:inoremap ' <c-r>=Quote("'")<CR>
:inoremap <CR> <c-r>=OpenBracket('}')<CR>
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
		        return "\<Right>"
	else
			    return a:char
	endif
endfunction

function! Quote(char)
    if getline('.')[col('.') - 1] == a:char
		        return "\<Right>"
	else
			    return a:char . a:char . "\<Left>"
	endif
endfunction

function! OpenBracket(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<CR>\<ESC>\O"
    else
        return "\<CR>"
    endif
endfunction
