set nocompatible               " Be iMproved
let mapleader = "\\"

if empty(glob('~/.nvim/autoload/plug.vim'))
  silent !mkdir -p ~/.nvim/autoload
  silent !curl -fLo ~/.nvim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.nvim/bundle')

Plug 'tpope/vim-sensible'
Plug 'rstacruz/vim-opinion'
Plug 'tpope/vim-eunuch'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'shougo/unite.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make -f make_mac.mak' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer --omnisharp-completer' }
Plug 'marijnh/tern_for_vim', { 'do': 'npm install'}
Plug 'othree/tern_for_vim_coffee', { 'do': 'npm install tern-coffee'}
Plug 'SirVer/ultisnips'
Plug 'brendanjerwin/dash.vim'
Plug 'kien/rainbow_parentheses.vim'
if !has("gui_vimr")
    Plug 'scrooloose/nerdtree'
endif
Plug 'scrooloose/nerdcommenter'
Plug 'brendanjerwin/neomake', {'branch': 'eslint'}
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'kien/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'DavidEGx/ctrlp-smarttabs'
Plug 'airblade/vim-gitgutter'
Plug 'MartinLafreniere/vim-PairTools'
Plug 'godlygeek/tabular'
Plug 'kossnocorp/janitor.vim'
Plug 'matze/vim-move'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-syntax'
Plug 'terryma/vim-expand-region'
Plug 'Yggdroot/indentLine'
Plug 'ntpeters/vim-better-whitespace'
Plug 'sjl/gundo.vim'
Plug 'rking/ag.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'kchmck/vim-coffee-script'
Plug 'vim-scripts/actionscript.vim--Leider'
Plug 'vim-scripts/ActionScript-3-Omnicomplete'
Plug 'xolox/vim-misc'
Plug 'lilydjwg/colorizer'
Plug 'vim-scripts/matchit.zip'
Plug 'terryma/vim-multiple-cursors'
Plug 'kshenoy/vim-signature'
Plug 'svermeulen/vim-easyclip'
Plug 'sheerun/vim-polyglot'
Plug 'toyamarinyon/vim-swift'
Plug 'embear/vim-localvimrc'
Plug 'jdonaldson/vaxe'
Plug 'majutsushi/tagbar'
Plug 'Floobits/floobits-neovim'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] }
Plug 'justinmk/vim-gtfo'
Plug 'christoomey/vim-tmux-navigator'
Plug 'wellle/tmux-complete.vim'
Plug 'cespare/vim-toml'

call plug#end()

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
set autowrite

let g:session_autoload = 0

set t_Co=256
set splitbelow
set splitright
set ttimeoutlen=50

set wildchar=<Tab> wildmenu wildmode=full
set smartcase
set magic
set hlsearch
highlight Pmenu guifg=#586e75 guibg=#eee8d5

set background=dark
" solarized options
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

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

noremap <leader>tn :tabnext<cr>
noremap <leader>tp :tabprevious<cr>
noremap <leader>tt :CtrlPSmartTabs<cr>

" smart help
command! -nargs=1 -complete=help Help if &ft=~"help" | help <args> | else | tab help <args> | endif

" ------ neomake
autocmd BufWritePost *.py,*.js Neomake

" ------ wellle/tmux-complete.vim
let g:tmuxcomplete#trigger = 'omnifunc'

" ------ majutsushi/tagbar
noremap <leader>tb :TagbarOpenAutoClose<cr>

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

" ------ ycm
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" ------ kein/rainbow_parentheses
"Parentheses colours using Solarized
let g:rbpt_colorpairs = [
            \ [ '13', '#6c71c4'],
            \ [ '5',  '#d33682'],
            \ [ '1',  '#dc322f'],
            \ [ '9',  '#cb4b16'],
            \ [ '3',  '#b58900'],
            \ [ '2',  '#859900'],
            \ [ '6',  '#2aa198'],
            \ [ '4',  '#268bd2'],
            \ ]

" Enable rainbow parentheses for all buffers
augroup rainbow_parentheses
    au!
    au VimEnter * RainbowParenthesesActivate
    au BufEnter * RainbowParenthesesLoadRound
    au BufEnter * RainbowParenthesesLoadSquare
    au BufEnter * RainbowParenthesesLoadBraces
augroup END

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

" ------ embear/vim-localvimrc
let g:localvimrc_sandbox = 0
let g:localvimrc_whitelist = '/Users/brendanjerwin/Projects/\(readytraining\|grc\)/.*'

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
let g:ctrlp_extensions = ['quickfix', 'smarttabs']
let g:ctrlp_buftag_ctags_bin = '/usr/local/bin/ctags'
let g:ctrlp_buftag_types = {
            \ 'actionscript' : '--language-force=actionscript',
            \ 'haxe' : '--language-force=haxe'
            \ }

