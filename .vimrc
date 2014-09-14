let mapleader = "\\"

if has('vim_starting')
    set nocompatible               " Be iMproved

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'tpope/vim-sensible'
NeoBundle 'shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \    },
            \ }
NeoBundle 'shougo/neocomplete.vim'
NeoBundle 'shougo/neosnippet.vim'
NeoBundle 'shougo/neosnippet-snippets'
NeoBundle 'rizzatti/dash.vim'
NeoBundle 'kien/rainbow_parentheses.vim'
if !has("gui_vimr")
    NeoBundle 'scrooloose/nerdtree'
endif
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'FelikZ/ctrlp-py-matcher'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'MartinLafreniere/vim-PairTools'
NeoBundle 'godlygeek/tabular'
NeoBundle 'kossnocorp/janitor.vim'
NeoBundle 'matze/vim-move'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-syntax'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'vim-scripts/actionscript.vim--Leider'
NeoBundle 'vim-scripts/ActionScript-3-Omnicomplete'
NeoBundle 'xolox/vim-misc'
NeoBundle 'ap/vim-css-color'
NeoBundle 'spolu/dwm.vim'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'svermeulen/vim-easyclip'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

if has("gui_running")
    if has("gui_gtk2")
        set guifont=Inconsolata\ 15
    elseif has("gui_macvim")
        set guifont=Menlo\ for\ Powerline:h15
    elseif if has("gui_vimr")
        set guifont=Menlo\ for\ Powerline:h15
    elseif has("gui_win32")
        set guifont=Consolas:h15:cANSI
    endif
endif

" base editor configs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set list
set nobackup
set noswapfile

set cursorline
set colorcolumn=80,120

set relativenumber
set number

set sessionoptions-=tabpages
set sessionoptions-=help

set autoindent
set smartindent
set smarttab

let g:session_autoload = 0

set t_Co=256
set splitbelow
set splitright
set ttimeoutlen=50

set wildchar=<Tab> wildmenu wildmode=full
set smartcase
set magic
set hlsearch

" Mapping <c-l> to clear highlighting and redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

"<esc> to clear search markers
nnoremap <esc> :noh<return><esc>

"fucking beeps!
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" no arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" ------ shougo/unite.vim
nnoremap <D-F> :Unite grep:.<cr>

let g:unite_source_history_yank_enable = 1
nnoremap <leader>y :<C-u>Unite history/yank<CR>

let g:unite_source_grep_max_candidates = 200

if executable('ag')
  " Use ag in unite grep source.
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
  \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
  \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt = ''
elseif executable('pt')
  " Use pt in unite grep source.
  " https://github.com/monochromegane/the_platinum_searcher
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
  " Use ack in unite grep source.
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts =
  \ '-i --no-heading --no-color -k -H'
  let g:unite_source_grep_recursive_opt = ''
endif

" ------ tpope/vim-fugative
" Go to the Commit for a tree or blob with C
autocmd User fugitive
            \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
            \   nnoremap <buffer> .. :edit %:h<CR> |
            \ endif

autocmd BufReadPost fugitive://* set bufhidden=delete

" ------ bling/vim-airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" ------ shougo/neocomplete.vim
" Use neocomplete.
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
" Don't Use smartcase.
let g:neocomplete#enable_smart_case = 0
let g:neocomplete#enable_auto_close_preview = 0
let g:neocomplete#enable_refresh_always = 1
let g:neocomplete#enable_cursor_hold_i = 1

inoremap <expr> <c-k> pumvisible() ? "\<c-p>":"\<c-x><c-p>"
inoremap <expr> <c-j> pumvisible() ? "\<c-n>":"\<c-x><c-p>"
call neocomplete#custom#source('_', 'sorters', [])

if !exists('g:neocomplete#sources')
    let g:neocomplete#sources = {}
endif

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.cs = '.*[^;]'
let g:neocomplete#sources.cs = ['omni']

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" ------ godlygeek/tabular
nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>a: :Tabularize /:[^\n]/l0r0<CR>
vmap <leader>a: :Tabularize /:[^\n]/l0r0<CR>
nmap <leader>a, :Tabularize /,/<CR>
vmap <leader>a, :Tabularize /,/<CR>
nmap <leader>a-> :Tabularize /->[^\n]/l1r0<CR>
vmap <leader>a-> :Tabularize /->[^\n]/l1r0<CR>

nmap <leader>z :GundoToggle<CR>
vmap <leader>z :GundoToggle<CR>

" ------ matze/vim-move
let g:move_key_modifier = 'C'

" ------ ssvermeulen/vim-easyclip
let g:EasyClipAutoFormat = 1
let g:EasyClipAlwaysMoveCursorToEndOfPaste = 1

let g:EasyClipUseCutDefaults = 0
nmap x <Plug>MoveMotionPlug
xmap x <Plug>MoveMotionXPlug
nmap xx <Plug>MoveMotionLinePlug

" ------ kien/ctrlp.vim
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files --exclude-standard']
let g:ctrlp_lazy_update = 350
let g:ctrlp_max_files = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.ctrlp']
if !has('python')
    echo 'In order to use pymatcher plugin, you need +python compiled vim'
else
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif
let g:ctrlp_extensions = ['buffertag', 'quickfix']
let g:ctrlp_buftag_ctags_bin = '/usr/local/bin/ctags'
let g:ctrlp_buftag_types = {
            \ 'actionscript' : '--language-force=actionscript'
            \ }

nmap <c-t> :CtrlPBufTag<CR>

" ------ Yggdroot/indentLine
let g:indentLine_char = '┆'

" ------ rizzatti/dash.vim
set keywordprg=dash
:nmap <silent> K <Plug>DashSearch

