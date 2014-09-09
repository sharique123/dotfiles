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

NeoBundle "shougo/unite.vim"
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'unix' : 'make -f make_unix.mak',
            \    },
            \ }
NeoBundle "shougo/neocomplete.vim"
NeoBundle "rizzatti/dash.vim"
NeoBundle "kien/rainbow_parentheses.vim"
NeoBundle "scrooloose/nerdtree"
NeoBundle "scrooloose/nerdcommenter"
NeoBundle "scrooloose/syntastic"
NeoBundle "altercation/vim-colors-solarized"
NeoBundle "bling/vim-airline"
NeoBundle 'bling/vim-bufferline'
NeoBundle "tpope/vim-fugitive"
NeoBundle "tpope/vim-surround"
NeoBundle "kien/ctrlp.vim"
NeoBundle "majutsushi/tagbar"
NeoBundle "airblade/vim-gitgutter"
NeoBundle "MartinLafreniere/vim-PairTools"
NeoBundle "godlygeek/tabular"
NeoBundle "kossnocorp/janitor.vim"
NeoBundle "matze/vim-move"
NeoBundle "sickill/vim-pasta"
NeoBundle "kana/vim-textobj-user"
NeoBundle "kana/vim-textobj-syntax"
NeoBundle "terryma/vim-expand-region"
NeoBundle "Yggdroot/indentLine"
NeoBundle "bronson/vim-trailing-whitespace"
NeoBundle "sjl/gundo.vim"
NeoBundle "rking/ag.vim"
NeoBundle "Chiel92/vim-autoformat"
NeoBundle "kchmck/vim-coffee-script"

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


if has("gui_running")
    if has("gui_gtk2")
        set guifont=Inconsolata\ 14
    elseif has("gui_macvim")
        set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14
    elseif has("gui_win32")
        set guifont=Consolas:h14:cANSI
    endif

    syntax enable
    set background=dark
    colorscheme solarized

    "Save and return to Normal Mode
    iunmenu File.Save
    imenu <silent> File.Save <Esc>:if expand("%") == ""<Bar>browse confirm w<Bar>else<Bar>confirm w<Bar>endif<CR>
endif

" base editor configs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set cursorline
set colorcolumn=80,120

set relativenumber
set number

set sessionoptions-=tabpages
set sessionoptions-=help

let g:session_autoload = 0

set t_Co=256
set splitbelow
set ttimeoutlen=100

" Mapping <c-l> to clear highlighting and redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

nnoremap <silent> ~ :<C-u>call ToggleCase()<CR>

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
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:[^\n]/l0r0<CR>
vmap <Leader>a: :Tabularize /:[^\n]/l0r0<CR>
nmap <Leader>a, :Tabularize /,/<CR>
vmap <Leader>a, :Tabularize /,/<CR>
nmap <Leader>a-> :Tabularize /->[^\n]/l1r0<CR>
vmap <Leader>a-> :Tabularize /->[^\n]/l1r0<CR>

nmap <Leader>z :GundoToggle<CR>
vmap <Leader>z :GundoToggle<CR>

" ------ matze/vim-move
let g:move_key_modifier = 'C'

" ------ sickill/vim-pasta

" ------ kien/ctrlp.vim
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files --exclude-standard']
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.ctrlp']

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
nmap <leader>l :NERDTreeFind<cr>
nmap <leader>nt :NERDTreeToggle<cr>
let NERDTreeWinSize=40
let NERDTreeIgnore = ['\.pyc$', '\.css$', '\.png$','\.jpg$', '\.feature.cs$']

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


" ------ sjl/gundo.vim
nmap <Leader>z :GundoToggle<CR>
vmap <Leader>z :GundoToggle<CR>


" ------ Chiel92/vim-autoformat
noremap <Leader>f :Autoformat<CR><CR>





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
