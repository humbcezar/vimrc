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
hi StatusLine ctermbg=black ctermfg=black
"---Mappings---"

"Make it easy to edit Vimrc file"
nmap <Leader>ev :tabedit $MYVIMRC<cr>
"Make it easy to edit Vimplugin file"
nmap <Leader>epp :tabedit ~/.vim/plugins.vim<cr>
"add highlight removal"
nmap <Leader><space> :nohlsearch<cr>

nmap <Leader>f :tag<space>
nmap <c-_> <c-^>
nmap <Leader>/ <c-^>
nmap <Leader>es :tabedit ~/.vim/snippets/
imap <S-Tab> <C-d>
nmap <c-s> :w<cr>
imap <c-s> <Esc>:w<CR>
"--Plugins---"
"/CtrlP
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'top,order:btt,min:1,max:70,results:100'
"nmap <c-R> :CtrlPBufTag<cr>
nmap <Leader>r :CtrlPMRUFiles<cr>
nmap <Leader>pl <C-P><C-\>w
nmap <Leader>m /function<CR>zz
nmap <Leader>g <C-P><C-\>w
vmap <Leader>g y<Esc><C-P><C-\>r"<CR>
nmap n nzz

"/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
nmap <Leader>sr :SyntasticReset<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 3 
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_php_phpmd_exec = '/usr/bin/phpmd'
let g:syntastic_php_phpmd_post_args = 'cleancode,codesize,controversial,design,unusedcode'
let g:syntastic_php_checkers = ['php', 'phpmd']
let g:syntastic_quiet_messages = { 'regex': [
            \'Avoid using static access',
            \'has a coupling between objects value',
            \'Single Responsibility Principle violation',
            \'Avoid unused parameters',
            \'Avoid really long methods',
            \'Avoid really long classes'] }


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


"/phpcd
imap <Leader>c <c-x><c-o>


"/ refactoring-browser
let g:vim_php_refactoring_make_setter_fluent = 2

"/ Ack

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
" Automatically open & close quickfix window
autocmd QuickFixCmdPost [^l]* nested cwindow


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
let @m="A::shouldReceive()\<CR>->once()\<CR>->with()\<CR>->andReturnSelf();\<Esc>" "shouldReceive...

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

"https://engagor.github.io/blog/2017/02/15/vim-ide-exploring-code/
"
"
"
" PHP Find Implementations
function! PhpImplementations(word)
    exe 'Ack "implements.*' . a:word . ' *($|{)"'
endfunction

" PHP Find Subclasses
function! PhpSubclasses(word)
    exe 'Ack "extends.*' . a:word . ' *($|{)"'
endfunction

noremap <Leader>fi :call PhpImplementations('<cword>')<CR>
noremap <Leader>fe :call PhpSubclasses('<cword>')<CR>

" PHP Find Usage
function! PhpUsage(word)
    exe 'Ack "::' . a:word . '\(|>' . a:word . '\("'
endfunction

noremap <Leader>fu :call PhpUsage('<cword>')<CR>

"functions
"copy filename to clipboard
function! FilenameToClipboard()
    let @+=@%
endfunction
nmap <C-F> :call FilenameToClipboard()<CR>


"----Notes----"
" press zz to center
" press gt or gT to change tabs 
"
" If you can't use universal-ctags, the --regex-php argument allows to extract traits:
" ctags -R --exclude=vendor --PHP-kinds=cfi --regex-php="/^[ \t]*trait[ \t]+([a-z0_9_]+)/\1/t,traits/i"

