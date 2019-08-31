set nocompatible              " be iMproved, required

so ~/.vim/plugins.vim

syntax enable

set backspace=indent,eol,start
let mapleader  = ','
set number

"---Visuals---"

colorscheme atom-dark-256
set t_CO=256

"---Mappings---"

"Make it easy to edit Vimrc file"
nmap <Leader>ev :tabedit $MYVIMRC<cr>
"add highlight removal"
nmap <Leader><space> :nohlsearch<cr>
"make nerdtree easier to toggle"
nmap <Leader>1 :NERDTreeToggle<cr>

"--Searching---"

set hlsearch
set incsearch




"---Split Management---"
set splitbelow
set splitright
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>






"---AutoCommands---"

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END
