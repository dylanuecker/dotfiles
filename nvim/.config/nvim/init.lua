-- apply init.lua changes on saving
local autocmd = vim.api.nvim_create_autocmd
autocmd('BufWritePost', {pattern = 'init.lua', command = 'source $MYVIMRC'})

--
vim.opt.number = true       -- turn on line numbers
vim.opt.mouse  = 'a'        -- enable mouse for every mode
--vim.opt.syntax = true       -- enable syntax highlighting

--[[
syntax on                   " enable syntax highlighting
filetype plugin indent on   " allow file type specific options
set laststatus=2            " always show status line (even with only single window)
set wildmenu                " visual autocomplete for commands
set noshowmatch             " stop brief jump on highlight match
set tabstop=4               " tab width is 4 spaces
set shiftwidth=4            " indent also with 4 spaces
set bs=indent,eol,start     " make my backspace work again!
set splitbelow              " horizontal splits
set splitright              " vertical splits
"set spell                   " turn spellcheck on
set nowrap                  " hate line wrapping
"set formatoptions-=cro      " stop continuing comments
"set iskeyword-=_            " ease of mobility using lower_case_snake_case
set clipboard=unnamedplus   " use with +clipboard feature
set shortmess-=S            " show search count message
set incsearch               " move cursor to matched string, while typing the search pattern
set autochdir               " change directory to file
set expandtab               " always use spaces
--]]

vim.keymap.set("i", "jk", "<Esc>l") -- use jk to enter normal mode from insert mode 

vim.opt.guicursor:append("a:blinkon100")  -- blink cursor

-- TODO keybinds for selecting splits