let g:dash_map = {
            \ 'ruby'       : 'rails',
            \ 'python'     : 'python2',
            \ 'javascript' : 'backbone',
            \ 'cs'         : 'net'
            \ }

" ------ scrooloose/nerdtree
if !has("gui_vimr")
    nmap <leader>l :NERDTreeFind<cr>
    nmap <leader>nt :NERDTreeToggle<cr>
    let NERDTreeWinSize=40
    let NERDTreeIgnore = ['\.pyc$', '\.css$', '\.png$','\.jpg$', '\.feature.cs$', '\.orig$']
    let NERDTreeQuitOnOpen = 1
endif

" ------ MartinLafreniere/vim-PairTools
let g:pairtools_coffee_pairclamp = 1
let g:pairtools_coffee_tagwrench = 0
let g:pairtools_coffee_jigsaw = 1
let g:pairtools_coffee_autoclose = 1
let g:pairtools_coffee_forcepairs = 0
let g:pairtools_coffee_closepairs = "(:),[:],{:},':',\":\""
let g:pairtools_coffee_smartclose = 1
let g:pairtools_coffee_smartcloserules = '\w'
let g:pairtools_coffee_apostrophe = 0
let g:pairtools_coffee_antimagic = 1
let g:pairtools_coffee_antimagicfield = "Comment"
let g:pairtools_coffee_pcexpander = 1
let g:pairtools_coffee_pceraser = 1
let g:pairtools_coffee_tagwrenchhook = 'tagwrench#BuiltinNoHook'
let g:pairtools_coffee_twexpander = 0
let g:pairtools_coffee_tweraser = 0

"
" ------ scrooloose/syntastic
let g:syntastic_auto_jump=2
let g:syntastic_check_on_open=1
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_auto_loc_list=1
let g:syntastic_echo_current_error=1

let g:syntastic_error_symbol='✗>'
let g:syntastic_warning_symbol='⚠>'

let g:syntastic_mode_map = { 'mode': 'active',
            \ "active_filetypes": [],
            \ "passive_filetypes": ['handlebars'] }

"let g:syntastic_coffee_coffeelint_post_args = '--csv --file ~/coffeelint.json'
let g:syntastic_actionscript_mxmlc_compiler = '/Applications/Apache\ Flex/bin/mxmlc'

" ------ sjl/gundo.vim
nmap <leader>z :GundoToggle<CR>
vmap <leader>z :GundoToggle<CR>


" ------ Chiel92/vim-autoformat
noremap <leader>f :Autoformat<CR><CR>


" ------ szw/vim-tags
let g:vim_tags_auto_generate = 1
let g:vim_tags_ctags_binary = '/usr/local/bin/ctags'
let g:vim_tags_use_vim_dispatch = 1


" ------ shougo/neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif



" ****** coffescript files
function OnCoffeeScript()
    setlocal tabstop=2
    setlocal shiftwidth=2
    setlocal softtabstop=2

    setlocal foldmethod=indent
    setlocal nofoldenable
    setlocal expandtab

    setlocal colorcolumn=120
    setlocal nobomb

    setlocal omnifunc=syntaxcomplete#Complete

    if expand("%:p") =~ ".spec.coffee$"
        setlocal filetype=coffee.mocha
        map <buffer> <M-s> :w<kEnter>:call RunSpecificTestsInScreen()<CR>
        imap <buffer> <M-s> <Esc>:w<kEnter>:call RunSpecificTestsInScreen()<CR>
    endif

    " spec-runner
    map <buffer> <leader>T :call RunAllTestsInScreen()<CR>
    map <buffer> <leader>t :call RunLocalTestsInScreen()<CR>
    map <buffer> <leader>t. :call RunSpecificTestsInScreen()<CR>
    map <buffer> <leader>D :call DebugAllTestsInScreen()<CR>
    map <buffer> <leader>d :call DebugLocalTestsInScreen()<CR>
    map <buffer> <leader>d. :call DebugSpecificTestsInScreen()<CR>
    map <buffer> <leader>tl :call RunLastTestsInScreen()<CR>
endfunction

autocmd BufRead,BufNewFile *.coffee call OnCoffeeScript()


" ****** actionscript files
autocmd BufRead,BufNewFile *.as set filetype=actionscript
let tlist_actionscript_settings = 'actionscript;c:class;f:method;p:property;v:variable'

autocmd BufRead,BufNewFile *.as map <buffer> <leader>f :call CleanActionScript()<CR>
function CleanActionScript()
    let l:save_cursor = getpos('.')

    "if(true )doSomething( param )
    silent! %s/\s*(/(/pg
    silent! %s/(\s/(/pg
    silent! %s/\s)/)/pg
    silent! %s/if(\s*\([^)]*\))\s*/if (\1) /pg

    silent! %s/)\s*\n\s*{/) {/pg
    silent! %s/}\s*\n\s*else\s*\n\s*{/} else {/pg
    silent! %s/}\s*\n\s*else if (/} else if (/pg
    silent! %s/}else/} else/pg
    silent! %s/else{/else {/pg

    silent! %s/try\s*\n\s*{/try {/pg
    silent! %s/}\s*\n\s*catch/} catch/pg

    silent! %s/function\(.*\)\n\s*{/function\1 {/pg

    " remove useless heading comments
    silent! %s/\/\**\n\s*\* Function.*\n\s*\**\///pg
    silent! %s/\/\**\n\s*\* Class.*\n\s*\**\///pg

    call histdel('search', -1) " @/ isn't changed by a function, cp. |function-search-undo|
    call setpos('.', l:save_cursor)
    Autoformat()
endfunction
