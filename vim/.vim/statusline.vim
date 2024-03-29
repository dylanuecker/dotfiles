" set colors for the status line
" 238 to remove the annoying singular column between vertical breaks
" 235 to "hide" the status line in terminal mode
highlight StatusLine ctermbg=238
highlight StatusLineTerm ctermbg=235
highlight StatusLineTermNC ctermbg=235

highlight User1 ctermbg=darkgrey
highlight User2 ctermbg=None
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
            \}

let s:default = ['%*' , '      ']

function GetColorAndMode()
    let l:colorAndMode = ""
    let l:colorAndMode ..= get(s:modes, mode(), s:default)[0]                 " set appropriate color for the current mode
    let l:colorAndMode ..= " " .. get(s:modes, mode(), s:default)[1] .. " "   " set text to current mode
    return l:colorAndMode
endfunction

function MyStatusLine()
    let l:statusline = ""                                                     " begin building the status line
    let l:focused = g:statusline_winid == win_getid()                         " is current window in focus

    if l:focused
        let l:statusline ..= GetColorAndMode()                                " show current mode in different colors
        let l:statusline ..= "%1* "                                           " set color for filename (focused window only)
    endif

    if l:focused
        let l:statusline ..= "%t "											   " display full path and the filename
    else
        let l:statusline ..= "%F"											   " display full path and the filename
    endif

	let l:statusline ..= "%2* "                                               " preserve smoothness of statuslinenc
    let l:statusline ..= "%{&spell == 0? '' : '[Spell]'}"				      " spellcheck flag
    let l:statusline ..= "%h%w%m%r"										      " help, preview, modified, and read only flag

    if l:focused
        let l:statusline ..= "%="											  " right align everything else now
        "let l:statusline ..= "%{&fileformat} | "							  " file format with | separator
        "let l:statusline ..= "%{&fileencoding? &fileencoding : &encoding} | " " file encoding with | separator
        "let l:statusline ..= "%{&filetype == ''? 'no\ ft' : &filetype} "	  " file type (no ft is displayed if none)
        let l:statusline ..= "%1* %3p%% "                                     " percentage way through file 
        let l:statusline ..= "%3* %4l:%-3v"                                   " line number followed by virtual column number
    endif

    let l:statusline ..= "%*"                                                 " set rest of statusline to background

    return l:statusline
endfunction

function TerminalStatusLine()
    let l:statusline = ""
    let l:focused = g:statusline_winid == win_getid(winnr())                  " is current window in focus
    if l:focused
        let l:statusline ..= GetColorAndMode()                                " show current mode in different color
    endif
    let l:statusline ..= "%*"                                                 " set rest of statusline to background
    return l:statusline
endfunction

augroup statusline
    " remove all autocommands from statusline group
    autocmd!                               
    autocmd CmdlineEnter * redrawstatus             " redraw status line when entering command mode
    autocmd TerminalWinOpen * setlocal statusline=%!TerminalStatusLine()
augroup END

set noshowmode                             " mode already displayed in status line
set statusline=%!MyStatusLine()            " create the status line
