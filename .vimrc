syntax enable

set backspace=indent,eol,start
let mapleader  = ','
set number


"---Visuals---"

colorscheme atom-dark-256

"---Mappings---"

"Make it easy to edit Vimrc file"
nmap <Leader>ev :tabedit $MYVIMRC<cr>
"add highlight removal"
nmap <Leader><space> :nohlsearch<cr>


"--Searching---"

set hlsearch
set incsearch


"---AutoCommands---"

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
