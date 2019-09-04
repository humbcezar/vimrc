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
set laststatus=2 "set statusline on

"---Visuals---"
set background=dark
colorscheme atom-dark-256
hi StatusLine ctermbg=black ctermfg=white
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
imap <c-s> <Esc>:w<CR>
"--Plugins---"
"/CtrlP
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'
let g:ctrlp_show_hidden = 1

"nmap <c-R> :CtrlPBufTag<cr>
nmap <Leader>r :CtrlPMRUFiles<cr>

"/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php']

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

"/pdv
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>

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


"-----PHP-macros------"
let @a='yiw/}O$	pa = $pa;/__constructOprotected $pa;/", ' "assign protected property to class on constructor


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

if has("autocmd")
    augroup templates
        autocmd!
        autocmd BufNewFile *Test.php 0r ~/.vim/templates/skeleton_test.php
        autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
        autocmd BufNewFile *.php if expand('%') !~ 'Test' | 0r ~/.vim/templates/skeleton.php
        autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
        " parse special text in the templates after the read
    augroup END
endif

"----Notes----"
" press zz to center
" press gt or gT to change tabs 
