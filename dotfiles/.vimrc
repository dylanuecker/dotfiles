" Author:      Dylan Uecker
" Last Change: 2022 Sep 4 

syntax on                   " enable syntax highlighting
filetype plugin indent on   " allow file type specific options
set number                  " turn on line numbers
set laststatus=2            " always show status line (even with only single window)
set wildmenu                " visual autocomplete for commands
set noshowmatch             " stop brief jump on highlight match
set tabstop=4               " tab width is 4 spaces
set shiftwidth=4            " indent also with 4 spaces
set bs=indent,eol,start     " make my backspace work again!
set colorcolumn=120         " vertical ruler for 120 characters per line
set splitbelow              " horizontal splits
set splitright              " vertical splits
"set spell                   " turn spellcheck on
set nowrap                  " hate line wrapping
set formatoptions-=cro      " stop continuing comments

" use jk to enter normal mode from insert mode 
inoremap jk <ESC>l

" remove newbie crutches
for key in ['<Down>', '<Left>', '<Right>', '<Up>']
	exec 'noremap' key '<Nop>'
	exec 'noremap!' key '<Nop>'
endfor

" ~./vim/colors
if (has("termguicolors")) " for vim >= 8.0
	set termguicolors
endif
colorscheme tender 

" set color of vertical ruler
highlight ColorColumn ctermbg=black guibg=#2E3436
" set colors for the status line
highlight User1 ctermbg=darkgrey 
highlight User2 ctermbg=black guibg=#2E3436
highlight User3 ctermbg=grey ctermfg=black
highlight User4 ctermbg=green ctermfg=black
highlight User5 ctermbg=blue ctermfg=black
highlight User6 ctermbg=magenta ctermfg=black
highlight User7 ctermbg=yellow ctermfg=black
highlight User8 ctermbg=red ctermfg=black

" many more than this, should be adding when encountered    
let s:modes = {
			\ 'n'       :  ['%4*', 'NORMAL'], 
			\ 'i'       :  ['%5*', 'INSERT'],
			\ 'v'       :  ['%6*', 'VISUAL'],
			\ 'V'       :  ['%6*', 'V-LINE'],
			\ "\<C-V>"  :  ['%6*', 'VBLOCK'],
			\ 'R'       :  ['%7*', 'REPLCE'],
			\ 'c'       :  ['%8*', 'COMMND'],
			\ 'default' :  ['%*' , 'UNKNWN'],
			\}

function MyStatusLine()
	let l:statusline = ""                                                    " begin building the status line
	let l:statusline ..= get(s:modes,mode(),'default')[0]                    " set appropriate color for the current mode
	let l:statusline ..= " " .. get(s:modes, mode(), 'default')[1]           " set text to current mode
	let l:statusline ..= " %1* %F "                                          " display full path and the filename
	let l:statusline ..= "%2* %{&spell == 0? '' : '[Spell]'}"                " spellcheck flag
	let l:statusline ..= "%h%w%m%r "                                         " help, preview, modified, and read only flag
	let l:statusline ..= "%="                                                " right align everything else now
	let l:statusline ..= "%{&fileformat} | "                                 " file format with | separator
	let l:statusline ..= "%{&fileencoding? &fileencoding : &encoding} | "    " file encoding with | separator
	let l:statusline ..= "%{&filetype == ''? 'no\ ft' : &filetype} "         " file type (no ft is displayed if none)
	let l:statusline ..= "%1* %3p%% "                                        " percentage way through file 
	let l:statusline ..= "%3* %4l:%-3v"                                      " line number followed by virtual column number
	return l:statusline
endfunction

augroup statusline
	" remove all autocommands from statusline group
	autocmd!                               
	autocmd CmdlineEnter * redrawstatus    " redraw status line when entering command mode
augroup END

set noshowmode                             " mode already displayed in status line
set statusline=%!MyStatusLine()            " create the status line

