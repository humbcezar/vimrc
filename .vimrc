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
set showtabline=2
set ignorecase
set smartcase

"---Visuals---"
set background=dark
colorscheme atom-dark-256
hi StatusLine ctermbg=black ctermfg=black
set relativenumber

"---Mappings---"
let g:camelcasemotion_key = '<leader>'

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
nmap <Leader>m /function<CR>zz
nmap n nzz
vnoremap * y/<c-r>0<CR>

"FuzzyFinder
set rtp+=~/.fzf
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php}"
  \ -g "!{.git,node_modules}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }
" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R --PHP-kinds=cfi --regex-php="/^[ \t]*trait[ \t]+([a-z0_9_]+)/\1/t,traits/i"'
" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-entertrl-x'

nmap <silent> <leader>o :Files<CR>
nmap <silent> <leader>t :History<CR>
nmap <silent> <leader>b :Buffers<CR>
nmap <silent> <leader>l :BLines<CR>
imap <silent> <F3> <ESC>:Snippets<CR>
nmap <silent> <leader>h :GFiles?<CR>
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
imap <leader><tab> <plug>(fzf-maps-i)
" Insert mode completion
imap <leader>w  <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <leader>f <plug>(fzf-complete-file-ag)
imap <leader>l <plug>(fzf-complete-line)
imap <leader>b <plug>(fzf-complete-buffer-line)

function! s:concat_lines(lines)
    let r = []
    for l in a:lines
        call add(r, join(split(l, ':\zs')[2:], '')) 
    endfor
    return join(r, "\n")
endfunction
inoremap <expr> <leader>; fzf#vim#complete(fzf#wrap({
  \ 'prefix': '^.*$',
  \ 'source': 'rg -n ^ --color always',
  \ 'options': '--multi --ansi --delimiter : --nth 3..',
  \ 'reducer': function('<sid>concat_lines')}))



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

"undotree
nnoremap <F5> :UndotreeToggle<cr>
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

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

function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc
nnoremap <leader>nt :call NumberToggle()<cr>

function! MyTabLine()
      let s = ''
      for i in range(tabpagenr('$'))
        " select the highlighting
        if i + 1 == tabpagenr()
          let s .= '%#TabLineSel#'
        else
          let s .= '%#TabLine#'
        endif

        " set the tab page number (for mouse clicks)
        let s .= '%' . (i + 1) . 'T'

        " the label is made by MyTabLabel()
        let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
      endfor

      " after the last tab fill with TabLineFill and reset tab page nr
      let s .= '%#TabLineFill#%T'

      " right-align the label to close the current tab page
      if tabpagenr('$') > 1
        let s .= '%=%#TabLine#%999Xclose'
      endif

      return s
    endfunction

    function! MyTabLabel(n)
      let buflist = tabpagebuflist(a:n)
      let winnr = tabpagewinnr(a:n)
      return bufname(buflist[winnr - 1])
    endfunction

set tabline=%!MyTabLine()

"----Notes----"
" press zz to center
" press gt or gT to change tabs 
"
" If you can't use universal-ctags, the --regex-php argument allows to extract traits:
" ctags -R --exclude=vendor --PHP-kinds=cfi --regex-php="/^[ \t]*trait[ \t]+([a-z0_9_]+)/\1/t,traits/i"