" ------ Yggdroot/indentLine
let g:indentLine_char = '┆'

" ------ rizzatti/dash.vim
set keywordprg=dash
:nmap <silent> K <Plug>DashSearch

let g:dash_map = {
            \ 'ruby'       : 'rails',
            \ 'python'     : 'python2',
            \ 'javascript' : 'backbone',
            \ 'cs'         : 'net',
            \ 'haxe'       : ['haxe', 'actionscript']
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

let g:pairtools_haxe_pairclamp = 1
let g:pairtools_haxe_tagwrench = 0
let g:pairtools_haxe_jigsaw = 1
let g:pairtools_haxe_autoclose = 1
let g:pairtools_haxe_forcepairs = 0
let g:pairtools_haxe_closepairs = "(:),[:],{:},':',\":\""
let g:pairtools_haxe_smartclose = 1
let g:pairtools_haxe_smartcloserules = '\w'
let g:pairtools_haxe_apostrophe = 0
let g:pairtools_haxe_antimagic = 1
let g:pairtools_haxe_antimagicfield = "Comment"
let g:pairtools_haxe_pcexpander = 1
let g:pairtools_haxe_pceraser = 1
let g:pairtools_haxe_tagwrenchhook = 'tagwrench#BuiltinNoHook'
let g:pairtools_haxe_twexpander = 0
let g:pairtools_haxe_tweraser = 0

"
" ------ scrooloose/syntastic
"let g:syntastic_auto_jump=2
"let g:syntastic_check_on_open=1
"let g:syntastic_quiet_messages = {'level': 'warnings'}
"let g:syntastic_auto_loc_list=1
"let g:syntastic_echo_current_error=1

"let g:syntastic_error_symbol='✗>'
"let g:syntastic_warning_symbol='⚠>'

"let g:syntastic_mode_map = { 'mode': 'active',
            "\ "active_filetypes": ['javascript'],
            "\ "passive_filetypes": ['handlebars', 'haxe'] }

"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_actionscript_mxmlc_compiler = '/Applications/Apache\ Flex/bin/mxmlc'

"let g:syntastic_haxe_auto_jump=0

" ------ sjl/gundo.vim
nmap <leader>z :GundoToggle<CR>
vmap <leader>z :GundoToggle<CR>


" ------ Chiel92/vim-autoformat
noremap <leader>f :Autoformat<CR><CR>

" ------- tmux
nnoremap <silent> C-j :TmuxNavigateDown<cr>
nnoremap <silent> C-k :TmuxNavigateUp<cr>


" ------ ntpeters/vim-better-whitespace
let g:better_whitespace_filetypes_blacklist=['vim-plug']

" ------ soramugi/auto-ctags
let g:auto_ctags = 1
let g:auto_ctags_bin_path = '/usr/local/bin/ctags'

function! RemoveWhitespace()
  if &bin | return | endif
  if search('\s\+$', 'n')
    let line = line('.')
    let col = col('.')
    sil %s/\s\+$//ge
    call cursor(line, col)
  endif
endf

" ****** javascript files
function! OnJavascript()
  "noremap <buffer> K :TernDoc<cr>
  noremap <buffer> <leader>rr :TernRename<cr>
endf
autocmd BufRead,BufNewFile *.js call OnJavascript()

" ****** coffescript files
function! OnCoffeeScript()
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
function! CleanActionScript()
    let l:save_cursor = getpos('.')

    "if(true )doSomething( param )
    silent! %s/\s*(/(/pg
    silent! %s/(\s/(/pg
    silent! %s/\s)/)/pg
    silent! %s/if(\s*\([^)]*\))\s*/if (\1) /pg
    silent! %s/\([=/&-*%|]\)(/\1 (/pg

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

"****** Haxe
autocmd BufRead,BufNewFile *.hx map <buffer> <leader>f :call CleanHaxe()<CR>
function! CleanHaxe()
    let l:save_cursor = getpos('.')

    "if(true )doSomething( param )
    silent! %s/\s*(/(/pg
    silent! %s/(\s/(/pg
    silent! %s/\s)/)/pg
    silent! %s/if(\s*\([^)]*\))\s*/if (\1) /pg
    silent! %s/\([=/&-*%|]\)(/\1 (/pg

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

    call RemoveWhitespace()
    call histdel('search', -1) " @/ isn't changed by a function, cp. |function-search-undo|
    call setpos('.', l:save_cursor)
    :retab
    Autoformat()
endfunction
