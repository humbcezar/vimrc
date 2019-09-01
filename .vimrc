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
set autowriteall "automatically write on switching buffers
set complete=.,w,b,u "set auto completions

"---Visuals---"
set background=dark
colorscheme atom-dark-256
"---Mappings---"

"Make it easy to edit Vimrc file"
nmap <Leader>ev :tabedit $MYVIMRC<cr>
"Make it easy to edit Vimplugin file"
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>
"add highlight removal"
nmap <Leader><space> :nohlsearch<cr>

nmap <Leader>f :tag<space>
nmap <c-_> <c-^>
nmap <Leader>es :tabedit ~/.vim/snippets/
imap <S-Tab> <C-d>
nmap <c-s> :w<cr>
imap <c-s> <Esc>:w<CR>a

"--Plugins---"
"/CtrlP
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

nmap <c-R> :CtrlPBufTag<cr>
nmap <Leader>r :CtrlPMRUFiles<cr>


"/NerdTree
let NERDTreeHijackNetrw = 0
"make nerdtree easier to toggle"
nmap <Leader>1 :NERDTreeToggle<cr>

"/Greplace.vim
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

"/Vim-php-cs-fixer
let g:php_cs_fixer_level = "psr2"
nnoremap <silent><leader>p :call PhpCsFixerFixFile()<CR>


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



"---Laravel-Specific---"

nmap <Leader>lm :!php artisan make:


"---AutoCommands---"

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

"----Notes----"
" press zz to center
" 
