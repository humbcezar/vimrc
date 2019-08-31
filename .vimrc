set nocompatible              " be iMproved, required

so ~/.vim/plugins.vim

syntax enable

set backspace=indent,eol,start
let mapleader  = ','
set number
set tabstop=4
set shiftwidth=4
set expandtab
"set shellcmdflag=-ic

"---Visuals---"

colorscheme atom-dark-256
set t_CO=256

"---Mappings---"

"Make it easy to edit Vimrc file"
nmap <Leader>ev :tabedit $MYVIMRC<cr>
"Make it easy to edit Vimplugin file"
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>
"add highlight removal"
nmap <Leader><space> :nohlsearch<cr>

nmap <Leader>f :tag<space>
nmap <c-_> <c-^>

"--Plugins---"
"/CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
nmap <c-R> :CtrlPBufTag<cr>
nmap <Leader>r :CtrlPMRUFiles<cr>


"/NerdTree
let NERDTreeHijackNetrw = 0
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





"----Notes----"
" press zz to center
" 
