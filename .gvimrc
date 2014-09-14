function! s:SetHighlightForTags()
    "SOLARIZED HEX
    "--------- -------
    "base03    #002b36
    "base02    #073642
    "base01    #586e75
    "base00    #657b83
    "base0     #839496
    "base1     #93a1a1
    "base2     #eee8d5
    "base3     #fdf6e3
    "yellow    #b58900
    "orange    #cb4b16
    "red       #dc322f
    "magenta   #d33682
    "violet    #6c71c4
    "blue      #268bd2
    "cyan      #2aa198
    "green     #859900

    highlight vimFuncNameTag gui=underline guisp='#268bd2'
    highlight vimFunctionScriptTag gui=underline guisp='#268bd2'
    highlight vimAutoGroupTag gui=underline guisp='#268bd2'
    highlight vimCommandTag gui=underline guisp='#268bd2'

endfunction

if has("gui_gtk2")
    set guifont=Inconsolata\ 15
elseif has("gui_macvim")
    set guifont=Menlo\ for\ Powerline:h15

    macmenu &File.New\ Tab key=<nop>

    "Save and return to Normal Mode
    iunmenu File.Save
    imenu <silent> File.Save <Esc>:if expand("%") == ""<Bar>browse confirm w<Bar>else<Bar>confirm w<Bar>endif<CR>
elseif if has("gui_vimr")
    set guifont=Menlo\ Regular\ for\ Powerline:h15
elseif has("gui_win32")
    set guifont=Consolas:h15:cANSI
endif

syntax enable
set background=dark
colorscheme solarized
